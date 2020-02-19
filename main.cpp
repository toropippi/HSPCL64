
//
//		HSP3.0 plugin sample
//		onion software/onitama 2004/9
//
#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
#include <windows.h>
#include <string>
#include <stdio.h>
#include <stdlib.h>
#include "hsp3plugin.h"
#include "hsp3struct.h"
#include "hspvar_int64.h"
#include <CL/cl.h>


const int MAX_PLATFORM_IDS = 32;//platform_idの最大値
const int MAX_DEVICE_IDS = 2048;//一度に取得できるdeviceの最大値
int CL_EVENT_MAX = 65536;//cl_eventを記憶して置ける最大数
int COMMANDQUEUE_PER_DEVICE = 2;//1デバイスあたりのコマンドキュー、設定で変更できる
int dev_num = 0;//デバイスの数
int bufferout[1024 * 4];
char bugchar[1024 * 1024];
cl_device_id *device_id;
cl_context *context;
cl_command_queue *command_queue;
cl_mem mem_obj;
cl_program program;
cl_kernel kernel;
cl_event* cppeventlist;//c++で管理するevent object。HSPからいじれるのはここだけ。HCLinitで実体化。メモリリーク予防目的。ここの中にあるeventのみ情報を保持し、それ以外のeventは必ずreleaseして破棄する
cl_event* event_wait_list;//HCLinitで実体化

int clsetdev = 0;//OpenCLで現在メインとなっているデバイスno
int clsetque = 0;//OpenCLで現在メインとなっているque
int cmd_properties = 0;//OpenCLのコマンドキュー生成時に使うプロパティ番号
int num_event_wait_list = 0;//NDRangeKernel とかで使うやつ。使う度に0になる

