#pragma once

// XMM系レジスタを保存用
typedef union _XMM				// max = 128bit
{
	BYTE val[16];				// 128bit
	double val_d;				//  64bit
	float val_f;				//  32bit
} XMM;

// コールバック情報構造体
// 8byte単位にしてます
typedef struct _CallbackData
{
	int args_count;				// 引数の数 [IN]
	int padding0;				// padding0

	INT64 rcx;					// 第1引数 [OUT]
	INT64 rdx;					// 第2引数 [OUT]
	INT64 r8;					// 第3引数 [OUT]
	INT64 r9;					// 第4引数 [OUT]

	XMM xmm0;					// 第1引数 [OUT]
	XMM xmm1;					// 第2引数 [OUT]
	XMM xmm2;					// 第3引数 [OUT]
	XMM xmm3;					// 第4引数 [OUT]

	INT64* args;				// 第5引数以上 [IN/OUT]
								// 引数の数が5以上の場合はメモリ確保必須。

	void* internal_call;		// 内部コール関数  [IN]
	void* proc_call;			// 生成されたコールバックコード [IN]
	size_t proc_call_size;		// 生成されたコールバックコードのサイズ

	INT64 ret;					// 戻り値 [IN]
	INT64 padding1;				// padding1 - 戻り値 XMMレジスタは128bit。緩衝用。

	unsigned short* label;		// label(HSP側)

	DWORD flOldProtect;			// VirtualProtectの元の保護の値（要らないかも）
	DWORD padding2;				// padding2

} CallbackData, *PCallbackData, **PPCallbackData;

// CallbackDataのメモリは関数内で作成する版
PCallbackData callback64_new(int args_count);
void callback64_free(PCallbackData ptr);

// CallbackDataのメモリは関数外で作ってもらう版
bool callback64_new2(PCallbackData cData,int args_count);
void callback64_free2(PCallbackData ptr);
