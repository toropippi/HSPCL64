#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
#include <windows.h>
#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <sstream>

#include <map>
#include <CL/cl.h>
#include "hsp3plugin.h"
#include "hsp3struct.h"
#include "hspvar_int64.h"
#include "errmsg.h"
#include "RGB.h"

const int MAX_PLATFORM_IDS = 32;//platform_id�̍ő�l
const int MAX_DEVICE_IDS = 2048;//��x�Ɏ擾�ł���device�̍ő�l
int CL_EVENT_MAX = 65536;//cl_event���L�����Ēu����ő吔
int COMMANDQUEUE_PER_DEVICE = 4;//1�f�o�C�X������̃R�}���h�L���[�A�ݒ�ŕύX�ł���
int dev_num = 0;//�S�v���b�g�t�H�[���̃f�o�C�X�̍��v��
int bufferout[1024 * 4];
char* source_str;
cl_device_id *device_id;
cl_context *context;
cl_command_queue *command_queue;
cl_mem mem_obj;
cl_program program;
cl_kernel kernel;
cl_event* cppeventlist;//c++�ŊǗ�����event object�BHSP���炢�����̂͂��������BHCLinit�Ŏ��̉��B���������[�N�\�h�ړI�B�����̒��ɂ���event�̂ݏ���ێ����A����ȊO��event�͕K��release���Ĕj������
cl_event* event_wait_list;//HCLinit�Ŏ��̉��B����event��wait������cl�֐����g���ۂɂ��炩���߂����ݒ肵�Ă����Ă����C���[�W
std::map <cl_kernel, std::string>  nums;


struct EventStruct
{
	INT64 k;//kernel id���R�s�[�T�C�Y���
	int globalsize;
	int localsize;
};

EventStruct* evinfo;


int clsetdev = 0;//OpenCL�Ō��݃��C���ƂȂ��Ă���f�o�C�Xno
int clsetque = 0;//OpenCL�Ō��݃��C���ƂȂ��Ă���que
int cmd_properties = 0;//OpenCL�̃R�}���h�L���[�������Ɏg���v���p�e�B�ԍ�
int num_event_wait_list = 0;//NDRangeKernel �Ƃ��Ŏg����B�g���x��0�ɂȂ�





//����֐�
//int64������ǂݍ��ނ��
INT64 Code_getint64() {
	int prm;
	prm = code_getprm();					// �����l���擾(�f�t�H���g�Ȃ�)
	if (prm <= PARAM_END) puterror(HSPERR_NO_DEFAULT);
	// �p�����[�^1:���l
	return *(INT64 *)HspVarInt64_Cnv(mpval->pt, mpval->flag);
}
//int32,int64�����̓��͂��ꍇ�����œǂݍ��ނ��
INT64 Code_geti32i64() {
	int chk = code_getprm();							// �p�����[�^�[���擾(�^�͖��Ȃ�)
	int type = mpval->flag;							// �p�����[�^�[�̌^���擾
	void* ppttr;

	int sizeofff;
	switch (type) {
	case 8:								// �p�����[�^�[��int64��������
	{
		ppttr = (INT64 *)mpval->pt;
		sizeofff = 8;
		break;
	}
	case HSPVAR_FLAG_INT:									// �p�����[�^�[��������������
	{
		ppttr = (int *)mpval->pt;
		sizeofff = 4;
		break;
	}
	default:
		puterror(HSPERR_TYPE_MISMATCH);			// �T�|�[�g���Ă��Ȃ��^�Ȃ�΃G���[
		break;
	}
	return *(INT64*)ppttr;
}


cl_event* GetWaitEvlist()
{
	if (num_event_wait_list == 0)
	{
		return NULL;
	}
	else
	{
		return event_wait_list;
	}
}

std::string readFileIntoString(const std::string& path) {
	std::ifstream input_file(path);
	if (!input_file.is_open()) {
		std::cerr << "Could not open the file - '"
			<< path << "'" << std::endl;
		exit(EXIT_FAILURE);
	}
	return std::string((std::istreambuf_iterator<char>(input_file)), std::istreambuf_iterator<char>());
}

cl_program WithSource_func(cl_context contxt,std::string s_source, std::string s_option)
{
	size_t sz = s_source.length();
	auto sp = s_source.c_str();
	cl_program program = clCreateProgramWithSource(contxt, 1, (const char**)&sp, (const size_t*)&sz, NULL);
	cl_int err0 = clBuildProgram(program, 1, &device_id[clsetdev], s_option.c_str(), NULL, NULL);
	if (err0 != CL_SUCCESS) retmeserr7(device_id[clsetdev], program);
	return program;
}

////////////����֐������܂�








// 64bit dll call
__declspec(align(16)) extern "C" INT64 __fastcall call_extfunc64(void *proc, INT64 *prm, INT64 *pinfo, INT64 prms);
__declspec(align(16)) extern "C" double __fastcall call_extfunc64d(void *proc, INT64 *prm, INT64 *pinfo, INT64 prms);
__declspec(align(16)) extern "C" float __fastcall call_extfunc64f(void *proc, INT64 *prm, INT64 *pinfo, INT64 prms);

 /*------------------------------------------------------------*/
/*
		controller
*/
/*------------------------------------------------------------*/

static INT64 ref_int64val;						// �Ԓl�̂��߂̕ϐ�
static double ref_doubleval;						// �Ԓl�̂��߂̕ϐ�
static float ref_floatval;						// �Ԓl�̂��߂̕ϐ�
static int ref_int32val;						// �Ԓl�̂��߂̕ϐ�

static void *reffunc( int *type_res, int cmd )
{
	//		�֐��E�V�X�e���ϐ��̎��s���� (�l�̎Q�Ǝ��ɌĂ΂�܂�)
	//
	//			'('�Ŏn�܂邩�𒲂ׂ�
	//
	if ( *type != TYPE_MARK ) puterror( HSPERR_INVALID_FUNCPARAM );
	if ( *val != '(' ) puterror( HSPERR_INVALID_FUNCPARAM );
	code_next();

	bool fDouble = false;
	bool fFloat = false;
	bool fInt = false;
	
	switch( cmd ) {							// �T�u�R�}���h���Ƃ̕���

	case 0x00:								// int64�֐�
	{
		int prm;
		prm = code_getprm();					// �����l���擾(�f�t�H���g�Ȃ�)
		if (prm <= PARAM_END) puterror(HSPERR_NO_DEFAULT);
		ref_int64val = *(INT64 *)HspVarInt64_Cnv(mpval->pt, mpval->flag);
		break;
	}
	case 0x01:								// qpeek�֐�
	{
		PVal *pval;
		APTR aptr = code_getva(&pval);
		int size = pval->size;
		
		p1 = code_geti();
		if (p1<0) throw HSPERR_ILLEGAL_FUNCTION;
		if (p1+8>size) throw HSPERR_ILLEGAL_FUNCTION;
		ref_int64val = *(INT64 *)((pval->pt) + p1);
		break;
	}
	case 0x03:								// varptr64
	{
		PVal *pval;
		APTR aptr;
		STRUCTDAT *st;
		if (*type == TYPE_DLLFUNC) {
			st = &(ctx->mem_finfo[*val]);
			ref_int64val = (INT64)(st->proc);
			code_next();
			break;
		}
		aptr = code_getva(&pval);

		HspVarProc *phvp;
		phvp = exinfo->HspFunc_getproc(pval->flag);
		ref_int64val = (INT64)phvp->GetPtr(pval);

		break;
	}
	case 0x05:	// callfunc64i
	case 0x06:	// callfunc64d
	case 0x07:	// callfunc64f
	{
		// 1�p��= �p�����^(INT64�ϐ�), 2�p��= �p�����^�̌^(INT64�ϐ�), 3�p�� = �A�h���X(INT64), 4�p�� = �p�����^��(INT64)
		PVal *pval;
		APTR aptr;

		aptr = code_getva(&pval);
		if (pval->flag != HspVarInt64_typeid())
			puterror(HSPERR_ILLEGAL_FUNCTION);
		HspVarProc *phvp;
		phvp = exinfo->HspFunc_getproc(pval->flag);
		INT64 prm1 = (INT64)phvp->GetPtr(pval);

		aptr = code_getva(&pval);
		if (pval->flag != HspVarInt64_typeid())
			puterror(HSPERR_ILLEGAL_FUNCTION);
		phvp = exinfo->HspFunc_getproc(pval->flag);
		INT64 prm2 = (INT64)phvp->GetPtr(pval);

		int prm;
		prm = code_getprm();					// �����l���擾(�f�t�H���g�Ȃ�)
		if (prm <= PARAM_END) puterror(HSPERR_NO_DEFAULT);
		INT64 prm3 = *(INT64 *)HspVarInt64_Cnv(mpval->pt, mpval->flag);

		prm = code_getprm();					// �����l���擾(�f�t�H���g�Ȃ�)
		if (prm <= PARAM_END) puterror(HSPERR_NO_DEFAULT);
		INT64 prm4 = *(INT64 *)HspVarInt64_Cnv(mpval->pt, mpval->flag);

		if (0x05 == cmd){
			ref_int64val = call_extfunc64((void *)prm3, (INT64 *)prm1, (INT64 *)prm2, prm4);
		}
		if (0x06 == cmd){
			fDouble = true;
			ref_doubleval = call_extfunc64d((void *)prm3, (INT64 *)prm1, (INT64 *)prm2, prm4);
		}
		if (0x07 == cmd){
			fFloat = true;
			ref_floatval = call_extfunc64f((void *)prm3, (INT64 *)prm1, (INT64 *)prm2, prm4);
		}

		break;
	}



















	//str filename,str buildoption=""
	case 0x09:	// HCLCreateProgram
	{
		char *pathname;
		pathname = code_gets();								// ��������擾
		std::string s_sourse = readFileIntoString(std::string(pathname));

		char* c_option;
		c_option = code_getds("");								// ��������擾
		std::string buildoption;
		buildoption = std::string(c_option);

		// Build the program
		ref_int64val = (INT64)WithSource_func(context[clsetdev], s_sourse, buildoption);
		break;
	}


	//int64 kernelid,str kansuu_mei
	case 0x0A:	// HCLCreateKernel
	{
		INT64 prm1 = Code_getint64();//�p�����[�^1:int64���l�A�J�[�l��id
		char *p;
		char pathname[_MAX_PATH];
		p = code_gets();								// ��������擾
		strncpy(pathname, p, _MAX_PATH - 1);			// �擾������������R�s�[
		cl_int ret;
		kernel = clCreateKernel((cl_program)prm1, pathname, &ret);
		ref_int64val = (INT64)kernel;
		if (ret != CL_SUCCESS) retmeserr8(ret);
		//kernel�ƕ������R�Â�
		std::string str = std::string(p);
		nums[kernel] = str;
		break;
	}


	//int64 bufsize
	case 0x0C:	// HCLCreateBuffer
	{
		INT64 prm1 = Code_geti32i64();//�p�����[�^1:int64���l�A�T�C�Y
		cl_int ret;
		mem_obj = clCreateBuffer(context[clsetdev], CL_MEM_READ_WRITE,prm1, NULL, &ret);
		if (ret != CL_SUCCESS) retmeserr9(ret);
		ref_int64val = (INT64)mem_obj;
		break;
	}
	

	case 0x18://clCreateProgramWithSource(str "   ")
	{
		char* c_source;
		c_source = code_gets();								// �\�[�X�R�[�h
		std::string s_sourse = std::string(c_source);

		char* c_option;
		c_option = code_getds("");								// �r���h�I�v�V������������擾
		std::string buildoption;
		buildoption = std::string(c_option);

		// Build the program
		ref_int64val = (INT64)WithSource_func(context[clsetdev], s_sourse, buildoption);
		break;
	}

	case 0x1A://HCLGetDevCount
	{
		fInt = true;
		ref_int32val = (int)dev_num;
		break;
	}

	case 0x1B://HCLGetSettingDevice
	{
		fInt = true;
		ref_int32val = (int)clsetdev;
		break;
	}
	
	case 0x1D://HCLGetSetintCommandQueue
	{
		fInt = true;
		ref_int32val = (int)clsetque;
		break;
	}
	

	case 0x25://HCLGetEventStartTime
	{
		int eventid = code_geti();
		ref_int64val = 0;
		cl_int ret;
		ret = clGetEventProfilingInfo(cppeventlist[eventid], CL_PROFILING_COMMAND_START, sizeof(INT64), &ref_int64val, NULL);
		if (ret != CL_SUCCESS) retmeserr5(ret);
		break;
	}

	case 0x26://HCLGetEventEndTime
	{
		int eventid = code_geti();
		ref_int64val = 0;
		cl_int ret;
		ret = clGetEventProfilingInfo(cppeventlist[eventid], CL_PROFILING_COMMAND_END, sizeof(INT64), &ref_int64val, NULL);
		if (ret != CL_SUCCESS) retmeserr5(ret);
		break;
	}

	case 0x29://HCLGetEventStatus
	{
		fInt = true;
		int eventid = code_geti();
		cl_int ret;
		ret = clGetEventInfo(cppeventlist[eventid], CL_EVENT_COMMAND_EXECUTION_STATUS, 4, &ref_int32val, NULL);
		if (ret != CL_SUCCESS) retmeserr5(ret);
		break;
	}



	case 0x32://Min64
	{
		INT64 a = Code_geti32i64();
		INT64 b = Code_geti32i64();
		ref_int64val = b;
		if (a < b)ref_int64val = a;
		break;
	}

	case 0x33://Max64
	{
		INT64 a = Code_geti32i64();
		INT64 b = Code_geti32i64();
		ref_int64val = b;
		if (a > b)ref_int64val = a;
		break;
	}

























	default:
		puterror( HSPERR_UNSUPPORTED_FUNCTION );
	}

	if ( *type != TYPE_MARK ) puterror( HSPERR_INVALID_FUNCPARAM );
	if ( *val != ')' ) puterror( HSPERR_INVALID_FUNCPARAM );
	code_next();

	if (fDouble){
		*type_res = HSPVAR_FLAG_DOUBLE;
		return (void *)&ref_doubleval;
	}

	if (fFloat) {
		*type_res = HSPVAR_FLAG_INT;
		return (void *)&ref_floatval;
	}

	if (fInt) {
		*type_res = HSPVAR_FLAG_INT;
		return (void *)&ref_int32val;
	}


	*type_res = HspVarInt64_typeid();		// �Ԓl�̃^�C�v���w�肷��
	return (void *)&ref_int64val;
}































