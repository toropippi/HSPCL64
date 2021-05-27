#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
#include <windows.h>
#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <sstream>
#include <thread>

#include <CL/cl.h>
#include "hsp3plugin.h"
#include "hsp3struct.h"
#include "hspvar_int64.h"
#include "errmsg.h"
#include "RGB.h"


const int MAX_PLATFORM_IDS = 32;//platform_idの最大値
const int MAX_DEVICE_IDS = 2048;//一度に取得できるdeviceの最大値
int CL_EVENT_MAX = 65536;//cl_eventを記憶して置ける最大数
int COMMANDQUEUE_PER_DEVICE = 4;//1デバイスあたりのコマンドキュー、設定で変更できる
int dev_num = 0;//全プラットフォームのデバイスの合計数
int bufferout[1024 * 4];
cl_device_id *device_id;
cl_context *context;
cl_command_queue *command_queue;
cl_mem mem_obj;
cl_program program;
cl_kernel kernel;
cl_event* cppeventlist;//c++で管理するevent object。HSPからいじれるのはここだけ。HCLinitで実体化。メモリリーク予防目的。ここの中にあるeventのみ情報を保持し、それ以外のeventは必ずreleaseして破棄する
cl_event* event_wait_list;//HCLinitで実体化。次にeventでwaitしたいcl関数を使う際にあらかじめこれを設定しておいておくイメージ


struct EventStruct
{
	INT64 k;//kernel idまたはコピーサイズやら
	int devno;
	int queno;
};

EventStruct* evinfo;

int clsetdev = 0;//OpenCLで現在メインとなっているデバイスno
int clsetque = 0;//OpenCLで現在メインとなっているque
int cmd_properties = CL_QUEUE_PROFILING_ENABLE;//OpenCLのコマンドキュー生成時に使うプロパティ番号
int num_event_wait_list = 0;//NDRangeKernel とかで使うやつ。使う度に0になる
int thread_start = 0;//0はEnqueueまちがない、1以降はthreadに投げたがまだEnqueueされてない数





//自作関数
//int64だけを読み込むやつ
INT64 Code_getint64() {
	int prm;
	prm = code_getprm();					// 整数値を取得(デフォルトなし)
	if (prm <= PARAM_END) puterror(HSPERR_NO_DEFAULT);
	// パラメータ1:数値
	return *(INT64 *)HspVarInt64_Cnv(mpval->pt, mpval->flag);
}
//int32,int64両方の入力を場合分けで読み込むやつ
INT64 Code_geti32i64() {
	int chk = code_getprm();							// パラメーターを取得(型は問わない)
	int type = mpval->flag;							// パラメーターの型を取得
	void* ppttr;

	int sizeofff;
	switch (type) {
	case 8:								// パラメーターがint64だった時
	{
		ppttr = (INT64 *)mpval->pt;
		sizeofff = 8;
		break;
	}
	case HSPVAR_FLAG_INT:									// パラメーターが整数だった時
	{
		ppttr = (int *)mpval->pt;
		sizeofff = 4;
		break;
	}
	default:
		puterror(HSPERR_TYPE_MISMATCH);			// サポートしていない型ならばエラー
		break;
	}
	return *(INT64*)ppttr;
}


