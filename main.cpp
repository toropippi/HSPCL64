
//
//		HSP3.0 plugin sample
//		onion software/onitama 2004/9
//

#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
#include <windows.h>
//#include <iostream>
#include <string>
#include <stdio.h>
#include <stdlib.h>
#include "hsp3plugin.h"
#include "hsp3struct.h"
#include "hspvar_int64.h"

#include <CL/cl.h>


#define MAX_PLATFORM_IDS 32 //platform_id�̍ő�l
#define MAX_DEVICE_IDS 1024 //devices�̍ő�l

int gplatkz = 0;//�v���b�g�t�H�[���̐�  2
int gdevkz = 0;//�f�o�C�X�̐�  4

int bufferout[1024 * 4];
cl_platform_id platform_id[MAX_PLATFORM_IDS];
cl_context *context;
cl_command_queue *command_queue;
cl_mem mem_obj;
cl_program program;
cl_kernel kernel;
cl_event dmyevent;
cl_event *ddmyevent = &dmyevent;
int clsetdev = 0;

void newcmd48(void);
void newcmd49(void);
void newcmd50(void);
void retmeserr(cl_int ret);//clEnqueueNDRangeKernel �Ŏ��s�������o���G���[���b�Z�[�W���܂Ƃ߂��֐�
void retmeserr2(cl_int ret);//clRead�Ŏ��s�������o���G���[���b�Z�[�W���܂Ƃ߂��֐�

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
	}
	INT64 reti64;
	return *(INT64*)ppttr;
}