void _ConvRGBtoBGR(void);
void _ConvRGBAtoRGB(void);
void _ConvRGBtoRGBA(void);
void retmeserr(cl_int ret);//clEnqueueNDRangeKernel で失敗した時出すエラーメッセージをまとめた関数
void retmeserr2(cl_int ret);//clReadで失敗した時出すエラーメッセージをまとめた関数
void retmeserr3(cl_int ret);//clCreateCommandQueueで失敗した時出すエラーメッセージをまとめた関数
void retmeserr4(cl_int ret);//clCreateContextで失敗した時出すエラーメッセージをまとめた関数
void mes(char* strc, int val);






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




























	case 0x09:	// HCLCreateProgram
	{
		char *p;
		char pathname[_MAX_PATH];
		p = code_gets();								// 文字列を取得
		strncpy(pathname, p, _MAX_PATH - 1);			// 取得した文字列をコピー

		FILE *fp;
		char *source_str;
		size_t source_size;
		if ((fp = fopen(pathname, "r")) == NULL) {
			puterror(HSPERR_FILE_IO);
		}
		else
		{
			source_str = new char[1024 * 1024 * 64];
			source_size = fread(source_str, 1, 1024 * 1024 * 64, fp);
			
			// Build the program
			program = clCreateProgramWithSource(context[clsetdev], 1, (const char **)&source_str, (const size_t *)&source_size, NULL);
			char* buildoption;
			buildoption = code_gets();
			cl_int err0 = clBuildProgram(program, 1, &device_id[clsetdev], buildoption, NULL, NULL);
			if (err0 != CL_SUCCESS) {
				size_t len;
				clGetProgramBuildInfo(program, device_id[clsetdev],
					CL_PROGRAM_BUILD_LOG, sizeof(bugchar), bugchar, &len);
				MessageBox(NULL, (LPCSTR)bugchar, "Error on OpenCL code", MB_OK);
				puterror(HSPERR_UNKNOWN_CODE);
			}
			fclose(fp);

			ref_int64val = (INT64)program;
		}
		
		break;
	}


	case 0x0A:	// HCLCreateKernel
	{
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値、カーネルid
		char *p;
		char pathname[_MAX_PATH];
		p = code_gets();								// 文字列を取得
		strncpy(pathname, p, _MAX_PATH - 1);			// 取得した文字列をコピー
		cl_int ret;

		kernel = clCreateKernel((cl_program)prm1, pathname, &ret);
		ref_int64val = (INT64)kernel;

		switch (ret) {							//分岐

		case CL_INVALID_PROGRAM:
			MessageBox(NULL, "program が有効なプログラムオブジェクトでない", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;

		case CL_INVALID_PROGRAM_EXECUTABLE:
			MessageBox(NULL, "program に正常にビルドされた実行可能プログラムがない", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;

		case CL_INVALID_KERNEL_NAME:
			MessageBox(NULL, "kernel_name が program 内に見つからない", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;

		case CL_INVALID_KERNEL_DEFINITION:
			MessageBox(NULL, "kernel_name が与える、引数や引数の型といった __kernel 関数の関数定義が、program がビルドされたすべてのデバイスで同じでない", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;

		case CL_INVALID_VALUE:
			MessageBox(NULL, "kernel_name が NULL", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;

		case CL_OUT_OF_RESOURCES:
			MessageBox(NULL, "デバイス上でのリソース確保に失敗した", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;

		case CL_OUT_OF_HOST_MEMORY:
			MessageBox(NULL, "ホスト上でのリソース確保に失敗した", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		}

		break;
	}


	
	case 0x0C:	// HCLCreateBuffer
	{
		INT64 prm1 = Code_geti32i64();//パラメータ1:int64数値、サイズ

		cl_int errcode_ret;
		mem_obj = clCreateBuffer(context[clsetdev], CL_MEM_READ_WRITE,
			prm1, NULL, &errcode_ret);
		
		switch (errcode_ret) {							//分岐

		case CL_INVALID_CONTEXT:
			MessageBox(NULL, "context が有効なOpenCLコンテキストでない", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_INVALID_VALUE:
			MessageBox(NULL, "読み書き専用メモリが用意できませんでした", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_INVALID_KERNEL:
			MessageBox(NULL, "size が 0 のとき。もしくは size が context 内のデバイスの CL_DEVICE_MAX_MEM_ALLOC_SIZE の値より大きい", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_INVALID_HOST_PTR:
			MessageBox(NULL, "host_ptr が NULL で CL_MEM_USE_HOST_PTR もしくは CL_MEM_COPY_HOST_PTR が flags に指定されているとき。もしくは、CL_MEM_COPY_HOST_PTR や CL_MEM_USE_HOST_PTR が設定されていないのに host_ptr が NULL でない", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_MEM_OBJECT_ALLOCATION_FAILURE:
			MessageBox(NULL, "バッファオブジェクトのメモリを確保するのに失敗した", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_OUT_OF_RESOURCES:
			MessageBox(NULL, "デバイス上でのリソース確保に失敗した", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_OUT_OF_HOST_MEMORY:
			MessageBox(NULL, "ホスト上でのリソース確保に失敗した", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		}

		ref_int64val = (INT64)mem_obj;
		break;
	}
	


	case 0x18://clCreateProgramWithSource(str "   ")
	{
		char *source_str;
		source_str = new char[1024 * 1024 * 64];
		source_str = code_gets();								// 文字列を取得

		int saizu = sizeof(source_str);

		program = clCreateProgramWithSource(context[clsetdev], 1, (const char **)&source_str, (const size_t *)&saizu, NULL);
		char* buildoption;
		buildoption = code_gets();
		cl_int err0 = clBuildProgram(program, 1, &device_id[clsetdev], buildoption, NULL, NULL);
		if (err0 != CL_SUCCESS) {
			size_t len;
			char* buffer;
			buffer = new char[1024 * 1024 * 2];
			clGetProgramBuildInfo(program, device_id[clsetdev],
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
		ref_int32val = (int)dev_num;
		break;
	}

	case 0x1B://HCLGetSetDevice
	{
		fInt = true;
		ref_int32val = (int)clsetdev;
		break;
	}
	
	case 0x1D://HCLGetSetCommandQueue
	{
		fInt = true;
		ref_int32val = (int)clsetque;
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


















	case 0x08://HCLinit
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
					clCreateCommandQueue(context[k], device_id[k], CL_QUEUE_PROFILING_ENABLE, &errcode_ret);
				if (errcode_ret != CL_SUCCESS) retmeserr3(errcode_ret);
			}
		}
		
		//最後にevent変数生成
		cppeventlist = new cl_event[CL_EVENT_MAX];
		event_wait_list = new cl_event[CL_EVENT_MAX];
		break;
	}

	
	case 0x0B:	// HCLSetKernel
	{
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値、カ－ネルid
		p2 = code_getdi(0);		// パラメータ2:数値、引数

		int chk = code_getprm();							// パラメーターを取得(型は問わない)

		int type = mpval->flag;							// パラメーターの型を取得
		void* ppttr;
		int sizeofff=-1;
		switch (type) {
		case HSPVAR_FLAG_STR:								// パラメーターが文字列だった時
		{
			ppttr = (char *)mpval->pt;
			sizeofff = 1;
			break;
		}
		case HSPVAR_FLAG_DOUBLE:									// パラメーターが実数だった時
		{
			ppttr = (double *)mpval->pt;
			sizeofff = 8;
			break;
		}
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
	


	case 0x0D:	// HCLDoKrn1 int p1,int p2,int p3,int p4
	{
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値、カ－ネルid
		size_t p4 = code_getdi(1);
		size_t ptryes = code_getdi(0);

		cl_int ret;
		//outevent関連
		int outeventptr = code_getdi(-1);
		cl_event* outevent = NULL;
		if (outeventptr >= 0) 
		{
			clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
		}
		//wait event list関連
		cl_event* ev_;
		if (num_event_wait_list == 0)
		{
			ev_ = NULL;
		}
		else
		{
			ev_ = event_wait_list;
		}


		if (ptryes != 0) {
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
				(cl_kernel)prm1, 1, NULL, &p4, &ptryes, num_event_wait_list, ev_, outevent);
		}
		else {
			ret = clEnqueueNDRangeKernel(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
				(cl_kernel)prm1, 1, NULL, &p4, NULL, num_event_wait_list, ev_, outevent);
		}
		if (ret != CL_SUCCESS) { retmeserr(ret); }
		num_event_wait_list = 0;
		break;
	}


	case 0x0E:	// HCLWriteBuffer
	{
		//引数1
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値、memobj

		//引数2。HSP側の配列変数
		PVal *pval;
		APTR aptr = code_getva(&pval);
		//*(INT64 *)((pval->pt) + p1) = *(INT64 *)HspVarInt64_Cnv(mpval->pt, mpval->flag);
		
		//引数3、コピーサイズ
		INT64 prm3 = Code_geti32i64();//パラメータ3:int64
		
		//引数4、コピー先のofset
		INT64 prm4 = Code_geti32i64();//パラメータ4:int64

		//引数5、コピー元のofset
		INT64 prm5 = Code_geti32i64();//パラメータ5
		
		cl_bool p7 = code_getdi(1);		//ブロッキングモード
		

		//outevent関連
		int outeventptr = code_getdi(-1);//outeventするか
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
		}
		//wait event list関連
		cl_event* ev_;
		if (num_event_wait_list == 0)
		{
			ev_ = NULL;
		}
		else
		{
			ev_ = event_wait_list;
		}


		cl_int ret = clEnqueueWriteBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque], (cl_mem)prm1, p7, prm4,
			prm3, (char*)((pval->pt) + prm5), num_event_wait_list, ev_, outevent);
		
		if (ret != CL_SUCCESS) { retmeserr2(ret); }

		num_event_wait_list = 0;
		break;
	}


	case 0x0F:	// HCLReadBuffer
	{
		//引数1
		INT64 prm1 = Code_getint64();//パラメータ1:int64数値、memobj

		//引数2。HSP側の配列変数
		PVal *pval;
		APTR aptr = code_getva(&pval);
		//*(INT64 *)((pval->pt) + p1) = *(INT64 *)HspVarInt64_Cnv(mpval->pt, mpval->flag);
		
		//引数3、コピーサイズ
		INT64 prm3 = Code_geti32i64();//パラメータ3:int64
		
		//引数4、コピー先のofset
		INT64 prm4 = Code_geti32i64();//パラメータ4:int64

		//引数5、コピー元のofset
		INT64 prm5 = Code_geti32i64();//パラメータ5

		cl_bool p7 = code_getdi(1);		//ブロッキングモード
		

		//outevent関連
		int outeventptr = code_getdi(-1);//outeventするか
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
		}
		//wait event list関連
		cl_event* ev_;
		if (num_event_wait_list == 0)
		{
			ev_ = NULL;
		}
		else
		{
			ev_ = event_wait_list;
		}

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

	case 0x11:	// HCLFinish//デバイスにある全部のタスク待ち
	{
		cl_int ret = clFinish(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque]);

		switch (ret) {							//分岐

		case CL_INVALID_COMMAND_QUEUE:
			MessageBox(NULL, "第一引数が有効な値ではありません", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_INVALID_CONTEXT:
			MessageBox(NULL, "あるいは第一引数と event_wait_list 内のイベントと関連付けられたデバイスが同じでない", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_INVALID_EVENT:
			MessageBox(NULL, "event_listのイベントオブジェクトが不正", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_OUT_OF_HOST_MEMORY:
			MessageBox(NULL, "ホスト上でのリソース確保に失敗した", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		}
		break;
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
		INT64 prm2 = Code_getint64();//コピー先メモリオブジェクトid
		INT64 prm3 = Code_getint64();//コピー元メモリオブジェクトid
		INT64 prm4 = Code_geti32i64();// コピーサイズ
		INT64 prm5 = Code_geti32i64();// コピー先オフセット
		INT64 prm6 = Code_geti32i64();// コピー元オフセット

		//outevent関連
		int outeventptr = code_getdi(-1);//outeventするか
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
		}
		//wait event list関連
		cl_event* ev_;
		if (num_event_wait_list == 0)
		{
			ev_ = NULL;
		}
		else
		{
			ev_ = event_wait_list;
		}

		cl_int ret = clEnqueueCopyBuffer(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque],
			(cl_mem)prm3, (cl_mem)prm2, prm6, prm5, prm4,num_event_wait_list, ev_, outevent);

		num_event_wait_list = 0;

		switch (ret) {							//分岐
		case CL_INVALID_COMMAND_QUEUE:
			MessageBox(NULL, "command_queue is not a valid command-queue", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_INVALID_CONTEXT:
			MessageBox(NULL, "メモリオブジェクトが別のデバイスで作成された可能性があります", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_INVALID_MEM_OBJECT:
			MessageBox(NULL, "メモリオブジェクトの実体がありません。メモリオブジェクトが別のデバイスで作成された可能性があります。", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_INVALID_VALUE:
			MessageBox(NULL, "アドレスアクセス違反です。書き込み領域or読み込み領域がはみ出してます。", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_MEM_COPY_OVERLAP:
			MessageBox(NULL, "アドレスアクセス違反です。書き込み領域か読み込み領域がはみ出してます。", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_MEM_OBJECT_ALLOCATION_FAILURE:
			MessageBox(NULL, "data store のためにallocate memoryするのを失敗しました", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_OUT_OF_RESOURCES:
			MessageBox(NULL, "デバイス(GPU)上でのリソース確保に失敗した", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_OUT_OF_HOST_MEMORY:
			MessageBox(NULL, "ホスト(CPU)上でのリソース確保に失敗した", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		}
		break;
	}

	case 0x14:	// HCLDoKernel int64 p1,int p2,array p3,array p4
	{
		INT64 prm2 = Code_getint64();		// カーネル
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
				APTR aptr1;	//配列変数の取得
				aptr1 = code_getva(&pval1);//	入力変数の型と実体のポインタを取得
				HspVarProc *phvp1;
				void *ptr1;
				phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//型を処理するHspVarProc構造体へのポインタ
				ptr1 = phvp1->GetPtr(pval1);					//データ（pval1）の実態がある先頭ポインタを取得。

				p4[0] = *(size_t *)ptr1;
				p4[1] = *((size_t *)ptr1 + 1);
				p4[2] = *((size_t *)ptr1 + 2);

				PVal *pval2;
				APTR aptr2;	//配列変数の取得
				aptr2 = code_getva(&pval2);//	入力変数の型と実体のポインタを取得
				HspVarProc *phvp2;
				void *ptr2;
				phvp2 = exinfo->HspFunc_getproc(pval2->flag);	//型を処理するHspVarProc構造体へのポインタ
				ptr2 = phvp2->GetPtr(pval2);					//データ（pval1）の実態がある先頭ポインタを取得。

				ptryes[0] = *(size_t *)ptr2;
				ptryes[1] = *((size_t *)ptr2 + 1);
				ptryes[2] = *((size_t *)ptr2 + 2);
			}
		}


		cl_int ret;

		//outevent関連
		int outeventptr = code_getdi(-1);//outeventするか
		cl_event* outevent = NULL;
		if (outeventptr >= 0)
		{
			clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
		}
		//wait event list関連
		cl_event* ev_;
		if (num_event_wait_list == 0)
		{
			ev_ = NULL;
		}
		else
		{
			ev_ = event_wait_list;
		}

		if (ptryes[0] != 0) {
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
		INT64 prm2 = Code_getint64();		// パラメータ1:memobj

		cl_int ret = 0;
		ret = clReleaseMemObject((cl_mem)prm2);

		if (ret != CL_SUCCESS) {
			MessageBox(NULL, "メモリ開放ができませんでした", "エラー", 0);
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

	case 0x17://デバイスセット
	{
		clsetdev = code_getdi(0);
		break;
	}


	case 0x19://HCLDoKrn1_sub
	{
		INT64 prm2 = Code_getint64();		// パラメータ1:カーネル
		size_t p4 = code_getdi(1);	//並列数
		size_t p5 = code_getdi(1);//ローカルサイズ
		if (p5 == 0) { p5 = 64; }
		size_t p4_1 = (p4 / p5)*p5;//p5で割り切れる数字に
		size_t p4_2 = p4 - p4_1;//問題の端数

		cl_int ret;

		//outevent関連
		int outeventptr = code_getdi(-1);//outeventするか
		cl_event* outevent = NULL;
		cl_event* outevent2 = NULL;
		if (outeventptr >= 0)
		{
			clReleaseEvent(cppeventlist[outeventptr]);
			outevent = &cppeventlist[outeventptr];
			if (p4_2 != 0) 
			{
				clReleaseEvent(cppeventlist[(outeventptr + 1) % CL_EVENT_MAX]);
				outevent2 = &cppeventlist[(outeventptr + 1) % CL_EVENT_MAX];
			}
		}
		//wait event list関連
		cl_event* ev_;
		if (num_event_wait_list == 0)
		{
			ev_ = NULL;
		}
		else
		{
			ev_ = event_wait_list;
		}

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


	case 0x1C://HCLSetKrns
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
				ppttr = (char *)mpval->pt;
				sizeofff = 1;
				break;
			}
			case HSPVAR_FLAG_DOUBLE:									// パラメーターが実数だった時
			{
				ppttr = (double *)mpval->pt;
				sizeofff = 8;
				break;
			}

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
			}

			//p1カーネルid、p2は引数位置、p3には実態、p4はローカルメモリフラグ
			clSetKernelArg((cl_kernel)prm1, i, sizeofff, ppttr);
		}
		break;
	}

	
	case 0x1E://HCLSetCommandQueue
	{
		clsetque = code_getdi(0);
		break;
	}

	case 0x1F:	// _ExHCLSetCommandQueueMax
	{
		COMMANDQUEUE_PER_DEVICE = code_getdi(0);
		break;
	}

	case 0x20:	// _ExHCLSetCommandQueueProperties
	{
		cmd_properties = code_getdi(0);
		break;
	}

	case 0x21:	// HCLFlush//コマンドキューのブロッキングみたいな
	{
		cl_int ret = clFlush(command_queue[clsetdev * COMMANDQUEUE_PER_DEVICE + clsetque]);
		switch (ret) {							//分岐
		case CL_INVALID_COMMAND_QUEUE:
			MessageBox(NULL, "CL_INVALID_COMMAND_QUEUE: if command_queue is not a valid command-queue", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		case CL_OUT_OF_HOST_MEMORY:
			MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY:if there is a failure to allocate resources required by the OpenCL implementation on the host.", "エラー", 0);
			puterror(HSPERR_UNSUPPORTED_FUNCTION);
			break;
		}
		break;
	}


	case 0x22:	//HCLSetWaitEventList_1 int p1
	{
		p1 = code_getdi(0);
		num_event_wait_list = 1;
		event_wait_list[0] = cppeventlist[p1];
		break;
	}


	case 0x23:	//HCLSetWaitEventList_a int num,array a
	{
		num_event_wait_list = code_getdi(0);

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


	case 0x24:	// _ExHCLResizeEventList
	{
		CL_EVENT_MAX = code_getdi(65536);
		delete[] cppeventlist;
		delete[] event_wait_list;
		cppeventlist = new cl_event[CL_EVENT_MAX];
		event_wait_list = new cl_event[CL_EVENT_MAX];
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









































































//----------------------------------------------------------------------------------------ここ以下は自分で作った関数--------------------------------
//----------------------------------------------------------------------------------------ここ以下は自分で作った関数--------------------------------
//----------------------------------------------------------------------------------------ここ以下は自分で作った関数--------------------------------
//----------------------------------------------------------------------------------------ここ以下は自分で作った関数--------------------------------
//----------------------------------------------------------------------------------------ここ以下は自分で作った関数--------------------------------
//----------------------------------------------------------------------------------------ここ以下は自分で作った関数--------------------------------
//----------------------------------------------------------------------------------------ここ以下は自分で作った関数--------------------------------
//----------------------------------------------------------------------------------------ここ以下は自分で作った関数--------------------------------
//----------------------------------------------------------------------------------------ここ以下は自分で作った関数--------------------------------
//----------------------------------------------------------------------------------------ここ以下は自分で作った関数--------------------------------
//----------------------------------------------------------------------------------------ここ以下は自分で作った関数--------------------------------
//----------------------------------------------------------------------------------------ここ以下は自分で作った関数--------------------------------
//----------------------------------------------------------------------------------------ここ以下は自分で作った関数--------------------------------


void retmeserr(cl_int ret)
{
	switch (ret) {							//分岐
	case CL_INVALID_PROGRAM_EXECUTABLE:
		MessageBox(NULL, "デバイス上で実行可能な、正常にビルドされたプログラムが一つもありません", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_COMMAND_QUEUE:
		MessageBox(NULL, "デバイスidが無効なデバイスになっています", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_KERNEL:
		MessageBox(NULL, "カーネルidが間違っています", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_CONTEXT:
		MessageBox(NULL, "カーネルidが違うデバイスidで登録されています、あるいは第一引数と event_wait_list 内のイベントと関連付けられたデバイスが同じでない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_KERNEL_ARGS:
		MessageBox(NULL, "カーネル引数が指定されていません", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_GLOBAL_WORK_SIZE:
		MessageBox(NULL, "global_work_size が NULL です。あるいは、global_work_sizeの配列のどれかが0です。もしくはカーネルを実行するデバイス上でのglobal_work_sizeが上限値を超えている", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_GLOBAL_OFFSET:
		MessageBox(NULL, "CL_INVALID_GLOBAL_OFFSET - global_work_offset が NULL でない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_WORK_DIMENSION:
		MessageBox(NULL, "work_dim が適切な値でない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_WORK_GROUP_SIZE:
		MessageBox(NULL, "global_work_sizeがlocal_work_size で整除できない、またはlocal_work_size[0]*local_work_size[1]*local_work_size[2]が、一つのワークグループ内のワークアイテム数の最大値を超えた", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_WORK_ITEM_SIZE:
		MessageBox(NULL, "local_work_size[0], ... local_work_size[work_dim - 1] で指定したワークアイテム数が対応する CL_DEVICE_MAX_WORK_ITEM_SIZES[0], ... CL_DEVICE_MAX_WORK_ITEM_SIZES[work_dim - 1] の値こえている、または0を指定した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_MEM_OBJECT_ALLOCATION_FAILURE:
		MessageBox(NULL, "kernel の引数に指定されたバッファ/イメージオブジェクトに関連付けられたデータ保存のためのメモリ領域の確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_EVENT_WAIT_LIST:
		MessageBox(NULL, "event_wait_list が NULL で num_events_in_wait_list が 0 より大きいとき。あるいは event_wait_list が NULL でなく num_events_in_wait_list が 0 のとき。あるいは event_wait_list 内のイベントオブジェクトが有効なものでない", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "デバイス上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "ホスト上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);
}




void retmeserr2(cl_int ret)
{
	switch (ret) {							//分岐
	case CL_INVALID_COMMAND_QUEUE:
		MessageBox(NULL, "command_queue is not a valid command-queue", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_CONTEXT:
		MessageBox(NULL, "メモリオブジェクトが別のデバイスで作成された可能性があります", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_MEM_OBJECT:
		MessageBox(NULL, "メモリオブジェクトの実体がありません。メモリオブジェクトが別のデバイスで作成された可能性があります。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "アドレスアクセス違反です。読み込み領域がはみ出してます。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_MEM_OBJECT_ALLOCATION_FAILURE:
		MessageBox(NULL, "data store のためにallocate memoryするのを失敗しました", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_RESOURCES:
		MessageBox(NULL, "デバイス(GPU)上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "ホスト(CPU)上でのリソース確保に失敗した", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);

}

void retmeserr3(cl_int ret)
{
	switch (ret) {							//分岐
	case CL_INVALID_CONTEXT:
		MessageBox(NULL, "CL_INVALID_CONTEXT:if context is not a valid context.\\nコンテキストが有効なコンテキストでない場合", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_DEVICE:
		MessageBox(NULL, "CL_INVALID_DEVICE:if device is not a valid device or is not associated with context\\nデバイスが有効なデバイスではない場合、またはコンテキストに関連付けられていない場合", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "CL_INVALID_VALUE: if values specified in properties are not valid.\\nプロパティで指定された値が無効な場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_QUEUE_PROPERTIES:
		MessageBox(NULL, "CL_INVALID_QUEUE_PROPERTIES:if values specified in properties are valid but are not supported by the device.プロパティで指定された値は有効であるが、デバイスでサポートされていない場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY:if there is a failure to allocate resources required by the OpenCL implementation on the host.\\nホスト上のOpenCL実装に必要なリソースの割り当てに失敗した場合。", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);
}

void retmeserr4(cl_int ret)
{
	switch (ret) {							//分岐
	case CL_INVALID_PLATFORM:
		MessageBox(NULL, "CL_INVALID_PLATFORM:if properties is NULL and no platform could be selected or if platform value specified in properties is not a valid platform.", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_VALUE:
		MessageBox(NULL, "CL_INVALID_VALUE:CL_INVALID_VALUE if context property name in properties is not a supported property name; if devices is NULL; if num_devices is equal to zero; or if pfn_notify is NULL but user_data is not NULL.", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_INVALID_DEVICE:
		MessageBox(NULL, "CL_INVALID_DEVICE: if devices contains an invalid device or are not associated with the specified platform.", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_DEVICE_NOT_AVAILABLE:
		MessageBox(NULL, "CL_DEVICE_NOT_AVAILABLE if a device in devices is currently not available even though the device was returned by clGetDeviceIDs.", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	case CL_OUT_OF_HOST_MEMORY:
		MessageBox(NULL, "CL_OUT_OF_HOST_MEMORY:if there is a failure to allocate resources required by the OpenCL implementation on the host.", "エラー", 0);
		puterror(HSPERR_UNSUPPORTED_FUNCTION);
		break;
	}
	//上のどれでもなければ
	MessageBox(NULL, "原因不明のエラーです", "エラー", 0);
	puterror(HSPERR_UNSUPPORTED_FUNCTION);
}










static void _ConvRGBtoBGR(void)
{
	PVal *pval1;
	APTR aptr1;	//配列変数の取得
	aptr1 = code_getva(&pval1);//	入力変数の型と実体のポインタを取得
	HspVarProc *phvp1;
	void *ptr1;
	phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//型を処理するHspVarProc構造体へのポインタ
	ptr1 = phvp1->GetPtr(pval1);					//データ（pval1）の実態がある先頭ポインタを取得。


	PVal *pval2;
	APTR aptr2;	//配列変数の取得
	aptr2 = code_getva(&pval2);//	入力変数の型と実体のポインタを取得
	HspVarProc *phvp2;
	void *ptr2;
	phvp2 = exinfo->HspFunc_getproc(pval2->flag);	//型を処理するHspVarProc構造体へのポインタ
	ptr2 = phvp2->GetPtr(pval2);					//データ（pval1）の実態がある先頭ポインタを取得。

	p3 = code_getdi(0);

	char *dmptr1 = (char*)ptr1;
	char *dmptr2 = (char*)ptr2;

	for (int i = 0; i < p3; i += 3) {
		dmptr2[i + 2] = dmptr1[i];
		dmptr2[i + 1] = dmptr1[i + 1];
		dmptr2[i] = dmptr1[i + 2];
	}
}
static void _ConvRGBAtoRGB(void)
{
	PVal *pval1;
	APTR aptr1;	//配列変数の取得
	aptr1 = code_getva(&pval1);//	入力変数の型と実体のポインタを取得
	HspVarProc *phvp1;
	void *ptr1;
	phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//型を処理するHspVarProc構造体へのポインタ
	ptr1 = phvp1->GetPtr(pval1);					//データ（pval1）の実態がある先頭ポインタを取得。

	PVal *pval2;
	APTR aptr2;	//配列変数の取得
	aptr2 = code_getva(&pval2);//	入力変数の型と実体のポインタを取得
	HspVarProc *phvp2;
	void *ptr2;
	phvp2 = exinfo->HspFunc_getproc(pval2->flag);	//型を処理するHspVarProc構造体へのポインタ
	ptr2 = phvp2->GetPtr(pval2);					//データ（pval1）の実態がある先頭ポインタを取得。

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
static void _ConvRGBtoRGBA(void)
{
	PVal *pval1;
	APTR aptr1;	//配列変数の取得
	aptr1 = code_getva(&pval1);//	入力変数の型と実体のポインタを取得
	HspVarProc *phvp1;
	void *ptr1;
	phvp1 = exinfo->HspFunc_getproc(pval1->flag);	//型を処理するHspVarProc構造体へのポインタ
	ptr1 = phvp1->GetPtr(pval1);					//データ（pval1）の実態がある先頭ポインタを取得。

	PVal *pval2;
	APTR aptr2;	//配列変数の取得
	aptr2 = code_getva(&pval2);//	入力変数の型と実体のポインタを取得
	HspVarProc *phvp2;
	void *ptr2;
	phvp2 = exinfo->HspFunc_getproc(pval2->flag);	//型を処理するHspVarProc構造体へのポインタ
	ptr2 = phvp2->GetPtr(pval2);					//データ（pval1）の実態がある先頭ポインタを取得。

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









void mes(char* strc, int val)
{
	char c[10];
	c[0] = val % 1000000000 / 100000000 + 48;
	c[1] = val % 100000000 / 10000000 + 48;
	c[2] = val % 10000000 / 1000000 + 48;
	c[3] = val % 1000000 / 100000 + 48;
	c[4] = val % 100000 / 10000 + 48;
	c[5] = val % 10000 / 1000 + 48;
	c[6] = val % 1000 / 100 + 48;
	c[7] = val % 100 / 10 + 48;
	c[8] = val % 10 + 48;
	c[9] = 0;
	MessageBox(NULL, c, strc, 0);
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