//int32,int64両方の入力を場合分けで読み込むやつ
INT64 Code_getdi32di64(INT64 defi) {
	int chk = code_getprm();							// パラメーターを取得(型は問わない)
	if (chk <= PARAM_END)return defi;
	int type = mpval->flag;							// パラメーターの型を取得
	void* ppttr;

	int sizeofff;
	switch (type) {
	case 8:								// パラメーターがint64だった時
	{
		ppttr = (INT64*)mpval->pt;
		sizeofff = 8;
		break;
	}
	case HSPVAR_FLAG_INT:									// パラメーターが整数だった時
	{
		ppttr = (int*)mpval->pt;
		sizeofff = 4;
		break;
	}
	default:
		puterror(HSPERR_TYPE_MISMATCH);			// サポートしていない型ならばエラー
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

size_t GetMemSize(cl_mem m) 
{
	size_t st;
	cl_int ret = clGetMemObjectInfo(
		m, CL_MEM_SIZE, sizeof(size_t), &st, NULL
	);
	if (ret != CL_SUCCESS) retmeserr12(ret);
	return st;
}

std::string readFileIntoString(const std::string& path) {
	std::ifstream input_file(path);
	if (!input_file.is_open()) {
		MessageBox(NULL, "ファイルが存在しません", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
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


void Thread_WriteBuffer(cl_command_queue cmd, cl_mem mem, INT64 ofst, INT64 size,
	const void* vptr, int num_event_wait_list__, cl_event* ev_, cl_event* outevent)
{
	//wait event list関連
	cl_int ret = clEnqueueWriteBuffer(cmd, mem, CL_FALSE, ofst,
		size, vptr, num_event_wait_list__, ev_, outevent);
	thread_start--;
	if (ret != CL_SUCCESS) { retmeserr2(ret); }
	return;
}

void Thread_ReadBuffer(cl_command_queue cmd, cl_mem mem, INT64 ofst, INT64 size,
	void* vptr,int num_event_wait_list__, cl_event* ev_, cl_event* outevent)
{
	//wait event list関連
	cl_int ret = clEnqueueReadBuffer(cmd, mem, CL_FALSE, ofst,
		size, vptr, num_event_wait_list__, ev_, outevent);
	thread_start--;
	if (ret != CL_SUCCESS) { retmeserr2(ret); }
	return;
}

//prm3は参照渡しであることに注意
void AutoReadWriteCopySize(INT64 &prm3,PVal* pval, cl_mem prm1)
{
	INT64 host_sz = pval->size;
	INT64 dev_sz = GetMemSize((cl_mem)prm1);
	if (prm3 == -1)
	{
		prm3 = min(dev_sz, host_sz);
	}
	else
	{
		if (prm3 > host_sz)
		{
			std::string ss = "";
			ss += "コピーサイズ>HSP配列変数サイズ です。\nコピーサイズ=";
			ss += std::to_string(prm3);
			ss += "\nHSP配列変数サイズ=";
			ss += std::to_string(host_sz);
			MessageBox(NULL, ss.c_str(), "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
		}
		if (prm3 > dev_sz)
		{
			std::string ss = "";
			ss += "コピーサイズ>デバイスメモリサイズ です。\nコピーサイズ=";
			ss += std::to_string(prm3);
			ss += "\nデバイスメモリサイズ=";
			ss += std::to_string(dev_sz);
			MessageBox(NULL, ss.c_str(), "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
		}
	}
	return;
}
////////////自作関数ここまで



































// 64bit dll call
__declspec(align(16)) extern "C" INT64 __fastcall call_extfunc64(void *proc, INT64 *prm, INT64 *pinfo, INT64 prms);
__declspec(align(16)) extern "C" double __fastcall call_extfunc64d(void *proc, INT64 *prm, INT64 *pinfo, INT64 prms);
__declspec(align(16)) extern "C" float __fastcall call_extfunc64f(void *proc, INT64 *prm, INT64 *pinfo, INT64 prms);

 /*------------------------------------------------------------*/
/*
		controller
*/
/*------------------------------------------------------------*/

static INT64 ref_int64val;						// 返値のための変数
static double ref_doubleval;						// 返値のための変数
static float ref_floatval;						// 返値のための変数
static int ref_int32val;						// 返値のための変数

static void *reffunc( int *type_res, int cmd )
{
	//		関数・システム変数の実行処理 (値の参照時に呼ばれます)
	//
	//			'('で始まるかを調べる
	//
	if ( *type != TYPE_MARK ) puterror( HSPERR_INVALID_FUNCPARAM );
	if ( *val != '(' ) puterror( HSPERR_INVALID_FUNCPARAM );
	code_next();

	bool fDouble = false;
	bool fFloat = false;
	bool fInt = false;
	
	switch( cmd ) {							// サブコマンドごとの分岐

	case 0x00:								// int64関数
	{
		int prm;
		prm = code_getprm();					// 整数値を取得(デフォルトなし)
		if (prm <= PARAM_END) puterror(HSPERR_NO_DEFAULT);
		ref_int64val = *(INT64 *)HspVarInt64_Cnv(mpval->pt, mpval->flag);
		break;
	}
	case 0x01:								// qpeek関数
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
		// 1パラ= パラメタ(INT64変数), 2パラ= パラメタの型(INT64変数), 3パラ = アドレス(INT64), 4パラ = パラメタ数(INT64)
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
		prm = code_getprm();					// 整数値を取得(デフォルトなし)
		if (prm <= PARAM_END) puterror(HSPERR_NO_DEFAULT);
		INT64 prm3 = *(INT64 *)HspVarInt64_Cnv(mpval->pt, mpval->flag);

		prm = code_getprm();					// 整数値を取得(デフォルトなし)
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


	////////////////////////////////////////////////////////////ここから自作
	case 0x54://HCLGetDeviceCount
	{
		fInt = true;
		ref_int32val = (int)dev_num;
		break;
	}

	case 0x56://HCLGetSettingDevice
	{
		fInt = true;
		ref_int32val = (int)clsetdev;
		break;
	}

	//str filename,str buildoption=""
	case 0x57:	// HCLCreateProgram
	{
		char* pathname;
		pathname = code_gets();								// 文字列を取得
		std::string s_sourse = readFileIntoString(std::string(pathname));

		char* c_option;
		c_option = code_getds("");								// 文字列を取得
		std::string buildoption;
		buildoption = std::string(c_option);

		// Build the program
		ref_int64val = (INT64)WithSource_func(context[clsetdev], s_sourse, buildoption);
		break;
	}

	case 0x58://HCLCreateProgramWithSource(str "   ")
	{
		char* c_source;
		c_source = code_gets();								// ソースコード
		std::string s_sourse = std::string(c_source);

		char* c_option;
		c_option = code_getds("");								// ビルドオプション文字列を取得
		std::string buildoption;
		buildoption = std::string(c_option);

		// Build the program
		ref_int64val = (INT64)WithSource_func(context[clsetdev], s_sourse, buildoption);
		break;
	}

	//int64 kernelid,str kansuu_mei
	case 0x5A:	// HCLCreateKernel
	{
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値、カーネルid
		char* p;
		char pathname[_MAX_PATH];
		p = code_gets();								// 文字列を取得
		strncpy(pathname, p, _MAX_PATH - 1);			// 取得した文字列をコピー
		cl_int ret;
		kernel = clCreateKernel((cl_program)prm1, pathname, &ret);
		ref_int64val = (INT64)kernel;
		if (ret != CL_SUCCESS) retmeserr8(ret);
		break;
	}

	//int64 bufsize
	case 0x5E:	// HCLCreateBuffer
	{
		INT64 prm1 = Code_geti32i64();//パラメータ1:int64数値、サイズ
		cl_int ret;
		mem_obj = clCreateBuffer(context[clsetdev], CL_MEM_READ_WRITE, prm1, NULL, &ret);
		if (ret != CL_SUCCESS) retmeserr9(ret);
		ref_int64val = (INT64)mem_obj;
		break;
	}

	case 0x5F://HCLCreateBufferFrom
	{
		PVal* pval1 = code_getpval();
		size_t sz = pval1->size;
		cl_int ret;
		mem_obj = clCreateBuffer(context[clsetdev], CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR, sz, (pval1->pt), &ret);
		if (ret != CL_SUCCESS) retmeserr9(ret);
		ref_int64val = (INT64)mem_obj;
		break;
	}

	case 0x66://HCLReadIndex_i32
	{
		fInt = true;
		INT64 memid = Code_geti32i64();
		INT64 b = Code_geti32i64();//idx
		cl_int ret = clEnqueueReadBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque], (cl_mem)memid, CL_TRUE, b * 4, 4, &ref_int32val, 0, NULL, NULL);
		if (ret != CL_SUCCESS) { retmeserr2(ret); }
		break;
	}

	case 0x67://HCLReadIndex_i64
	{
		INT64 memid = Code_geti32i64();
		INT64 b = Code_geti32i64();//idx
		cl_int ret = clEnqueueReadBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque], (cl_mem)memid, CL_TRUE, b * 8, 8, &ref_int64val, 0, NULL, NULL);
		if (ret != CL_SUCCESS) { retmeserr2(ret); }
		break;
	}

	case 0x68://HCLReadIndex_dp
	{
		fDouble = true;
		INT64 memid = Code_geti32i64();
		INT64 b = Code_geti32i64();//idx
		cl_int ret = clEnqueueReadBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque], (cl_mem)memid, CL_TRUE, b * 8, 8, &ref_doubleval, 0, NULL, NULL);
		if (ret != CL_SUCCESS) { retmeserr2(ret); }
		break;
	}

	case 0x75://HCLGetSettingCommandQueue
	{
		fInt = true;
		ref_int32val = (int)clsetque;
		break;
	}

	//複合関数 64bit整数*8パターンが出力
	case 0x7A:// HCLGetEventLogs
	{
		//#define global CL_PROFILING_COMMAND_QUEUED                 0x1280
		//#define global CL_PROFILING_COMMAND_SUBMIT                 0x1281
		//#define global CL_PROFILING_COMMAND_START                  0x1282
		//#define global CL_PROFILING_COMMAND_END                    0x1283
		int eventid = code_geti();
		int secprm = code_geti();
		//0:そのイベントがCL_COMMAND_NDRANGE_KERNELだったか、CL_COMMAND_WRITE_BUFFERだったか
		//1:kernel_idかコピーサイズ
		//2:そのeventを実行したdevice no
		//3:そのeventを実行したque no
		//4:CL_PROFILING_COMMAND_QUEUEDの時間
		//5:CL_PROFILING_COMMAND_SUBMITの時間
		//6:CL_PROFILING_COMMAND_STARTの時間
		//7:CL_PROFILING_COMMAND_ENDの時間
		ref_int64val = 0;
		cl_int ret = CL_SUCCESS;
		if (secprm == 0) ret = clGetEventInfo(cppeventlist[eventid], CL_EVENT_COMMAND_TYPE, 8, &ref_int64val, NULL);
		if (secprm == 1) ref_int64val = evinfo[eventid].k;
		if (secprm == 2) ref_int64val = evinfo[eventid].devno;
		if (secprm == 3) ref_int64val = evinfo[eventid].queno;

		for (int i = 0; i < 4; i++) 
		{
			if (secprm == i + 4)
			{
				ret = clGetEventProfilingInfo(cppeventlist[eventid], CL_PROFILING_COMMAND_QUEUED + i, sizeof(INT64), &ref_int64val, NULL);
			}
		}
		if (ret != CL_SUCCESS) retmeserr5(ret);
		break;
	}

	case 0x7B://HCLGetEventStatus
	{
		fInt = true;
		int eventid = code_geti();
		cl_int ret;
		ret = clGetEventInfo(cppeventlist[eventid], CL_EVENT_COMMAND_EXECUTION_STATUS, 4, &ref_int32val, NULL);
		if (ret != CL_SUCCESS) retmeserr5(ret);
		break;
	}

	case 0x7F://Min64
	{
		INT64 a = Code_geti32i64();
		INT64 b = Code_geti32i64();
		ref_int64val = b;
		if (a < b)ref_int64val = a;
		break;
	}

	case 0x80://Max64
	{
		INT64 a = Code_geti32i64();
		INT64 b = Code_geti32i64();
		ref_int64val = b;
		if (a > b)ref_int64val = a;
		break;
	}

	case 0x88:	//HCLGet_NonBlocking_Status
	{
		fInt = true;
		ref_int32val = thread_start;
		break;
	}

	case 0x81:	//double to float
	{
		fInt = true;
		double d = code_getd();
		float ret = (float)d;
		ref_int32val = (int)(*(int*)&ret);
		break;
	}

	case 0x82:	//float to double
	{
		fDouble = true;
		int fi = code_geti();
		float f = (float)(*(float*)&fi);
		double d = (double)f;
		ref_doubleval = d;
		break;
	}

	////////////////////////////////////////////////////////////ここまで

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


	*type_res = HspVarInt64_typeid();		// 返値のタイプを指定する
	return (void *)&ref_int64val;
}


























































































































static int cmdfunc(int cmd)
{
	code_next();

	switch (cmd) {
	case 0x02:								// qpoke関数
	{
		PVal *pval;
		APTR aptr = code_getva(&pval);
		int size = pval->size;
		p1 = code_geti();

		if (p1<0) throw HSPERR_BUFFER_OVERFLOW;

		if ((p1 + 8)>size) throw HSPERR_BUFFER_OVERFLOW;

		int prm;
		prm = code_getprm();					// 整数値を取得(デフォルトなし)
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


	////////////////////////////////////////////////////////////ここから自作

	case 0x50://HCLinit
	{
		cl_int errcode_ret;
		cl_platform_id platform_id[MAX_PLATFORM_IDS];
		cl_uint ret_num_devices;
		cl_uint ret_num_platforms;

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
			MessageBox(NULL, "No OpenCL Devices\nHSPCL64は使えません", "error", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		}

		device_id = new cl_device_id[dev_num];

		int dev_num_ = 0;
		for (int i = 0; i < (int)ret_num_platforms; i++) {
			clGetDeviceIDs(platform_id[i], CL_DEVICE_TYPE_ALL, MAX_DEVICE_IDS, &_device_id[0], &ret_num_devices);

			for (int i = 0; i < (int)ret_num_devices; i++)
			{
				device_id[dev_num_ + i] = _device_id[i];
			}
			dev_num_ += ret_num_devices;
		}
		//////////デバイス情報を取得しまくっているところ

		//ここでコンテキストとコマンドキュー生成
		context = new cl_context[dev_num];
		command_queue = new cl_command_queue[dev_num * COMMANDQUEUE_PER_DEVICE];

		for (int k = 0; k < dev_num; k++)
		{//コンテキストとコマンド級ーを作る
			context[k] = clCreateContext(NULL, 1, &device_id[k], NULL, NULL, &errcode_ret);
			if (errcode_ret != CL_SUCCESS) retmeserr4(errcode_ret);

			for (int i = 0; i < COMMANDQUEUE_PER_DEVICE; i++)
			{
				command_queue[k * COMMANDQUEUE_PER_DEVICE + i] =
					clCreateCommandQueue(context[k], device_id[k], cmd_properties, &errcode_ret);
				if (errcode_ret != CL_SUCCESS) retmeserr3(errcode_ret);
			}
		}

		//最後にevent変数生成
		
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

	case 0x51://dim_i64
	{
		PVal* pval1;
		APTR aptr1;
		aptr1 = code_getva(&pval1);
		exinfo->HspFunc_dim(pval1, 8, 0, code_getdi(0), 0, 0, 0);
		break;
	}

	case 0x53:	// HCLSetDevice
	{
		clsetdev = code_getdi(0);
		break;
	}

	case 0x55:	// HCLGetDeviceInfo
	{
		cl_device_info devinfoi = code_getdi(0);
		size_t szt = 0;

		clGetDeviceInfo(device_id[clsetdev], devinfoi, sizeof(bufferout), &bufferout, &szt);
		INT64* datp = (INT64*)&bufferout[0];
		PVal* pval;
		APTR aptr;
		aptr = code_getva(&pval);
		code_setva(pval, aptr, HspVarInt64_typeid(), &datp);

		PVal* pval2;
		APTR aptr2;
		aptr2 = code_getva(&pval2);
		code_setva(pval2, aptr2, HSPVAR_FLAG_INT, &szt);
		break;
	}

	case 0x59://HCLReleaseProgram
	{
		//引数1 kernel
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値
		clReleaseProgram((cl_program)prm1);
		break;
	}

	case 0x5B:	// HCLSetKernel
	{
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値、カ－ネルid
		p2 = code_getdi(0);		// パラメータ2:数値、引数

		int chk = code_getprm();							// パラメーターを取得(型は問わない)

		int type = mpval->flag;							// パラメーターの型を取得
		void* ppttr;
		int sizeofff = -1;
		switch (type) {
		case HSPVAR_FLAG_STR:								// パラメーターが文字列だった時
		{
			ppttr = (char*)mpval->pt;
			sizeofff = 1;
			break;
		}
		case HSPVAR_FLAG_DOUBLE:									// パラメーターが実数だった時
		{
			ppttr = (double*)mpval->pt;
			sizeofff = 8;
			break;
		}
		case 8:								// パラメーターがint64だった時
		{
			ppttr = (INT64*)mpval->pt;
			sizeofff = 8;
			break;
		}
		case HSPVAR_FLAG_INT:									// パラメーターが整数だった時
		{
			ppttr = (int*)mpval->pt;
			sizeofff = 4;
			break;
		}
		default:
			puterror(HSPERR_TYPE_MISMATCH);			// サポートしていない型ならばエラー
			sizeofff = -1;
			break;
		}

		int p4 = code_getdi(0);		// パラメータ4:ローカルメモリーフラグ
		int clret = 0;

		if (prm1 == 0)
		{
			MessageBox(NULL, "カーネルidが0です", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
		}
		else
		{
			//prm1カーネルid、p2は引数位置、p3には実態、p4はローカルメモリフラグ
			if (p4 == 0) { clret = clSetKernelArg((cl_kernel)prm1, p2, sizeofff, ppttr); }
			if (p4 != 0) { clret = clSetKernelArg((cl_kernel)prm1, p2, p4, NULL); }
		}

		break;
	}

	case 0x5C://HCLSetKrns
	{
		INT64 prm1 = Code_getint64();		// パラメータ1:カーネル
		if (prm1 == 0) {
			MessageBox(NULL, "カーネルidが0です", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
		}

		void* ppttr;
		int sizeofff;
		int chk;
		int type;

		for (int i = 0; i < 32; i++) {
			chk = code_getprm();							// パラメーターを取得(型は問わない)
			if (chk <= PARAM_END) {
				break;										// パラメーター省略時の処理
			}
			type = mpval->flag;							// パラメーターの型を取得
			switch (type) {
			case HSPVAR_FLAG_STR:								// パラメーターが文字列だった時
			{
				ppttr = (char*)mpval->pt;
				sizeofff = 1;
				break;
			}
			case HSPVAR_FLAG_DOUBLE:									// パラメーターが実数だった時
			{
				ppttr = (double*)mpval->pt;
				sizeofff = 8;
				break;
			}

			case 8:								// パラメーターがint64だった時
			{
				ppttr = (INT64*)mpval->pt;
				sizeofff = 8;
				break;
			}
			case HSPVAR_FLAG_INT:									// パラメーターが整数だった時
			{
				ppttr = (int*)mpval->pt;
				sizeofff = 4;
				break;
			}
			default:
				puterror(HSPERR_TYPE_MISMATCH);			// サポートしていない型ならばエラー
			}

			//p1カーネルid、p2は引数位置、p3には実態、p4はローカルメモリフラグ
			clSetKernelArg((cl_kernel)prm1, i, sizeofff, ppttr);
		}
		break;
	}

	case 0x5D://HCLReleaseKernel
	{
		//引数1 kernel
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値
		clReleaseKernel((cl_kernel)prm1);
		break;
	}

	case 0x60:	// HCLWriteBuffer
	{
		//引数1
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値、memobj
		//引数2。HSP側の配列変数
		PVal* pval = code_getpval();
		//引数3、コピーサイズ
		INT64 prm3 = Code_getdi32di64(-1);//パラメータ3:int64
		//引数4、コピー先のofset
		INT64 prm4 = Code_getdi32di64(0);//パラメータ4:int64
		//引数5、コピー元のofset
		INT64 prm5 = Code_getdi32di64(0);//パラメータ5
		int p7 = code_getdi(1);		//ブロッキングモード
		cl_bool TorF = ((p7 == 0) ? CL_FALSE : CL_TRUE);
		
		//引数省略ならサイズは自動
		AutoReadWriteCopySize(prm3, pval, (cl_mem)prm1);////prm3は参照渡しであることに注意

		//outevent関連
		int outeventptr = code_getdi(-1);//outeventするか
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			if (cppeventlist[outeventptr] != NULL)
				clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm3;
			evinfo[outeventptr].devno = clsetdev;
			evinfo[outeventptr].queno = clsetque;
		}

		//Intel CPUでは正しくブロッキングできないので、event作成してきちんとwaitしてもらう
		cl_event tmpev;

		//wait event list関連
		cl_event* ev_ = GetWaitEvlist();

		cl_int ret = clEnqueueWriteBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque], (cl_mem)prm1, TorF, prm4,
			prm3, (char*)((pval->pt) + prm5), num_event_wait_list, ev_, &tmpev);
		if (ret != CL_SUCCESS) { retmeserr2(ret); }

		//Intel CPUでは正しくブロッキングできないので、event作成してきちんとwaitしてもらう
		if (TorF == CL_TRUE) 
		{
			cl_int ret = clWaitForEvents(1, &tmpev);
			if (ret != CL_SUCCESS) retmeserr6(ret);
			if (outeventptr >= 0)
			{
				cppeventlist[outeventptr] = tmpev;
			}
			else 
			{
				clReleaseEvent(tmpev);
			}
		}
		else 
		{
			if (outeventptr >= 0)
			{
				cppeventlist[outeventptr] = tmpev;
			}
		}

		num_event_wait_list = 0;
		break;
	}

	case 0x61:	// HCLReadBuffer
	{
		//引数1
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値、memobj
		//引数2。HSP側の配列変数
		PVal* pval = code_getpval();
		//引数3、コピーサイズ
		INT64 prm3 = Code_getdi32di64(-1);//パラメータ3:int64
		//引数4、コピー先のofset
		INT64 prm4 = Code_getdi32di64(0);//パラメータ4:int64
		//引数5、コピー元のofset
		INT64 prm5 = Code_getdi32di64(0);//パラメータ5
		int p7 = code_getdi(1);		//ブロッキングモード
		cl_bool TorF = ((p7 == 0) ? CL_FALSE : CL_TRUE);

		//引数省略ならサイズは自動
		AutoReadWriteCopySize(prm3, pval, (cl_mem)prm1);////prm3は参照渡しであることに注意

		//outevent関連
		int outeventptr = code_getdi(-1);//outeventするか
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			if (cppeventlist[outeventptr] != NULL)
				clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm3;
			evinfo[outeventptr].devno = clsetdev;
			evinfo[outeventptr].queno = clsetque;
		}
		//wait event list関連
		cl_event* ev_ = GetWaitEvlist();
		cl_int ret = clEnqueueReadBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque], (cl_mem)prm1, TorF, prm4,
			prm3, (char*)((pval->pt) + prm5), num_event_wait_list, ev_, outevent);
		if (ret != CL_SUCCESS) { retmeserr2(ret); }

		num_event_wait_list = 0;
		break;
	}

	//コンパイル時に-pthread が必要
	case 0x86:	// HCLWriteBuffer_NonBlocking
	{
		//引数1
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値、memobj
		//引数2。HSP側の配列変数
		PVal* pval = code_getpval();
		//引数3、コピーサイズ
		INT64 prm3 = Code_getdi32di64(-1);//パラメータ3:int64
		//引数4、コピー先のofset
		INT64 prm4 = Code_getdi32di64(0);//パラメータ4:int64
		//引数5、コピー元のofset
		INT64 prm5 = Code_getdi32di64(0);//パラメータ5
		cl_bool p7 = code_getdi(1);		//ブロッキングモード

		//引数省略ならサイズは自動
		AutoReadWriteCopySize(prm3, pval, (cl_mem)prm1);////prm3は参照渡しであることに注意

		//outevent関連
		int outeventptr = code_getdi(-1);//outeventするか
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			if (cppeventlist[outeventptr] != NULL)
				clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm3;
			evinfo[outeventptr].devno = clsetdev;
			evinfo[outeventptr].queno = clsetque;
		}

		cl_event* ev_;
		if (num_event_wait_list == 0) 
		{
			ev_ = NULL;
		}
		else 
		{
			ev_ = new cl_event[num_event_wait_list];
			for (int i = 0; i < num_event_wait_list; i++) 
			{
				ev_[i] = event_wait_list[i];
			}
		}
		
		cl_command_queue cmd = command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque];
		void* vptr = (char*)((pval->pt) + prm5);
		mem_obj = (cl_mem)prm1;
		//ここで別スレッドになげる
		thread_start++;
		std::thread th(Thread_WriteBuffer, cmd, mem_obj, prm4, prm3, vptr, num_event_wait_list, ev_, outevent);
		th.detach();
		num_event_wait_list = 0;
		break;
	}

	case 0x87:	// HCLReadBuffer_NonBlocking
	{
		//引数1
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値、memobj
		//引数2。HSP側の配列変数
		PVal* pval = code_getpval();
		//引数3、コピーサイズ
		INT64 prm3 = Code_getdi32di64(-1);//パラメータ3:int64
		//引数4、コピー先のofset
		INT64 prm4 = Code_getdi32di64(0);//パラメータ4:int64
		//引数5、コピー元のofset
		INT64 prm5 = Code_getdi32di64(0);//パラメータ5
		cl_bool p7 = code_getdi(1);		//ブロッキングモード

		//引数省略ならサイズは自動
		AutoReadWriteCopySize(prm3, pval, (cl_mem)prm1);////prm3は参照渡しであることに注意
		

		//outevent関連
		int outeventptr = code_getdi(-1);//outeventするか
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			if (cppeventlist[outeventptr] != NULL)
				clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm3;
			evinfo[outeventptr].devno = clsetdev;
			evinfo[outeventptr].queno = clsetque;
		}

		cl_event* ev_;
		if (num_event_wait_list == 0)
		{
			ev_ = NULL;
		}
		else
		{
			ev_ = new cl_event[num_event_wait_list];
			for (int i = 0; i < num_event_wait_list; i++)
			{
				ev_[i] = event_wait_list[i];
			}
		}

		cl_command_queue cmd = command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque];
		void* vptr = (char*)((pval->pt) + prm5);
		mem_obj = (cl_mem)prm1;
		//ここで別スレッドになげる
		thread_start++;
		std::thread th(Thread_ReadBuffer, cmd, mem_obj, prm4, prm3, vptr, num_event_wait_list, ev_, outevent);
		th.detach();
		break;
	}

	case 0x62:	// HCLCopyBuffer
	{
		INT64 prm2 = Code_getint64();//コピー先メモリオブジェクトid
		INT64 prm3 = Code_getint64();//コピー元メモリオブジェクトid
		INT64 prm4 = Code_getdi32di64(-1);// コピーサイズ
		INT64 prm5 = Code_getdi32di64(0);// コピー先オフセット
		INT64 prm6 = Code_getdi32di64(0);// コピー元オフセット
		//引数省略ならサイズは自動
		INT64 sz2 = GetMemSize((cl_mem)prm2);
		INT64 sz3 = GetMemSize((cl_mem)prm3);
		if (prm4 == -1)
		{
			prm4 = min(sz2, sz3);
		}
		else 
		{
			if (prm4 > sz2) 
			{
				std::string ss = "";
				ss += "コピーサイズ>コピー先メモリサイズ です。\nコピーサイズ=";
				ss += std::to_string(prm4);
				ss += "\nコピー先サイズ=";
				ss += std::to_string(sz2);
				MessageBox(NULL, ss.c_str(), "エラー", 0);
				puterror(HSPERR_UNSUPPORTED_FUNCTION);
			}
			if (prm4 > sz3)
			{
				std::string ss = "";
				ss += "コピーサイズ>コピー元メモリサイズ です。\nコピーサイズ=";
				ss += std::to_string(prm4);
				ss += "\nコピー元サイズ=";
				ss += std::to_string(sz3);
				MessageBox(NULL, ss.c_str(), "エラー", 0);
				puterror(HSPERR_UNSUPPORTED_FUNCTION);
			}
		}

		//outevent関連
		int outeventptr = code_getdi(-1);//outeventするか
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			if (cppeventlist[outeventptr] != NULL)
				clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm4;
			evinfo[outeventptr].devno = clsetdev;
			evinfo[outeventptr].queno = clsetque;
		}
		//wait event list関連
		cl_event* ev_ = GetWaitEvlist();
		cl_int ret = clEnqueueCopyBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
			(cl_mem)prm3, (cl_mem)prm2, prm6, prm5, prm4, num_event_wait_list, ev_, outevent);
		num_event_wait_list = 0;
		if (ret != CL_SUCCESS)retmeserr2(ret);
		break;
	}

	//GPU上で実行
	case 0x63://HCLFillBuffer_i32
	{
		//引数1 buffer
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値、memobj

		//引数2 pattern
		int pattern = code_getdi(0);

		//引数3、offset(byte)
		INT64 prm4 = Code_getdi32di64(0);//パラメータ4:int64

		//引数4、size(byte)
		INT64 prm5 = Code_getdi32di64(-1);//パラメータ5
		if (prm5 == -1)prm5 = GetMemSize((cl_mem)prm1);


		cl_int ret;
		//outevent関連
		int outeventptr = code_getdi(-1);
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm5;
			evinfo[outeventptr].devno = clsetdev;
			evinfo[outeventptr].queno = clsetque;
		}
		//wait event list関連
		cl_event* ev_ = GetWaitEvlist();

		ret = clEnqueueFillBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
			(cl_mem)prm1, &pattern, 4, prm4, prm5, num_event_wait_list, ev_, outevent);
		if (ret != CL_SUCCESS) { retmeserr(ret); }
		num_event_wait_list = 0;
		break;
	}

	case 0x64://HCLFillBuffer_i64
	{
		//引数1 buffer
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値、memobj

		//引数2 pattern
		INT64 pattern = Code_getint64();

		//引数3、offset(byte)
		INT64 prm4 = Code_getdi32di64(0);//パラメータ4:int64

		//引数4、size(byte)
		INT64 prm5 = Code_getdi32di64(-1);//パラメータ5
		if (prm5 == -1)prm5 = GetMemSize((cl_mem)prm1);


		cl_int ret;
		//outevent関連
		int outeventptr = code_getdi(-1);
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm5;
			evinfo[outeventptr].devno = clsetdev;
			evinfo[outeventptr].queno = clsetque;
		}
		//wait event list関連
		cl_event* ev_ = GetWaitEvlist();

		ret = clEnqueueFillBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
			(cl_mem)prm1, &pattern, 8, prm4, prm5, num_event_wait_list, ev_, outevent);
		if (ret != CL_SUCCESS) { retmeserr(ret); }
		num_event_wait_list = 0;
		break;
	}

	//GPU上で実行
	case 0x8B://HCLFillBuffer_dp
	{
		//引数1 buffer
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値、memobj

		//引数2 pattern
		double pattern = code_getdd(0.0);

		//引数3、offset(byte)
		INT64 prm4 = Code_getdi32di64(0);//パラメータ4:int64

		//引数4、size(byte)
		INT64 prm5 = Code_getdi32di64(-1);//パラメータ5
		if (prm5 == -1)prm5 = GetMemSize((cl_mem)prm1);

		cl_int ret;
		//outevent関連
		int outeventptr = code_getdi(-1);
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm5;
			evinfo[outeventptr].devno = clsetdev;
			evinfo[outeventptr].queno = clsetque;
		}
		//wait event list関連
		cl_event* ev_ = GetWaitEvlist();

		ret = clEnqueueFillBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
			(cl_mem)prm1, &pattern, 8, prm4, prm5, num_event_wait_list, ev_, outevent);
		if (ret != CL_SUCCESS) { retmeserr(ret); }
		num_event_wait_list = 0;
		break;
	}

	case 0x65://HCLReleaseBuffer
	{
		INT64 prm2 = Code_getint64();		// パラメータ1:memobj

		cl_int ret = 0;
		ret = clReleaseMemObject((cl_mem)prm2);

		if (ret != CL_SUCCESS) {
			MessageBox(NULL, "メモリ開放ができませんでした", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
		}
		break;
	}

	case 0x69://HCLWriteIndex_i32
	{
		INT64 memid = Code_geti32i64();
		INT64 b = Code_geti32i64();//idx
		int data = code_geti();//内容
		cl_int ret = clEnqueueWriteBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque], (cl_mem)memid, CL_TRUE, b * 4, 4, &data, 0, NULL, NULL);
		if (ret != CL_SUCCESS) { retmeserr2(ret); }
		break;
	}

	case 0x6A://HCLWriteIndex_i64
	{
		INT64 memid = Code_geti32i64();
		INT64 b = Code_geti32i64();//idx
		INT64 data = Code_geti32i64();//内容
		cl_int ret = clEnqueueReadBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque], (cl_mem)memid, CL_TRUE, b * 8, 8, &data, 0, NULL, NULL);
		if (ret != CL_SUCCESS) { retmeserr2(ret); }
		break;
	}

	case 0x6B://HCLWriteIndex_dp
	{
		INT64 memid = Code_geti32i64();
		INT64 b = Code_geti32i64();//idx
		double data = code_getd();//内容
		cl_int ret = clEnqueueReadBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque], (cl_mem)memid, CL_TRUE, b * 8, 8, &data, 0, NULL, NULL);
		if (ret != CL_SUCCESS) { retmeserr2(ret); }
		break;
	}

	// HCLCall
	// str source,int global_size,int local_size,array a,array b,array c・・・・・
	case 0x6C:
	{
		cl_int ret;
		char* c_source;
		c_source = code_gets();								// 文字列を取得
		std::string s_sourse = std::string(c_source);
		program = WithSource_func(context[clsetdev], s_sourse, "");
		ret = clCreateKernelsInProgram(program, 1, &kernel, NULL);//プログラムの中の最初にでてくるカーネルを取得
		if (ret != CL_SUCCESS)retmeserr8(ret);
		//次にglobal_sizeとlocal_size
		size_t global_size = code_getdi(1);	//並列数
		size_t local_size = code_getdi(1);
		//次に引数取得↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
		cl_mem clm[32];
		void* host_ptr[32];
		int copysize[32];
		for (int i = 0; i < 32; i++) { copysize[i] = 0; clm[i] = NULL; host_ptr[i] = NULL; }
		//一時配列設定おわった


		for (int i = 0; i < 32; i++) {
			//まずcl_mem型かそれ以外かを判定したい
			bool memorval = false;//falseはvalという意味、falseならcl_memを作らない
			bool trygetva = true;//getvaがうまくいけばtrue

			void* ppttr;//①
			int sizeofff;//②
			//この①②があれば転送できる
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

				//配列がありそうなら
				if (asz > 1)
				{
					if (pval->offset == 0)//添え字がちゃんと0なら
					{
						memorval = true;
						sizeofff = pval->size;
					}
					else//添え字に意味がありそうなら
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
					break;										// パラメーター省略時の処理
				}
				type = mpval->flag;							// パラメーターの型を取得
				switch (type) {
				case HSPVAR_FLAG_STR:								// パラメーターが文字列だった時
				{
					ppttr = (char*)mpval->pt;
					sizeofff = 1;
					break;
				}
				case HSPVAR_FLAG_DOUBLE:									// パラメーターが実数だった時
				{
					ppttr = (double*)mpval->pt;
					sizeofff = 8;
					break;
				}

				case 8:								// パラメーターがint64だった時
				{
					ppttr = (INT64*)mpval->pt;
					sizeofff = 8;
					break;
				}
				case HSPVAR_FLAG_INT:									// パラメーターが整数だった時
				{
					ppttr = (int*)mpval->pt;
					sizeofff = 4;
					break;
				}
				default:
					puterror(HSPERR_TYPE_MISMATCH);			// サポートしていない型ならばエラー
				}
			}




			if (memorval == false) //引数が普通のスカラーなら
			{
				//p1カーネルid、p2は引数位置、p3にはサイズ、p4は実体
				clSetKernelArg(kernel, i, sizeofff, ppttr);
			}
			else //引数がcl_memなら
			{
				clm[i] = clCreateBuffer(context[clsetdev], CL_MEM_READ_WRITE, pval->size, NULL, &ret);
				copysize[i] = pval->size;
				host_ptr[i] = ppttr;
				if (ret != CL_SUCCESS) retmeserr9(ret);
				//vramを確保し転送
				ret = clEnqueueWriteBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque], clm[i], CL_TRUE, 0,
					copysize[i], host_ptr[i], 0, NULL, NULL);
				if (ret != CL_SUCCESS) { retmeserr2(ret); }
				//ブロッキングありで転送
				//p1カーネルid、p2は引数位置、p3にはサイズ、p4は実体
				clSetKernelArg(kernel, i, 8, &clm[i]);
			}
		}

		//やっと引数設定が終わった↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

		//次に関数の実行
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

		//GPU→CPUに変数を戻してくる
		for (int i = 0; i < 32; i++)
		{
			if (copysize[i] != 0)
			{
				ret = clEnqueueReadBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque], clm[i], CL_TRUE, 0,
					copysize[i], host_ptr[i], 0, NULL, NULL);
				if (ret != CL_SUCCESS) { retmeserr2(ret); }
				//vramの解放
				ret = clReleaseMemObject(clm[i]);
				if (ret != CL_SUCCESS) {
					MessageBox(NULL, "メモリ開放ができませんでした", "エラー", 0);
					puterror(HSPERR_UNSUPPORTED_FUNCTION);
				}
				clm[i] = NULL; host_ptr[i] = NULL;
			}
		}

		//後片付け
		clReleaseKernel(kernel);
		clReleaseProgram(program);

		//これにて全行程終了のはず！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
		break;
	}

	case 0x6D:	// HCLDoKrn1 int p1,int p2,int p3,int p4
	{
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値、カ－ネルid
		size_t globalsize = code_getdi(1);
		size_t localsize = code_getdi(0);

		cl_int ret;
		//outevent関連
		int outeventptr = code_getdi(-1);
		cl_event* outevent = NULL;//今回の関数を記録したいイベント変数のポインタ
		if (outeventptr >= 0)
		{
			if (cppeventlist[outeventptr] != NULL)
				clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm1;
			evinfo[outeventptr].devno = clsetdev;
			evinfo[outeventptr].queno = clsetque;
		}
		//wait event list関連
		cl_event* ev_ = GetWaitEvlist();

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

	case 0x6E:	// HCLDoKernel int64 p1,int p2,array p3,array p4
	{
		INT64 prm2 = Code_getint64();		// カーネル
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
				PVal* pval1;
				APTR aptr1;	//配列変数の取得
				aptr1 = code_getva(&pval1);//	入力変数の型と実体のポインタを取得
				HspVarProc* phvp1;
				void* ptr1;
				phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//型を処理するHspVarProc構造体へのポインタ
				ptr1 = phvp1->GetPtr(pval1);					//データ（pval1）の実態がある先頭ポインタを取得。

				p4[0] = *(int*)ptr1;
				p4[1] = *((int*)ptr1 + 1);
				if (p3 == 3)
					p4[2] = *((int*)ptr1 + 2);

				PVal* pval2;
				APTR aptr2;	//配列変数の取得
				aptr2 = code_getva(&pval2);//	入力変数の型と実体のポインタを取得
				HspVarProc* phvp2;
				void* ptr2;
				phvp2 = exinfo->HspFunc_getproc(pval2->flag);	//型を処理するHspVarProc構造体へのポインタ
				ptr2 = phvp2->GetPtr(pval2);					//データ（pval1）の実態がある先頭ポインタを取得。

				ptryes[0] = *(int*)ptr2;
				ptryes[1] = *((int*)ptr2 + 1);
				if (p3 == 3)
					ptryes[2] = *((int*)ptr2 + 2);
			}
		}

		cl_int ret;

		//outevent関連
		int outeventptr = code_getdi(-1);//outeventするか
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			if (cppeventlist[outeventptr] != NULL)
				clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm2;
			evinfo[outeventptr].devno = clsetdev;
			evinfo[outeventptr].queno = clsetque;
		}

		//wait event list関連
		cl_event* ev_ = GetWaitEvlist();

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

	case 0x6F://HCLDoKrn1_sub
	{
		INT64 prm2 = Code_getint64();		// パラメータ1:カーネル
		size_t p4 = code_getdi(1);	//並列数
		size_t p5 = code_getdi(1);//ローカルサイズ
		if (p5 == 0) { p5 = 64; }
		size_t p4_1 = (p4 / p5) * p5;//p5で割り切れる数字に
		size_t p4_2 = p4 - p4_1;//問題の端数
		cl_int ret;

		//outevent関連
		int outeventptr = code_getdi(-1);//outeventするか
		cl_event* outevent = NULL;
		cl_event* outevent2 = NULL;
		if (outeventptr >= 0)
		{
			if (cppeventlist[outeventptr] != NULL)
				clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			evinfo[outeventptr].k = prm2;
			evinfo[outeventptr].devno = clsetdev;
			evinfo[outeventptr].queno = clsetque;
			if (p4_2 != 0)
			{
				int next_outeventptr = (outeventptr + 1) % CL_EVENT_MAX;
				clReleaseEvent(cppeventlist[next_outeventptr]);
				outevent2 = &cppeventlist[next_outeventptr];
				evinfo[next_outeventptr].k = prm2;
				evinfo[outeventptr].devno = clsetdev;
				evinfo[outeventptr].queno = clsetque;
			}
		}
		//wait event list関連
		cl_event* ev_ = GetWaitEvlist();

		if (p4_1 != 0) {
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
				(cl_kernel)prm2, 1, NULL, &p4_1, &p5, num_event_wait_list, ev_, outevent);//1回目は無事終わる
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

	case 0x70:	// HCLFinish//現在のデバイスの現在のコマンドキューの中にあるタスクを全部待つ
	{
		cl_int ret = clFinish(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque]);
		if (ret != CL_SUCCESS) { retmeserr10(ret); }
		break;
	}

	case 0x71:	// HCLFlush//コマンドキュー
	{
		cl_int ret = clFlush(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque]);
		if (ret != CL_SUCCESS) retmeserr11(ret);
		break;
	}

	case 0x72:	// _ExHCLSetCommandQueueMax
	{
		if (dev_num != 0)
		{
			MessageBox(NULL, "この命令はHCLinitの前に実行してください", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
		}
		COMMANDQUEUE_PER_DEVICE = code_geti();
		break;
	}

	case 0x73:	// _ExHCLSetCommandQueueProperties
	{
		if (dev_num != 0)
		{
			MessageBox(NULL, "この命令はHCLinitの前に実行してください", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
		}
		cmd_properties = code_geti();
		break;
	}

	case 0x74://HCLSetCommandQueue
	{
		clsetque = code_getdi(0);
		if (clsetque >= COMMANDQUEUE_PER_DEVICE)
		{
			MessageBox(NULL, "指定したコマンドキューのidが大きすぎます。\n_ExHCLSetCommandQueueMaxで最大値を変更してください。", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
		}
		break;
	}

	case 0x76:	// _ExHCLSetEventMax
	{
		if (dev_num != 0)
		{
			MessageBox(NULL, "この命令はHCLinitの前に実行してください", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
		}
		CL_EVENT_MAX = code_geti();
		break;
	}

	case 0x77:	//HCLSetWaitEvent int p1
	{
		p1 = code_geti();
		num_event_wait_list = 1;
		event_wait_list[0] = cppeventlist[p1];
		break;
	}

	case 0x78:	//HCLSetWaitEvents int num,array a
	{
		num_event_wait_list = code_geti();

		PVal* pval1;
		APTR aptr1;	//配列変数の取得
		aptr1 = code_getva(&pval1);//	入力変数の型と実体のポインタを取得
		HspVarProc* phvp1;
		void* ptr1;
		phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//型を処理するHspVarProc構造体へのポインタ
		ptr1 = phvp1->GetPtr(pval1);					//データ（pval1）の実態がある先頭ポインタを取得。

		for (int i = 0; i < num_event_wait_list; i++)
		{
			p2 = *((size_t*)ptr1 + i);
			event_wait_list[i] = cppeventlist[p2];
		}
		break;
	}

	case 0x79:  //HCLGetKernelName
	{
		kernel = (cl_kernel)Code_geti32i64();
		size_t szt = 0;
		cl_int ret = clGetKernelInfo(
			kernel, CL_KERNEL_FUNCTION_NAME, sizeof(bufferout), &bufferout, &szt);

		INT64* datp = (INT64*)&bufferout[0];
		PVal* pval;
		APTR aptr;
		aptr = code_getva(&pval);
		code_setva(pval, aptr, HspVarInt64_typeid(), &datp);

		PVal* pval2;
		APTR aptr2;
		aptr2 = code_getva(&pval2);
		code_setva(pval2, aptr2, HSPVAR_FLAG_INT, &szt);
		break;
	}

	case 0x7C:	// HCLWaitForEvent
	{
		int n = code_geti();
		cl_int ret = clWaitForEvents(1, &cppeventlist[n]);
		if (ret != CL_SUCCESS) retmeserr6(ret);
		break;
	}

	case 0x7D:	// HCLWaitForEvents int num,array a
	{
		int n = code_getdi(0);
		PVal* pval1;
		APTR aptr1;	//配列変数の取得
		aptr1 = code_getva(&pval1);//	入力変数の型と実体のポインタを取得
		HspVarProc* phvp1;
		void* ptr1;
		phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//型を処理するHspVarProc構造体へのポインタ
		ptr1 = phvp1->GetPtr(pval1);					//データ（pval1）の実態がある先頭ポインタを取得。

		for (int i = 0; i < n; i++)
		{
			p2 = *((size_t*)ptr1 + i);
			event_wait_list[i] = cppeventlist[p2];
		}

		cl_int ret = clWaitForEvents(n, event_wait_list);
		if (ret != CL_SUCCESS) retmeserr6(ret);
		break;
	}

	case 0x89:	// HCLCreateUserEvent
	{
		cl_int ret;
		int event_id = code_geti();
		if (cppeventlist[event_id] != NULL)
				clReleaseEvent(cppeventlist[event_id]);
		cppeventlist[event_id] = clCreateUserEvent(context[clsetdev], &ret);
		if (ret != CL_SUCCESS)retmeserr13(ret);
		break;
	}

	case 0x8A:	// HCLSetUserEventStatus
	{
		cl_int ret;
		int event_id = code_geti();
		cl_int event_stts = code_getdi(CL_SUBMITTED);

		ret = clSetUserEventStatus(cppeventlist[event_id], event_stts);
		if (ret != CL_SUCCESS)retmeserr14(ret);

		break;
	}
	
	case 0x8C:
	{
		char mybuf[8192];
		setvbuf(stdout, mybuf, _IOFBF, sizeof(mybuf));
		
		

		*type_res = HSPVAR_FLAG_STR;
		static const char* kRefstr = "refstr";
		return reinterpret_cast<void*>(const_cast<char*>(kRefstr));

		fflush(stdout);

	}
	//旧double to float
	/*
	case 0x81:  //double to float
	{
		PVal* pval1;
		APTR aptr1;	//配列変数の取得
		aptr1 = code_getva(&pval1);//	入力変数の型と実体のポインタを取得
		HspVarProc* phvp1;
		void* ptr1;
		phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//型を処理するHspVarProc構造体へのポインタ
		ptr1 = phvp1->GetPtr(pval1);					//データ（pval1）の実態がある先頭ポインタを取得。

		PVal* pval2;
		APTR aptr2;	//配列変数の取得
		aptr2 = code_getva(&pval2);//	入力変数の型と実体のポインタを取得
		HspVarProc* phvp2;
		void* ptr2;
		phvp2 = exinfo->HspFunc_getproc(pval2->flag);	//型を処理するHspVarProc構造体へのポインタ
		ptr2 = phvp2->GetPtr(pval2);					//データ（pval1）の実態がある先頭ポインタを取得。

		size_t sz = pval2->size / 4;
		for (int i = 0; i < sz; i++)
			*(((float*)ptr2) + i) = (float)(*(((double*)ptr1) + i));
		break;
	}

	case 0x82:  //float to double
	{
		PVal* pval1;
		APTR aptr1;	//配列変数の取得
		aptr1 = code_getva(&pval1);//	入力変数の型と実体のポインタを取得
		HspVarProc* phvp1;
		void* ptr1;
		phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//型を処理するHspVarProc構造体へのポインタ
		ptr1 = phvp1->GetPtr(pval1);					//データ（pval1）の実態がある先頭ポインタを取得。

		PVal* pval2;
		APTR aptr2;	//配列変数の取得
		aptr2 = code_getva(&pval2);//	入力変数の型と実体のポインタを取得
		HspVarProc* phvp2;
		void* ptr2;
		phvp2 = exinfo->HspFunc_getproc(pval2->flag);	//型を処理するHspVarProc構造体へのポインタ
		ptr2 = phvp2->GetPtr(pval2);					//データ（pval1）の実態がある先頭ポインタを取得。

		size_t sz = pval2->size / 8;
		for (int i = 0; i < sz; i++)
			*(((double*)ptr2) + i) = (double)(*(((float*)ptr1) + i));
		break;
	}
	*/
	case 0x83:								// newcmd31 //convRGBtoBGR
		_ConvRGBtoBGR();
		break;
	case 0x84:								// newcmd31 //convRGBAtoRGB
		_ConvRGBAtoRGB();
		break;
	case 0x85:								// newcmd31 //convRGBtoRGBA
		_ConvRGBtoRGBA();
		break;



	////////////////////////////////////////////////////////////ここまで


	default:
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
	}
	return RUNMODE_RUN;
}








































/*------------------------------------------------------------*/

static int termfunc( int option )
{
	//		終了処理 (アプリケーション終了時に呼ばれます)
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
	//		DLLエントリー (何もする必要はありません)
	//
	return TRUE;
}


EXPORT void WINAPI hsp3cmdinit( HSP3TYPEINFO *info )
{
	//		プラグイン初期化 (実行・終了処理を登録します)
	//
	hsp3sdk_init( info );		// SDKの初期化(最初に行なって下さい)

	info->reffunc = reffunc;		// 参照関数(reffunc)の登録
	info->cmdfunc = cmdfunc;		// 命令の登録
	info->termfunc = termfunc;		// 終了関数(termfunc)の登録

	registvar( -1, HspVarInt64_Init );		// 新しい型の追加
}

/*------------------------------------------------------------*/