static int cmdfunc(int cmd)
{
	code_next();

	switch (cmd) {
	case 0x02:								// qpoke�֐�
	{
		PVal *pval;
		APTR aptr = code_getva(&pval);
		int size = pval->size;
		p1 = code_geti();

		if (p1<0) throw HSPERR_BUFFER_OVERFLOW;

		if ((p1 + 8)>size) throw HSPERR_BUFFER_OVERFLOW;

		int prm;
		prm = code_getprm();					// �����l���擾(�f�t�H���g�Ȃ�)
		if (prm <= PARAM_END) puterror(HSPERR_NO_DEFAULT);

		*(INT64 *)((pval->pt) + p1) = *(INT64 *)HspVarInt64_Cnv(mpval->pt, mpval->flag);
		break;
	}
	case 0x04:								// dupptr64
	{
		PVal *pval_m;
		pval_m = code_getpval();
		int prm = code_getprm();
		if (prm <= PARAM_END) puterror(HSPERR_NO_DEFAULT);
		INT64 ptr = *(INT64 *)HspVarInt64_Cnv(mpval->pt, mpval->flag);
		if (NULL == ptr) throw HSPERR_ILLEGAL_FUNCTION;
		p2 = code_geti();
		p3 = code_getdi(HSPVAR_FLAG_INT);
		if (p2 <= 0) throw HSPERR_ILLEGAL_FUNCTION;

		if (exinfo->HspFunc_getproc(p3)->flag == 0) throw HSPERR_ILLEGAL_FUNCTION;
		HspVarCoreDupPtr(pval_m, p3, (void *)ptr, p2);
		break;
	}


















	case 0x08://HCLinit
	{
		cl_int errcode_ret;
		cl_platform_id platform_id[MAX_PLATFORM_IDS];
		cl_uint ret_num_devices;
		cl_uint ret_num_platforms;
		source_str = new char[1024 * 1024 * 64];

		cl_device_id* _device_id;
		_device_id = new cl_device_id[MAX_DEVICE_IDS];

		clGetPlatformIDs(MAX_PLATFORM_IDS, platform_id, &ret_num_platforms);

		dev_num = 0;
		for (int i = 0; i < (int)ret_num_platforms; i++) {
			clGetDeviceIDs(platform_id[i], CL_DEVICE_TYPE_ALL, MAX_DEVICE_IDS, _device_id, &ret_num_devices);
			dev_num += ret_num_devices;
		}

		if (dev_num == 0)
		{
			MessageBox(NULL, "No OpenCL Devices", "error", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		}


		device_id = new cl_device_id[dev_num];
		
		int dev_num_ = 0;
		for (int i = 0; i < (int)ret_num_platforms; i++) {
			clGetDeviceIDs(platform_id[i], CL_DEVICE_TYPE_ALL, MAX_DEVICE_IDS, &_device_id[0], &ret_num_devices);
			
			for (int i=0;i< (int)ret_num_devices;i++)
			{
				device_id[dev_num_+i] = _device_id[i];
			}
			dev_num_ += ret_num_devices;
		}
		//////////�f�o�C�X�����擾���܂����Ă���Ƃ���

		//�����ŃR���e�L�X�g�ƃR�}���h�L���[����
		context = new cl_context[dev_num];
		command_queue = new cl_command_queue[dev_num * COMMANDQUEUE_PER_DEVICE];
		
		for (int k = 0; k < dev_num; k++)
		{//�R���e�L�X�g�ƃR�}���h���[�����
			context[k] = clCreateContext(NULL, 1, &device_id[k], NULL, NULL, &errcode_ret);
			if (errcode_ret != CL_SUCCESS) retmeserr4(errcode_ret);

			for (int i = 0; i < COMMANDQUEUE_PER_DEVICE; i++) 
			{
				command_queue[k * COMMANDQUEUE_PER_DEVICE + i] =
					clCreateCommandQueue(context[k], device_id[k], cmd_properties, &errcode_ret);
				if (errcode_ret != CL_SUCCESS) retmeserr3(errcode_ret);
			}
		}

		//�Ō��event�ϐ�����
		cppeventlist = new cl_event[CL_EVENT_MAX];
		event_wait_list = new cl_event[CL_EVENT_MAX];
		evinfo = new EventStruct[CL_EVENT_MAX];
		for (int i = 0; i < CL_EVENT_MAX; i++) 
		{
			cppeventlist[i] = NULL;
			event_wait_list[i] = NULL;
		}
		break;
	}

	


	case 0x0B:	// HCLSetKernel
	{
		INT64 prm1 = Code_getint64();//�p�����[�^1:int64���l�A�J�|�l��id
		p2 = code_getdi(0);		// �p�����[�^2:���l�A����

		int chk = code_getprm();							// �p�����[�^�[���擾(�^�͖��Ȃ�)

		int type = mpval->flag;							// �p�����[�^�[�̌^���擾
		void* ppttr;
		int sizeofff=-1;
		switch (type) {
		case HSPVAR_FLAG_STR:								// �p�����[�^�[�������񂾂�����
		{
			ppttr = (char *)mpval->pt;
			sizeofff = 1;
			break;
		}
		case HSPVAR_FLAG_DOUBLE:									// �p�����[�^�[��������������
		{
			ppttr = (double *)mpval->pt;
			sizeofff = 8;
			break;
		}
		case 8:								// �p�����[�^�[��int64��������
		{
			ppttr = (INT64 *)mpval->pt;
			sizeofff = 8;
			break;
		}
		case HSPVAR_FLAG_INT:									// �p�����[�^�[��������������
		{
			ppttr = (int *)mpval->pt;
			sizeofff = 4;
			break;
		}
		default:
			puterror(HSPERR_TYPE_MISMATCH);			// �T�|�[�g���Ă��Ȃ��^�Ȃ�΃G���[
			sizeofff = -1;
			break;
		}

		int p4 = code_getdi(0);		// �p�����[�^4:���[�J���������[�t���O
		int clret = 0;

		if (prm1 == 0)
		{
			MessageBox(NULL, "�J�[�l��id��0�ł�", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
		}
		else 
		{
			//prm1�J�[�l��id�Ap2�͈����ʒu�Ap3�ɂ͎��ԁAp4�̓��[�J���������t���O
			if (p4 == 0) { clret = clSetKernelArg((cl_kernel)prm1, p2, sizeofff, ppttr); }
			if (p4 != 0) { clret = clSetKernelArg((cl_kernel)prm1, p2, p4, NULL); }
		}

		break;
	}
	

	case 0x0D:	// HCLDoKrn1 int p1,int p2,int p3,int p4
	{
		INT64 prm1 = Code_getint64();//�p�����[�^1:int64���l�A�J�|�l��id
		size_t globalsize = code_getdi(1);
		size_t localsize = code_getdi(0);

		cl_int ret;
		//outevent�֘A
		int outeventptr = code_getdi(-1);
		cl_event* outevent = NULL;//����̊֐����L�^�������C�x���g�ϐ��̃|�C���^
		if (outeventptr >= 0) 
		{
			if (cppeventlist[outeventptr] != NULL)
				clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm1;
			evinfo[outeventptr].globalsize = globalsize;
			evinfo[outeventptr].localsize = localsize;
		}
		//wait event list�֘A
		cl_event* ev_= GetWaitEvlist();

		if (localsize != 0) {
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
				(cl_kernel)prm1, 1, NULL, &globalsize, &localsize, num_event_wait_list, ev_, outevent);
		}
		else
		{
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
				(cl_kernel)prm1, 1, NULL, &globalsize, NULL, num_event_wait_list, ev_, outevent);
		}
		if (ret != CL_SUCCESS) { retmeserr(ret); }
		num_event_wait_list = 0;
		break;
	}


	case 0x0E:	// HCLWriteBuffer
	{
		//����1
		INT64 prm1 = Code_getint64();//�p�����[�^1:int64���l�Amemobj
		//����2�BHSP���̔z��ϐ�
		PVal *pval;
		APTR aptr = code_getva(&pval);
		//*(INT64 *)((pval->pt) + p1) = *(INT64 *)HspVarInt64_Cnv(mpval->pt, mpval->flag);
		//����3�A�R�s�[�T�C�Y
		INT64 prm3 = Code_geti32i64();//�p�����[�^3:int64
		//����4�A�R�s�[���ofset
		INT64 prm4 = Code_geti32i64();//�p�����[�^4:int64
		//����5�A�R�s�[����ofset
		INT64 prm5 = Code_geti32i64();//�p�����[�^5
		cl_bool p7 = code_getdi(1);		//�u���b�L���O���[�h
		
		//outevent�֘A
		int outeventptr = code_getdi(-1);//outevent���邩
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			if (cppeventlist[outeventptr] != NULL)
				clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm3;
			evinfo[outeventptr].globalsize = 0;
			evinfo[outeventptr].localsize = 0;
		}
		//wait event list�֘A
		cl_event* ev_ = GetWaitEvlist();

		cl_int ret = clEnqueueWriteBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque], (cl_mem)prm1, p7, prm4,
			prm3, (char*)((pval->pt) + prm5), num_event_wait_list, ev_, outevent);
		
		if (ret != CL_SUCCESS) { retmeserr2(ret); }

		num_event_wait_list = 0;
		break;
	}


	case 0x0F:	// HCLReadBuffer
	{
		//����1
		INT64 prm1 = Code_getint64();//�p�����[�^1:int64���l�Amemobj
		//����2�BHSP���̔z��ϐ�
		PVal *pval;
		APTR aptr = code_getva(&pval);
		//*(INT64 *)((pval->pt) + p1) = *(INT64 *)HspVarInt64_Cnv(mpval->pt, mpval->flag);
		//����3�A�R�s�[�T�C�Y
		INT64 prm3 = Code_geti32i64();//�p�����[�^3:int64
		//����4�A�R�s�[���ofset
		INT64 prm4 = Code_geti32i64();//�p�����[�^4:int64
		//����5�A�R�s�[����ofset
		INT64 prm5 = Code_geti32i64();//�p�����[�^5
		cl_bool p7 = code_getdi(1);		//�u���b�L���O���[�h

		//outevent�֘A
		int outeventptr = code_getdi(-1);//outevent���邩
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			if (cppeventlist[outeventptr] != NULL)
				clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm3;
			evinfo[outeventptr].globalsize = 0;
			evinfo[outeventptr].localsize = 0;
		}
		//wait event list�֘A
		cl_event* ev_=GetWaitEvlist();
		cl_int ret = clEnqueueReadBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque], (cl_mem)prm1, p7, prm4,
			prm3, (char *)((pval->pt) + prm5), num_event_wait_list, ev_, outevent);
		if (ret != CL_SUCCESS) { retmeserr2(ret); }

		num_event_wait_list = 0;
		break;
	}


	case 0x10:	// HCLSetDevice
	{
		clsetdev = code_getdi(0);
		break;
	}

	case 0x11:	// HCLFinish//���݂̃f�o�C�X�̌��݂̃R�}���h�L���[�̒��ɂ���^�X�N��S���҂�
	{
		cl_int ret = clFinish(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque]);
		if (ret != CL_SUCCESS) { retmeserr10(ret); }
	}


	case 0x12:	// HCLGetDeviceInfo
	{
		cl_device_info devinfoi = code_getdi(0);
		size_t szt = 0;
		
		clGetDeviceInfo(device_id[clsetdev], devinfoi, sizeof(bufferout), &bufferout, &szt);
		INT64 *datp = (INT64 *)&bufferout[0];
		PVal *pval;
		APTR aptr;
		aptr = code_getva(&pval);
		code_setva(pval, aptr, HspVarInt64_typeid(), &datp);

		PVal *pval2;
		APTR aptr2;
		aptr2 = code_getva(&pval2);
		code_setva(pval2, aptr2, HSPVAR_FLAG_INT, &szt);
		break;
	}


	case 0x13:	// HCLCopyBuffer
	{
		INT64 prm2 = Code_getint64();//�R�s�[�惁�����I�u�W�F�N�gid
		INT64 prm3 = Code_getint64();//�R�s�[���������I�u�W�F�N�gid
		INT64 prm4 = Code_geti32i64();// �R�s�[�T�C�Y
		INT64 prm5 = Code_geti32i64();// �R�s�[��I�t�Z�b�g
		INT64 prm6 = Code_geti32i64();// �R�s�[���I�t�Z�b�g

		//outevent�֘A
		int outeventptr = code_getdi(-1);//outevent���邩
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			if (cppeventlist[outeventptr] != NULL)
				clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm4;
			evinfo[outeventptr].globalsize = 0;
			evinfo[outeventptr].localsize = 0;
		}
		//wait event list�֘A
		cl_event* ev_ = GetWaitEvlist();
		cl_int ret = clEnqueueCopyBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
			(cl_mem)prm3, (cl_mem)prm2, prm6, prm5, prm4,num_event_wait_list, ev_, outevent);
		num_event_wait_list = 0;
		if (ret != CL_SUCCESS)retmeserr2(ret);
		break;
	}

	case 0x14:	// HCLDoKernel int64 p1,int p2,array p3,array p4
	{
		INT64 prm2 = Code_getint64();		// �J�[�l��
		p3 = code_getdi(1);		// work_dim
		size_t p4[3] = { 1,1,1 };
		size_t ptryes[3] = { 1,1,1 };

		if (p3 == 1) 
		{
			p4[0] = code_getdi(1);
			ptryes[0] = code_getdi(0);
		}
		else 
		{
			if ((p3 == 2) | (p3 == 3)) {
				PVal *pval1;
				APTR aptr1;	//�z��ϐ��̎擾
				aptr1 = code_getva(&pval1);//	���͕ϐ��̌^�Ǝ��̂̃|�C���^���擾
				HspVarProc *phvp1;
				void *ptr1;
				phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//�^����������HspVarProc�\���̂ւ̃|�C���^
				ptr1 = phvp1->GetPtr(pval1);					//�f�[�^�ipval1�j�̎��Ԃ�����擪�|�C���^���擾�B

				p4[0] = *(size_t *)ptr1;
				p4[1] = *((size_t *)ptr1 + 1);
				if (p3 == 3)
					p4[2] = *((size_t *)ptr1 + 2);

				PVal *pval2;
				APTR aptr2;	//�z��ϐ��̎擾
				aptr2 = code_getva(&pval2);//	���͕ϐ��̌^�Ǝ��̂̃|�C���^���擾
				HspVarProc *phvp2;
				void *ptr2;
				phvp2 = exinfo->HspFunc_getproc(pval2->flag);	//�^����������HspVarProc�\���̂ւ̃|�C���^
				ptr2 = phvp2->GetPtr(pval2);					//�f�[�^�ipval1�j�̎��Ԃ�����擪�|�C���^���擾�B

				ptryes[0] = *(size_t *)ptr2;
				ptryes[1] = *((size_t *)ptr2 + 1);
				if (p3 == 3)
					ptryes[2] = *((size_t *)ptr2 + 2);
			}
		}

		cl_int ret;

		//outevent�֘A
		int outeventptr = code_getdi(-1);//outevent���邩
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			if (cppeventlist[outeventptr] != NULL)
				clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm2;
			evinfo[outeventptr].globalsize = p4[0] * p4[1] * p4[2];
			evinfo[outeventptr].localsize = ptryes[0] * ptryes[1] * ptryes[2];
		}

		//wait event list�֘A
		cl_event* ev_=GetWaitEvlist();

		if (ptryes[0] != 0) 
		{
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
				(cl_kernel)prm2, p3, NULL, p4, ptryes, num_event_wait_list, ev_, outevent);
		}
		else {
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
				(cl_kernel)prm2, p3, NULL, p4, NULL, num_event_wait_list, ev_, outevent);
		}
		if (ret != CL_SUCCESS) { retmeserr(ret); }

		num_event_wait_list = 0;
		break;
	}

	case 0x15://ReleaseMemObject
	{
		INT64 prm2 = Code_getint64();		// �p�����[�^1:memobj

		cl_int ret = 0;
		ret = clReleaseMemObject((cl_mem)prm2);

		if (ret != CL_SUCCESS) {
			MessageBox(NULL, "�������J�����ł��܂���ł���", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
		}
		break;
	}


	case 0x16://dim_i64
	{
		PVal *pval1;
		APTR aptr1;
		aptr1 = code_getva(&pval1);
		exinfo->HspFunc_dim(pval1, 8, 0, code_getdi(0), 0, 0, 0);
		break;
	}

	case 0x17://�f�o�C�X�Z�b�g
	{
		clsetdev = code_getdi(0);
		break;
	}


	case 0x19://HCLDoKrn1_sub
	{
		INT64 prm2 = Code_getint64();		// �p�����[�^1:�J�[�l��
		size_t p4 = code_getdi(1);	//����
		size_t p5 = code_getdi(1);//���[�J���T�C�Y
		if (p5 == 0) { p5 = 64; }
		size_t p4_1 = (p4 / p5)*p5;//p5�Ŋ���؂�鐔����
		size_t p4_2 = p4 - p4_1;//���̒[��
		cl_int ret;

		//outevent�֘A
		int outeventptr = code_getdi(-1);//outevent���邩
		cl_event* outevent = NULL;
		cl_event* outevent2 = NULL;
		if (outeventptr >= 0)
		{
			if (cppeventlist[outeventptr] != NULL)
				clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm2;
			evinfo[outeventptr].globalsize = p4_1;
			evinfo[outeventptr].localsize = p5;
			if (p4_2 != 0) 
			{
				int next_outeventptr = (outeventptr + 1) % CL_EVENT_MAX;
				clReleaseEvent(cppeventlist[next_outeventptr]);
				outevent2 = &cppeventlist[next_outeventptr];
				evinfo[next_outeventptr].k = prm2;
				evinfo[next_outeventptr].globalsize = p4_2;
				evinfo[next_outeventptr].localsize = p5;
			}
		}
		//wait event list�֘A
		cl_event* ev_=GetWaitEvlist();

		if (p4_1 != 0) {
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
				(cl_kernel)prm2, 1, NULL, &p4_1, &p5, num_event_wait_list, ev_, outevent);//1��ڂ͖����I���
			if (ret != CL_SUCCESS) { retmeserr(ret); }
		}
		if (p4_2 != 0) {
			p5 = p4_2;
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
				(cl_kernel)prm2, 1, &p4_1, &p4_2, &p5, num_event_wait_list, ev_, outevent2);
			if (ret != CL_SUCCESS) { retmeserr(ret); }
		}
		num_event_wait_list = 0;
		break;
	}


	case 0x1C://HCLSetKrns
	{
		INT64 prm1 = Code_getint64();		// �p�����[�^1:�J�[�l��
		if (prm1 == 0) {
			MessageBox(NULL, "�J�[�l��id��0�ł�", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
		}

		void* ppttr;
		int sizeofff;
		int chk;
		int type;

		for (int i = 0; i < 32; i++) {
			chk = code_getprm();							// �p�����[�^�[���擾(�^�͖��Ȃ�)
			if (chk <= PARAM_END) {
				break;										// �p�����[�^�[�ȗ����̏���
			}
			type = mpval->flag;							// �p�����[�^�[�̌^���擾
			switch (type) {
			case HSPVAR_FLAG_STR:								// �p�����[�^�[�������񂾂�����
			{
				ppttr = (char *)mpval->pt;
				sizeofff = 1;
				break;
			}
			case HSPVAR_FLAG_DOUBLE:									// �p�����[�^�[��������������
			{
				ppttr = (double *)mpval->pt;
				sizeofff = 8;
				break;
			}

			case 8:								// �p�����[�^�[��int64��������
			{
				ppttr = (INT64 *)mpval->pt;
				sizeofff = 8;
				break;
			}
			case HSPVAR_FLAG_INT:									// �p�����[�^�[��������������
			{
				ppttr = (int *)mpval->pt;
				sizeofff = 4;
				break;
			}
			default:
				puterror(HSPERR_TYPE_MISMATCH);			// �T�|�[�g���Ă��Ȃ��^�Ȃ�΃G���[
			}

			//p1�J�[�l��id�Ap2�͈����ʒu�Ap3�ɂ͎��ԁAp4�̓��[�J���������t���O
			clSetKernelArg((cl_kernel)prm1, i, sizeofff, ppttr);
		}
		break;
	}
	
	case 0x1E://HCLSetCommandQueue
	{
		clsetque = code_getdi(0);
		if (clsetque >= COMMANDQUEUE_PER_DEVICE) 
		{
			MessageBox(NULL, "�w�肵���R�}���h�L���[��id���傫�����܂��B\n_ExHCLSetCommandQueueMax�ōő�l��ύX���Ă��������B", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
		}
		break;
	}

	case 0x1F:	// _ExHCLSetCommandQueueMax
	{

		if (dev_num != 0) 
		{
			MessageBox(NULL, "���̖��߂�HCLinit�̑O�Ɏ��s���Ă�������", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
		}
		COMMANDQUEUE_PER_DEVICE = code_geti();
		break;
	}

	case 0x20:	// _ExHCLSetCommandQueueProperties
	{
		if (dev_num != 0)
		{
			MessageBox(NULL, "���̖��߂�HCLinit�̑O�Ɏ��s���Ă�������", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
		}
		cmd_properties = code_geti();
		break;
	}

	case 0x21:	// HCLFlush//�R�}���h�L���[�̃u���b�L���O�݂�����
	{
		cl_int ret = clFlush(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque]);
		if (ret != CL_SUCCESS) retmeserr11(ret);
		break;
	}

	case 0x22:	//HCLSetWaitEvent int p1
	{
		p1 = code_geti();
		num_event_wait_list = 1;
		event_wait_list[0] = cppeventlist[p1];
		break;
	}

	case 0x23:	//HCLSetWaitEvents int num,array a
	{
		num_event_wait_list = code_geti();

		PVal* pval1;
		APTR aptr1;	//�z��ϐ��̎擾
		aptr1 = code_getva(&pval1);//	���͕ϐ��̌^�Ǝ��̂̃|�C���^���擾
		HspVarProc* phvp1;
		void* ptr1;
		phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//�^����������HspVarProc�\���̂ւ̃|�C���^
		ptr1 = phvp1->GetPtr(pval1);					//�f�[�^�ipval1�j�̎��Ԃ�����擪�|�C���^���擾�B

		for (int i = 0; i < num_event_wait_list; i++)
		{
			p2 = *((size_t*)ptr1 + i);
			event_wait_list[i] = cppeventlist[p2];
		}
		break;
	}

	case 0x24:	// _ExHCLSetEventMax
	{
		if (dev_num != 0)
		{
			MessageBox(NULL, "���̖��߂�HCLinit�̑O�Ɏ��s���Ă�������", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
		}
		CL_EVENT_MAX = code_geti();
		break;
	}




	// HCLCall
	// str source,int global_size,int local_size,array a,array b,array c�E�E�E�E�E

	case 0x27:
	{
		cl_int ret;
		char* c_source;
		c_source = code_gets();								// ��������擾
		std::string s_sourse = std::string(c_source);
		program = WithSource_func(context[clsetdev], s_sourse, "");
		ret = clCreateKernelsInProgram(program, 1, &kernel, NULL);//�v���O�����̒��̍ŏ��ɂłĂ���J�[�l�����擾
		if (ret != CL_SUCCESS)retmeserr8(ret);
		//����global_size��local_size
		size_t global_size = code_getdi(1);	//����
		size_t local_size = code_getdi(1);
		//���Ɉ����擾��������������������������������������������������������������������������������������
		cl_mem clm[32];
		void* host_ptr[32];
		int copysize[32];
		for (int i = 0; i < 32; i++) { copysize[i] = 0; clm[i] = NULL; host_ptr[i] = NULL; }
		//�ꎞ�z��ݒ肨�����


		for (int i = 0; i < 32; i++) {
			//�܂�cl_mem�^������ȊO���𔻒肵����
			bool memorval = false;//false��val�Ƃ����Ӗ��Afalse�Ȃ�cl_mem�����Ȃ�
			bool trygetva = true;//getva�����܂�������true

			void* ppttr;//�@
			int sizeofff;//�A
			//���̇@�A������Γ]���ł���
			int chk;
			int type;
			PVal* pval;
			APTR aptr;


			try 
			{
				APTR aptr = code_getva(&pval);
			}
			catch (...) 
			{
				trygetva = false;
			}


			if (trygetva == true) 
			{
				ppttr = (char*)pval->pt;
				int asz = max(pval->len[1], 1) * max(pval->len[2], 1) * max(pval->len[3], 1) * max(pval->len[4], 1);
				sizeofff = (pval->size) / asz;

				//�z�񂪂��肻���Ȃ�
				if (asz > 1)
				{
					if (pval->offset == 0)//�Y������������0�Ȃ�
					{
						memorval = true;
						sizeofff = pval->size;
					}
					else//�Y�����ɈӖ������肻���Ȃ�
					{
						//sizeofff = (pval->size) / asz;
						ppttr = ((char*)ppttr) + ((int)pval->offset * sizeofff);
					}
				}
			}
			else
			{
				chk = code_getprm();
				if (chk <= PARAM_END) {
					break;										// �p�����[�^�[�ȗ����̏���
				}
				type = mpval->flag;							// �p�����[�^�[�̌^���擾
				switch (type) {
					case HSPVAR_FLAG_STR:								// �p�����[�^�[�������񂾂�����
					{
						ppttr = (char*)mpval->pt;
						sizeofff = 1;
						break;
					}
					case HSPVAR_FLAG_DOUBLE:									// �p�����[�^�[��������������
					{
						ppttr = (double*)mpval->pt;
						sizeofff = 8;
						break;
					}

					case 8:								// �p�����[�^�[��int64��������
					{
						ppttr = (INT64*)mpval->pt;
						sizeofff = 8;
						break;
					}
					case HSPVAR_FLAG_INT:									// �p�����[�^�[��������������
					{
						ppttr = (int*)mpval->pt;
						sizeofff = 4;
						break;
					}
					default:
						puterror(HSPERR_TYPE_MISMATCH);			// �T�|�[�g���Ă��Ȃ��^�Ȃ�΃G���[
				}
			}




			if (memorval == false) //���������ʂ̃X�J���[�Ȃ�
			{
				//p1�J�[�l��id�Ap2�͈����ʒu�Ap3�ɂ̓T�C�Y�Ap4�͎���
				clSetKernelArg(kernel, i, sizeofff, ppttr);
			}
			else //������cl_mem�Ȃ�
			{
				clm[i] = clCreateBuffer(context[clsetdev], CL_MEM_READ_WRITE, pval->size, NULL, &ret);
				copysize[i] = pval->size;
				host_ptr[i] = ppttr;
				if (ret != CL_SUCCESS) retmeserr9(ret);
				//vram���m�ۂ��]��
				ret = clEnqueueWriteBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque], clm[i], CL_TRUE, 0,
					copysize[i], host_ptr[i], 0, NULL, NULL);
				if (ret != CL_SUCCESS) { retmeserr2(ret); }
				//�u���b�L���O����œ]��
				//p1�J�[�l��id�Ap2�͈����ʒu�Ap3�ɂ̓T�C�Y�Ap4�͎���
				clSetKernelArg(kernel, i, 8, &clm[i]);
			}
		}

		//����ƈ����ݒ肪�I�����������������������������������������������������������������������������������������������������

		//���Ɋ֐��̎��s
		if (local_size != 0) 
		{
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
				kernel, 1, NULL, &global_size, &local_size, 0, NULL, NULL);
		}
		else 
		{
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
				kernel, 1, NULL, &global_size, NULL, 0, NULL, NULL);
		}
		if (ret != CL_SUCCESS) { retmeserr(ret); }
		
		//GPU��CPU�ɕϐ���߂��Ă���
		for (int i = 0; i < 32; i++) 
		{
			if (copysize[i] != 0) 
			{
				ret = clEnqueueReadBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque], clm[i], CL_TRUE, 0,
					copysize[i], host_ptr[i], 0, NULL, NULL);
				if (ret != CL_SUCCESS) { retmeserr2(ret); }
				//vram�̉��
				ret = clReleaseMemObject(clm[i]);
				if (ret != CL_SUCCESS) {
					MessageBox(NULL, "�������J�����ł��܂���ł���", "�G���[", 0);
					puterror(HSPERR_UNSUPPORTED_FUNCTION);
				}
				clm[i] = NULL; host_ptr[i] = NULL;
			}
		}

		//����ɂđS�s���I���̂͂��I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I�I
		break;
	}
















	case 0x2A:	// HCLWaitForEvent
	{
		int n = code_geti();
		event_wait_list[0] = cppeventlist[n];
		cl_int ret = clWaitForEvents(1, event_wait_list);
		if (ret != CL_SUCCESS) retmeserr6(ret);
		break;
	}


	case 0x2B:	// HCLWaitForEvents int num,array a
	{
		int n = code_getdi(0);
		PVal* pval1;
		APTR aptr1;	//�z��ϐ��̎擾
		aptr1 = code_getva(&pval1);//	���͕ϐ��̌^�Ǝ��̂̃|�C���^���擾
		HspVarProc* phvp1;
		void* ptr1;
		phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//�^����������HspVarProc�\���̂ւ̃|�C���^
		ptr1 = phvp1->GetPtr(pval1);					//�f�[�^�ipval1�j�̎��Ԃ�����擪�|�C���^���擾�B

		for (int i = 0; i < n; i++)
		{
			p2 = *((size_t*)ptr1 + i);
			event_wait_list[i] = cppeventlist[p2];
		}

		cl_int ret = clWaitForEvents(n, event_wait_list);
		if (ret != CL_SUCCESS) retmeserr6(ret);
		break;
	}



	case 0x2F://HCLGetEventAllCommandInfo int eventid,str ptrk,int strsize,int64 data,int64 commandtype
	{
		int eventid = code_geti();//eventid
		cl_command_type cmt;
		int strsize = 0;
		INT64 data, commandtype;
		std::string s;
		s = "";
		cl_int ret;
		ret = clGetEventInfo(cppeventlist[eventid], CL_EVENT_COMMAND_TYPE, sizeof(cl_command_type), &cmt, NULL);
		if (ret != CL_SUCCESS) retmeserr5(ret);

		switch (cmt)
		{
			case CL_COMMAND_NDRANGE_KERNEL:
			{
				s = nums[(cl_kernel)evinfo[eventid].k];
				strsize = s.length();
				data = evinfo[eventid].globalsize * 4294967296 + evinfo[eventid].localsize;
				break;
			}

			case CL_COMMAND_WRITE_BUFFER:
			case CL_COMMAND_COPY_BUFFER:
			case CL_COMMAND_READ_BUFFER:
			{
				data = evinfo[eventid].k;
				break;
			}
			default:
				break;
		}

		for (int i = 0; i < strsize; i++)
		{
			bugchar[i] = *(s.c_str() + i);
		}
		bugchar[strsize] = 0;//nul

		INT64* datp = (INT64*)&bugchar[0];
		PVal* pval;
		APTR aptr;
		aptr = code_getva(&pval);
		code_setva(pval, aptr, HspVarInt64_typeid(), &datp);

		PVal* pval2;
		APTR aptr2;
		aptr2 = code_getva(&pval2);
		code_setva(pval2, aptr2, HSPVAR_FLAG_INT, &strsize);

		PVal* pval3;
		APTR aptr3;
		aptr3 = code_getva(&pval3);
		code_setva(pval3, aptr3, 8, &data);

		commandtype = (INT64)cmt;
		PVal* pval4;
		APTR aptr4;
		aptr4 = code_getva(&pval4);
		code_setva(pval4, aptr4, 8, &commandtype);

		break;
	}

	
	//GPU��Ŏ��s
	case 0x30://HCLFillBuffer4
	{
		//����1 buffer
		INT64 prm1 = Code_getint64();//�p�����[�^1:int64���l�Amemobj

		//����2 pattern
		int pattern= code_geti();

		//����3�Aoffset(byte)
		INT64 prm4 = Code_geti32i64();//�p�����[�^4:int64

		//����4�Asize(byte)
		INT64 prm5 = Code_geti32i64();//�p�����[�^5

		cl_int ret;
		//outevent�֘A
		int outeventptr = code_getdi(-1);
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm5;
			evinfo[outeventptr].globalsize = 0;
			evinfo[outeventptr].localsize = 0;
		}
		//wait event list�֘A
		cl_event* ev_=GetWaitEvlist();

		ret = clEnqueueFillBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
			(cl_mem)prm1, &pattern, 4, prm4, prm5, num_event_wait_list, ev_, outevent);
		if (ret != CL_SUCCESS) { retmeserr(ret); }
		num_event_wait_list = 0;
		break;
	}

	case 0x31://HCLFillBuffer8
	{
		//����1 buffer
		INT64 prm1 = Code_getint64();//�p�����[�^1:int64���l�Amemobj

		//����2 pattern
		INT64 pattern = Code_getint64();

		//����3�Aoffset(byte)
		INT64 prm4 = Code_geti32i64();//�p�����[�^4:int64

		//����4�Asize(byte)
		INT64 prm5 = Code_geti32i64();//�p�����[�^5

		cl_int ret;
		//outevent�֘A
		int outeventptr = code_getdi(-1);
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm5;
			evinfo[outeventptr].globalsize = 0;
			evinfo[outeventptr].localsize = 0;
		}
		//wait event list�֘A
		cl_event* ev_=GetWaitEvlist();

		//cl_uint2 clpt2;
		//clpt2.x = pattern % 4294967296;
		//clpt2.y = pattern / 4294967296;

		ret = clEnqueueFillBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
			(cl_mem)prm1, &pattern, 8, prm4, prm5, num_event_wait_list, ev_, outevent);
		if (ret != CL_SUCCESS) { retmeserr(ret); }
		num_event_wait_list = 0;
		break;
	}
	

















	case 0x93:								// newcmd31 //convRGBtoBGR
		_ConvRGBtoBGR();
		break;
	case 0x94:								// newcmd31 //convRGBAtoRGB
		_ConvRGBAtoRGB();
		break;
	case 0x95:								// newcmd31 //convRGBtoRGBA
		_ConvRGBtoRGBA();
		break;






	default:
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
	}
	return RUNMODE_RUN;



}























/*------------------------------------------------------------*/

static int termfunc( int option )
{
	//		�I������ (�A�v���P�[�V�����I�����ɌĂ΂�܂�)
	//
	return 0;
}


/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/

int WINAPI DllMain (HINSTANCE hInstance, DWORD fdwReason, PVOID pvReserved)
{
	//		DLL�G���g���[ (��������K�v�͂���܂���)
	//
	return TRUE;
}


EXPORT void WINAPI hsp3cmdinit( HSP3TYPEINFO *info )
{
	//		�v���O�C�������� (���s�E�I��������o�^���܂�)
	//
	hsp3sdk_init( info );		// SDK�̏�����(�ŏ��ɍs�Ȃ��ĉ�����)

	info->reffunc = reffunc;		// �Q�Ɗ֐�(reffunc)�̓o�^
	info->cmdfunc = cmdfunc;		// ���߂̓o�^
	info->termfunc = termfunc;		// �I���֐�(termfunc)�̓o�^

	registvar( -1, HspVarInt64_Init );		// �V�����^�̒ǉ�
}

/*------------------------------------------------------------*/