struct nandemooiiii {
	cl_device_id dev;
};
nandemooiiii *gpus;







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




























	case 0x09:	// HCLCreateProgram
	{
		char *p;
		char pathname[_MAX_PATH];
		p = code_gets();								// ��������擾
		strncpy(pathname, p, _MAX_PATH - 1);			// �擾������������R�s�[

		FILE *fp;
		char *source_str;
		size_t source_size;
		if ((fp = fopen(pathname, "r")) == NULL) {
			puterror(HSPERR_FILE_IO);
		}
		else
		{
			source_str = (char*)malloc(1024*1024);
			source_size = fread(source_str, 1, 1024 * 1024, fp);
			
			// Build the program
			program = clCreateProgramWithSource(context[clsetdev], 1, (const char **)&source_str, (const size_t *)&source_size, NULL);
			cl_int err0 = clBuildProgram(program, 1, &gpus[clsetdev].dev, NULL, NULL, NULL);
			if (err0 != CL_SUCCESS) {
				size_t len;
				char buffer[2048 * 64];
				clGetProgramBuildInfo(program, gpus[clsetdev].dev,
					CL_PROGRAM_BUILD_LOG, sizeof(buffer), buffer, &len);
				MessageBox(NULL, (LPCSTR)buffer, "Error on OpenCL code", MB_OK);
				puterror(HSPERR_UNKNOWN_CODE);
			}
			fclose(fp);

			ref_int64val = (INT64)program;
		}
		
		break;
	}


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

		switch (ret) {							//����

		case CL_INVALID_PROGRAM:
			MessageBox(NULL, "program ���L���ȃv���O�����I�u�W�F�N�g�łȂ�", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;

		case CL_INVALID_PROGRAM_EXECUTABLE:
			MessageBox(NULL, "program �ɐ���Ƀr���h���ꂽ���s�\�v���O�������Ȃ�", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;

		case CL_INVALID_KERNEL_NAME:
			MessageBox(NULL, "kernel_name �� program ���Ɍ�����Ȃ�", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;

		case CL_INVALID_KERNEL_DEFINITION:
			MessageBox(NULL, "kernel_name ���^����A����������̌^�Ƃ����� __kernel �֐��̊֐���`���Aprogram ���r���h���ꂽ���ׂẴf�o�C�X�œ����łȂ�", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;

		case CL_INVALID_VALUE:
			MessageBox(NULL, "kernel_name �� NULL", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;

		case CL_OUT_OF_RESOURCES:
			MessageBox(NULL, "�f�o�C�X��ł̃��\�[�X�m�ۂɎ��s����", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;

		case CL_OUT_OF_HOST_MEMORY:
			MessageBox(NULL, "�z�X�g��ł̃��\�[�X�m�ۂɎ��s����", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		}

		break;
	}


	
	case 0x0C:	// HCLCreateBuffer
	{
		INT64 prm1 = Code_geti32i64();//�p�����[�^1:int64���l�A�T�C�Y

		cl_int errcode_ret;
		mem_obj = clCreateBuffer(context[clsetdev], CL_MEM_READ_WRITE,
			prm1, NULL, &errcode_ret);
		
		int dnryndtyd = 0;
		cl_int ret = clEnqueueWriteBuffer(command_queue[clsetdev], mem_obj, 0, 1,
			1, &dnryndtyd, 0, NULL, NULL);
		
		switch (errcode_ret) {							//����

		case CL_INVALID_CONTEXT:
			MessageBox(NULL, "context ���L����OpenCL�R���e�L�X�g�łȂ�", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_INVALID_VALUE:
			MessageBox(NULL, "�ǂݏ�����p���������p�ӂł��܂���ł���", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_INVALID_KERNEL:
			MessageBox(NULL, "size �� 0 �̂Ƃ��B�������� size �� context ���̃f�o�C�X�� CL_DEVICE_MAX_MEM_ALLOC_SIZE �̒l���傫��", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_INVALID_HOST_PTR:
			MessageBox(NULL, "host_ptr �� NULL �� CL_MEM_USE_HOST_PTR �������� CL_MEM_COPY_HOST_PTR �� flags �Ɏw�肳��Ă���Ƃ��B�������́ACL_MEM_COPY_HOST_PTR �� CL_MEM_USE_HOST_PTR ���ݒ肳��Ă��Ȃ��̂� host_ptr �� NULL �łȂ�", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_MEM_OBJECT_ALLOCATION_FAILURE:
			MessageBox(NULL, "�o�b�t�@�I�u�W�F�N�g�̃��������m�ۂ���̂Ɏ��s����", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_OUT_OF_RESOURCES:
			MessageBox(NULL, "�f�o�C�X��ł̃��\�[�X�m�ۂɎ��s����", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_OUT_OF_HOST_MEMORY:
			MessageBox(NULL, "�z�X�g��ł̃��\�[�X�m�ۂɎ��s����", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		}

		if (ret != CL_SUCCESS) { retmeserr2(ret); }
		clFinish(command_queue[clsetdev]);

		ref_int64val = (INT64)mem_obj;
		break;
	}
	


	case 0x18://clCreateProgramWithSource(str "   ")
	{
		char *source_str;
		source_str = (char*)malloc(1024*1024*32);
		source_str = code_gets();								// ��������擾

		int saizu = sizeof(source_str);

		program = clCreateProgramWithSource(context[clsetdev], 1, (const char **)&source_str, (const size_t *)&saizu, NULL);
		cl_int err0 = clBuildProgram(program, 1, &gpus[clsetdev].dev, NULL, NULL, NULL);
		if (err0 != CL_SUCCESS) {
			size_t len;
			char buffer[2048 * 64];
			clGetProgramBuildInfo(program, gpus[clsetdev].dev,
				CL_PROGRAM_BUILD_LOG, sizeof(buffer), buffer, &len);
			MessageBox(NULL, (LPCSTR)buffer, "Error on OpenCL code", MB_OK);
			puterror(HSPERR_UNKNOWN_CODE);
		}

		ref_int64val = (INT64)program;
		break;
	}

	case 0x1A://HCLGetDevCount
	{
		fInt = true;
		ref_int32val = (int)gdevkz;
		break;
	}


	case 0x1B://HCLGetSetDevice
	{
		fInt = true;
		ref_int32val = (int)clsetdev;
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
		cl_device_id device_id[MAX_DEVICE_IDS];
		cl_uint ret_num_devices;
		cl_uint ret_num_platforms;
		cl_int ret = clGetPlatformIDs(MAX_PLATFORM_IDS, platform_id, &ret_num_platforms);
		gplatkz = ret_num_platforms;

		int gkw = 0;

		if (gplatkz != 0) {
			for (int i = 0; i < gplatkz; i++) {
				ret = clGetDeviceIDs(platform_id[i], CL_DEVICE_TYPE_ALL, MAX_DEVICE_IDS, device_id, &ret_num_devices);
				gkw += ret_num_devices;
			}
			gpus = new struct nandemooiiii[gkw];
			int w = 0;
			for (int i = 0; i < gplatkz; i++) {
				ret = clGetDeviceIDs(platform_id[i], CL_DEVICE_TYPE_ALL, MAX_DEVICE_IDS, device_id, &ret_num_devices);
				for (int j = 0; j<int(ret_num_devices); j++)
				{
					gpus[w].dev = device_id[j];
					w++;
				}
			}
		}//////////�f�o�C�X�����擾���܂����Ă���Ƃ���


		context = new cl_context[gkw];
		command_queue = new cl_command_queue[gkw];

		for (int k = 0; k < gkw; k++) {//�R���e�L�X�g�ƃR�}���h���[�����
			context[k] = clCreateContext(NULL, 1, &gpus[k].dev, NULL, NULL, &ret);
			command_queue[k] = clCreateCommandQueue(context[k], gpus[k].dev, CL_QUEUE_PROFILING_ENABLE, &ret);
		}

		gdevkz = gkw;
		break;
	}

	
	case 0x0B:	// HCLSetKernel
	{
		INT64 prm1 = Code_getint64();//�p�����[�^1:int64���l�A�J�|�l��id
		p2 = code_getdi(0);		// �p�����[�^2:���l�A����

		int chk = code_getprm();							// �p�����[�^�[���擾(�^�͖��Ȃ�)

		int type = mpval->flag;							// �p�����[�^�[�̌^���擾
		void* ppttr;
		int sizeofff;
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
	


	case 0x0D:	// HCLDoKrn1 int p1,int p2,int p3
	{
		INT64 prm1 = Code_getint64();//�p�����[�^1:int64���l�A�J�|�l��id
		size_t p4 = code_getdi(1);
		size_t ptryes = code_getdi(0);
		cl_int ret;
		if (ptryes != 0) {
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev], (cl_kernel)prm1, 1, NULL, &p4, &ptryes, 0, NULL, NULL);
		}
		else {
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev], (cl_kernel)prm1, 1, NULL, &p4, NULL, 0, NULL, NULL);
		}
		//if (ret != CL_SUCCESS) { retmeserr(ret); }

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
		
		
		cl_int ret = clEnqueueWriteBuffer(command_queue[clsetdev], (cl_mem)prm1, p7, prm4,
			prm3, (char *)((pval->pt) + prm5), 0, NULL, NULL);
		
		//if (ret != CL_SUCCESS) { retmeserr2(ret); }
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
		
		cl_int ret = clEnqueueReadBuffer(command_queue[clsetdev], (cl_mem)prm1, p7, prm4,
			prm3, (char *)((pval->pt) + prm5), 0, NULL, NULL);
		
		//if (ret != CL_SUCCESS) { retmeserr2(ret); }
		break;
	}


	case 0x10:	// HCLSetDevice
	{
		clsetdev = code_getdi(0);
		break;
	}

	case 0x11:	// HCLFinish//�f�o�C�X�ɂ���S���̃^�X�N�҂�
	{
		cl_int ret = clFinish(command_queue[clsetdev]);

		switch (ret) {							//����

		case CL_INVALID_COMMAND_QUEUE:
			MessageBox(NULL, "���������L���Ȓl�ł͂���܂���", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_INVALID_CONTEXT:
			MessageBox(NULL, "���邢�͑������� event_wait_list ���̃C�x���g�Ɗ֘A�t����ꂽ�f�o�C�X�������łȂ�", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_INVALID_EVENT:
			MessageBox(NULL, "event_list�̃C�x���g�I�u�W�F�N�g���s��", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_OUT_OF_HOST_MEMORY:
			MessageBox(NULL, "�z�X�g��ł̃��\�[�X�m�ۂɎ��s����", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		}
		break;
	}


	case 0x12:	// HCLGetDeviceInfo
	{
		cl_device_info devinfoi = code_getdi(0);
		size_t szt = 0;
		
		clGetDeviceInfo(gpus[clsetdev].dev, devinfoi, sizeof(bufferout), &bufferout, &szt);
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
		cl_int ret = clEnqueueCopyBuffer(command_queue[clsetdev], (cl_mem)prm3, (cl_mem)prm2, prm6, prm5, prm4, 0, NULL, NULL);


		switch (ret) {							//����
		case CL_INVALID_COMMAND_QUEUE:
			MessageBox(NULL, "command_queue is not a valid command-queue", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_INVALID_CONTEXT:
			MessageBox(NULL, "�������I�u�W�F�N�g���ʂ̃f�o�C�X�ō쐬���ꂽ�\��������܂�", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_INVALID_MEM_OBJECT:
			MessageBox(NULL, "�������I�u�W�F�N�g�̎��̂�����܂���B�������I�u�W�F�N�g���ʂ̃f�o�C�X�ō쐬���ꂽ�\��������܂��B", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_INVALID_VALUE:
			MessageBox(NULL, "�A�h���X�A�N�Z�X�ᔽ�ł��B�������ݗ̈�or�ǂݍ��ݗ̈悪�͂ݏo���Ă܂��B", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_MEM_COPY_OVERLAP:
			MessageBox(NULL, "�A�h���X�A�N�Z�X�ᔽ�ł��B�������ݗ̈悩�ǂݍ��ݗ̈悪�͂ݏo���Ă܂��B", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_MEM_OBJECT_ALLOCATION_FAILURE:
			MessageBox(NULL, "data store �̂��߂�allocate memory����̂����s���܂���", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_OUT_OF_RESOURCES:
			MessageBox(NULL, "�f�o�C�X(GPU)��ł̃��\�[�X�m�ۂɎ��s����", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_OUT_OF_HOST_MEMORY:
			MessageBox(NULL, "�z�X�g(CPU)��ł̃��\�[�X�m�ۂɎ��s����", "�G���[", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		}
		break;
	}

	case 0x14:	// HCLDoKernel int64 p1,int p2,array p3,array p4
	{
		INT64 prm2 = Code_getint64();		// �J�[�l��
		p3 = code_getdi(1);		// work_dim
		size_t p4[3];
		size_t ptryes[3];

		if (p3 == 1) {
			p4[0] = code_getdi(1);
			ptryes[0] = code_getdi(0);
		}
		else {
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
				ptryes[2] = *((size_t *)ptr2 + 2);
			}
		}


		cl_int ret;
		if (ptryes[0] != 0) {
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev], (cl_kernel)prm2, p3, NULL, p4, ptryes, 0, NULL, NULL);
		}
		else {
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev], (cl_kernel)prm2, p3, NULL, p4, NULL, 0, NULL, NULL);
		}
		if (ret != CL_SUCCESS) { retmeserr(ret); }
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
		if (p4_1 != 0) {
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev], (cl_kernel)prm2, 1, NULL, &p4_1, &p5, 0, NULL, NULL);//1��ڂ͖����I���
			if (ret != CL_SUCCESS) { retmeserr(ret); }
		}
		if (p4_2 != 0) {
			p5 = p4_2;
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev], (cl_kernel)prm2, 1, &p4_1, &p4_2, &p5, 0, NULL, NULL);
			if (ret != CL_SUCCESS) { retmeserr(ret); }
		}
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


		for (int i = 0; i < 20; i++) {
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

































	case 0x93:								// newcmd31 //convRGBtoBGR
		newcmd48();
		break;
	case 0x94:								// newcmd31 //convRGBAtoRGB
		newcmd49();
		break;
	case 0x95:								// newcmd31 //convRGBtoRGBA
		newcmd50();
		break;






	default:
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
	}
	return RUNMODE_RUN;



}









































































//----------------------------------------------------------------------------------------�����ȉ��͎����ō�����֐�--------------------------------
//----------------------------------------------------------------------------------------�����ȉ��͎����ō�����֐�--------------------------------
//----------------------------------------------------------------------------------------�����ȉ��͎����ō�����֐�--------------------------------
//----------------------------------------------------------------------------------------�����ȉ��͎����ō�����֐�--------------------------------
//----------------------------------------------------------------------------------------�����ȉ��͎����ō�����֐�--------------------------------
//----------------------------------------------------------------------------------------�����ȉ��͎����ō�����֐�--------------------------------
//----------------------------------------------------------------------------------------�����ȉ��͎����ō�����֐�--------------------------------
//----------------------------------------------------------------------------------------�����ȉ��͎����ō�����֐�--------------------------------
//----------------------------------------------------------------------------------------�����ȉ��͎����ō�����֐�--------------------------------
//----------------------------------------------------------------------------------------�����ȉ��͎����ō�����֐�--------------------------------
//----------------------------------------------------------------------------------------�����ȉ��͎����ō�����֐�--------------------------------
//----------------------------------------------------------------------------------------�����ȉ��͎����ō�����֐�--------------------------------
//----------------------------------------------------------------------------------------�����ȉ��͎����ō�����֐�--------------------------------


void retmeserr(cl_int ret)
{
	switch (ret) {							//����
	case CL_INVALID_PROGRAM_EXECUTABLE:
		MessageBox(NULL, "�f�o�C�X��Ŏ��s�\�ȁA����Ƀr���h���ꂽ�v���O�������������܂���", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_COMMAND_QUEUE:
		MessageBox(NULL, "�f�o�C�Xid�������ȃf�o�C�X�ɂȂ��Ă��܂�", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_KERNEL:
		MessageBox(NULL, "�J�[�l��id���Ԉ���Ă��܂�", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_CONTEXT:
		MessageBox(NULL, "�J�[�l��id���Ⴄ�f�o�C�Xid�œo�^����Ă��܂��A���邢�͑������� event_wait_list ���̃C�x���g�Ɗ֘A�t����ꂽ�f�o�C�X�������łȂ�", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_KERNEL_ARGS:
		MessageBox(NULL, "�J�[�l���������w�肳��Ă��܂���", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_GLOBAL_WORK_SIZE:
		MessageBox(NULL, "global_work_size �� NULL �ł��B���邢�́Aglobal_work_size�̔z��̂ǂꂩ��0�ł��B�������̓J�[�l�������s����f�o�C�X��ł�global_work_size������l�𒴂��Ă���", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_GLOBAL_OFFSET:
		MessageBox(NULL, "CL_INVALID_GLOBAL_OFFSET - global_work_offset �� NULL �łȂ�", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_WORK_DIMENSION:
		MessageBox(NULL, "work_dim ���K�؂Ȓl�łȂ�", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_WORK_GROUP_SIZE:
		MessageBox(NULL, "global_work_size��local_work_size �Ő����ł��Ȃ��A�܂���local_work_size[0]*local_work_size[1]*local_work_size[2]���A��̃��[�N�O���[�v���̃��[�N�A�C�e�����̍ő�l�𒴂���", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_WORK_ITEM_SIZE:
		MessageBox(NULL, "local_work_size[0], ... local_work_size[work_dim - 1] �Ŏw�肵�����[�N�A�C�e�������Ή����� CL_DEVICE_MAX_WORK_ITEM_SIZES[0], ... CL_DEVICE_MAX_WORK_ITEM_SIZES[work_dim - 1] �̒l�����Ă���A�܂���0���w�肵��", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_MEM_OBJECT_ALLOCATION_FAILURE:
		MessageBox(NULL, "kernel �̈����Ɏw�肳�ꂽ�o�b�t�@/�C���[�W�I�u�W�F�N�g�Ɋ֘A�t����ꂽ�f�[�^�ۑ��̂��߂̃������̈�̊m�ۂɎ��s����", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_EVENT_WAIT_LIST:
		MessageBox(NULL, "event_wait_list �� NULL �� num_events_in_wait_list �� 0 ���傫���Ƃ��B���邢�� event_wait_list �� NULL �łȂ� num_events_in_wait_list �� 0 �̂Ƃ��B���邢�� event_wait_list ���̃C�x���g�I�u�W�F�N�g���L���Ȃ��̂łȂ�", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "�f�o�C�X��ł̃��\�[�X�m�ۂɎ��s����", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "�z�X�g��ł̃��\�[�X�m�ۂɎ��s����", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//��̂ǂ�ł��Ȃ����
	MessageBox(NULL, "�����s���̃G���[�ł�", "�G���[", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);
}




void retmeserr2(cl_int ret)
{
	switch (ret) {							//����
	case CL_INVALID_COMMAND_QUEUE:
		MessageBox(NULL, "command_queue is not a valid command-queue", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_CONTEXT:
		MessageBox(NULL, "�������I�u�W�F�N�g���ʂ̃f�o�C�X�ō쐬���ꂽ�\��������܂�", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_MEM_OBJECT:
		MessageBox(NULL, "�������I�u�W�F�N�g�̎��̂�����܂���B�������I�u�W�F�N�g���ʂ̃f�o�C�X�ō쐬���ꂽ�\��������܂��B", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "�A�h���X�A�N�Z�X�ᔽ�ł��B�ǂݍ��ݗ̈悪�͂ݏo���Ă܂��B", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_MEM_OBJECT_ALLOCATION_FAILURE:
		MessageBox(NULL, "data store �̂��߂�allocate memory����̂����s���܂���", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "�f�o�C�X(GPU)��ł̃��\�[�X�m�ۂɎ��s����", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "�z�X�g(CPU)��ł̃��\�[�X�m�ۂɎ��s����", "�G���[", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//��̂ǂ�ł��Ȃ����
	MessageBox(NULL, "�����s���̃G���[�ł�", "�G���[", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);

}



static void newcmd48(void)
{
	PVal *pval1;
	APTR aptr1;	//�z��ϐ��̎擾
	aptr1 = code_getva(&pval1);//	���͕ϐ��̌^�Ǝ��̂̃|�C���^���擾
	HspVarProc *phvp1;
	void *ptr1;
	phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//�^����������HspVarProc�\���̂ւ̃|�C���^
	ptr1 = phvp1->GetPtr(pval1);					//�f�[�^�ipval1�j�̎��Ԃ�����擪�|�C���^���擾�B


	PVal *pval2;
	APTR aptr2;	//�z��ϐ��̎擾
	aptr2 = code_getva(&pval2);//	���͕ϐ��̌^�Ǝ��̂̃|�C���^���擾
	HspVarProc *phvp2;
	void *ptr2;
	phvp2 = exinfo->HspFunc_getproc(pval2->flag);	//�^����������HspVarProc�\���̂ւ̃|�C���^
	ptr2 = phvp2->GetPtr(pval2);					//�f�[�^�ipval1�j�̎��Ԃ�����擪�|�C���^���擾�B

	p3 = code_getdi(0);

	char *dmptr1 = (char*)ptr1;
	char *dmptr2 = (char*)ptr2;

	for (int i = 0; i < p3; i += 3) {
		dmptr2[i + 2] = dmptr1[i];
		dmptr2[i + 1] = dmptr1[i + 1];
		dmptr2[i] = dmptr1[i + 2];
	}
}
static void newcmd49(void)
{
	PVal *pval1;
	APTR aptr1;	//�z��ϐ��̎擾
	aptr1 = code_getva(&pval1);//	���͕ϐ��̌^�Ǝ��̂̃|�C���^���擾
	HspVarProc *phvp1;
	void *ptr1;
	phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//�^����������HspVarProc�\���̂ւ̃|�C���^
	ptr1 = phvp1->GetPtr(pval1);					//�f�[�^�ipval1�j�̎��Ԃ�����擪�|�C���^���擾�B

	PVal *pval2;
	APTR aptr2;	//�z��ϐ��̎擾
	aptr2 = code_getva(&pval2);//	���͕ϐ��̌^�Ǝ��̂̃|�C���^���擾
	HspVarProc *phvp2;
	void *ptr2;
	phvp2 = exinfo->HspFunc_getproc(pval2->flag);	//�^����������HspVarProc�\���̂ւ̃|�C���^
	ptr2 = phvp2->GetPtr(pval2);					//�f�[�^�ipval1�j�̎��Ԃ�����擪�|�C���^���擾�B

	p3 = code_getdi(0) / 4;

	char *dmptr1 = (char*)ptr1;
	char *dmptr2 = (char*)ptr2;
	int idx1 = 0;
	int idx2 = 0;

	for (int i = 0; i < p3; i++) {
		idx1 = i * 3;
		idx2 = i * 4;
		dmptr2[idx1] = dmptr1[idx2];
		dmptr2[idx1 + 1] = dmptr1[idx2 + 1];
		dmptr2[idx1 + 2] = dmptr1[idx2 + 2];
	}
}
static void newcmd50(void)
{
	PVal *pval1;
	APTR aptr1;	//�z��ϐ��̎擾
	aptr1 = code_getva(&pval1);//	���͕ϐ��̌^�Ǝ��̂̃|�C���^���擾
	HspVarProc *phvp1;
	void *ptr1;
	phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//�^����������HspVarProc�\���̂ւ̃|�C���^
	ptr1 = phvp1->GetPtr(pval1);					//�f�[�^�ipval1�j�̎��Ԃ�����擪�|�C���^���擾�B

	PVal *pval2;
	APTR aptr2;	//�z��ϐ��̎擾
	aptr2 = code_getva(&pval2);//	���͕ϐ��̌^�Ǝ��̂̃|�C���^���擾
	HspVarProc *phvp2;
	void *ptr2;
	phvp2 = exinfo->HspFunc_getproc(pval2->flag);	//�^����������HspVarProc�\���̂ւ̃|�C���^
	ptr2 = phvp2->GetPtr(pval2);					//�f�[�^�ipval1�j�̎��Ԃ�����擪�|�C���^���擾�B

	p3 = code_getdi(0) / 3;


	int toumeiflg = code_getdi(0);
	char toumei_r = code_getdi(0);
	char toumei_g = code_getdi(0);
	char toumei_b = code_getdi(0);


	char *dmptr1 = (char*)ptr1;
	char *dmptr2 = (char*)ptr2;
	int idx1 = 0;
	int idx2 = 0;
	char tmpr = 0;
	char tmpg = 0;
	char tmpb = 0;

	if (toumeiflg == 0) {
		for (int i = 0; i < p3; i++) {
			idx1 = i * 4;
			idx2 = i * 3;
			tmpr = dmptr1[idx2];
			tmpg = dmptr1[idx2 + 1];
			tmpb = dmptr1[idx2 + 2];
			dmptr2[idx1] = tmpr;
			dmptr2[idx1 + 1] = tmpg;
			dmptr2[idx1 + 2] = tmpb;
			dmptr2[idx1 + 3] = 255;
		}
	}
	else {
		for (int i = 0; i < p3; i++) {
			idx1 = i * 4;
			idx2 = i * 3;
			tmpr = dmptr1[idx2];
			tmpg = dmptr1[idx2 + 1];
			tmpb = dmptr1[idx2 + 2];
			dmptr2[idx1] = tmpr;
			dmptr2[idx1 + 1] = tmpg;
			dmptr2[idx1 + 2] = tmpb;
			dmptr2[idx1 + 3] = 255;
			if (toumei_r == tmpr) { if (toumei_g == tmpg) { if (toumei_b == tmpb) { dmptr2[idx1 + 3] = 0; } } }
		}
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////









































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