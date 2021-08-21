#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <atlstr.h>
#include <crtdbg.h>

#include "hsp3plugin.h"
#include "callback64.h"

#ifdef _DEBUG
#define TRACE(p) ::OutputDebugString(p); 
#else
#define TRACE(p)
#endif

bool callback64_new2( PCallbackData cData, int args_count)
{
	TRACE(_T("callback64_new2\r\n"));

	// 実際の引数の数をセット
	cData->args_count = args_count;

	// 引数が4以下は4と返すだけ
	UINT uArgsCount = (args_count < 4) ? 4 : args_count;

	// 引数が5個以上のとき
	if ( 4 < uArgsCount)
	{
		cData->args = new INT64[uArgsCount - 4]();
	}
	
	// HSPのラベルを呼ぶだけの仲介関数セット
	cData->internal_call = 
		static_cast <void(*)(PCallbackData)>([](PCallbackData pCData)
	{
		// ラベル呼び出し
		code_call(pCData->label); 

		// 戻り値はユーザーが明示的にセットするので、ここでやらない
	});

	// コールバック用のメモリサイズ計算
	cData->proc_call_size = static_cast<size_t>(
		13LL * 4
		+ 14LL * 4
		+ 18LL * (uArgsCount - 4)
		+ 36LL
		+ 24LL
		+ 1LL
		);

	// コールバック用のメモリ確保
	cData->proc_call = new BYTE[cData->proc_call_size]();

	// コールバック用のメモリ保護
	BOOL bRET = ::VirtualProtect(
		cData->proc_call, cData->proc_call_size,
		PAGE_EXECUTE_READWRITE, &cData->flOldProtect);

	if ( bRET == FALSE)
	{
		callback64_free2(cData);
		return false;
	}

	int ptr = 0;
	auto bytes = static_cast<BYTE*>(cData->proc_call);

	// 第1引数			=13
	{
		// mov	 rax, XXXX
		bytes[ptr++] = 0x48;
		bytes[ptr++] = 0xB8;
		*((INT64*)&bytes[ptr]) = (INT64)&cData->rcx; ptr += 8;

		// mov		 QWORD PTR[rax], rcx
		bytes[ptr++] = 0x48;
		bytes[ptr++] = 0x89;
		bytes[ptr++] = 0x08;
	}

	// 第2引数			=13
	{
		// mov	 rax, XXXX
		bytes[ptr++] = 0x48;
		bytes[ptr++] = 0xB8;
		*((INT64*)&bytes[ptr]) = (INT64)&cData->rdx; ptr += 8;

		// mov		 QWORD PTR[rax], rdx
		bytes[ptr++] = 0x48;
		bytes[ptr++] = 0x89;
		bytes[ptr++] = 0x10;
	}

	// 第3引数			=13
	{
		// mov	 rax, XXXX
		bytes[ptr++] = 0x48;
		bytes[ptr++] = 0xB8;
		*((INT64*)&bytes[ptr]) = (INT64)&cData->r8; ptr += 8;

		// mov		 QWORD PTR[rax], r8
		bytes[ptr++] = 0x4C;
		bytes[ptr++] = 0x89;
		bytes[ptr++] = 0x00;
	}

	// 第4引数			=13
	{
		// mov	 rax, XXXX
		bytes[ptr++] = 0x48;
		bytes[ptr++] = 0xB8;
		*((INT64*)&bytes[ptr]) = (INT64)&cData->r9; ptr += 8;

		// mov		 QWORD PTR[rax], r9
		bytes[ptr++] = 0x4C;
		bytes[ptr++] = 0x89;
		bytes[ptr++] = 0x08;
	}

	// 第1引数			=14
	{
		// mov	 rax, XXXX
		bytes[ptr++] = 0x48;
		bytes[ptr++] = 0xB8;
		*((INT64*)&bytes[ptr]) = (INT64)&cData->xmm0; ptr += 8;

		// movsd	 QWORD PTR[rax], xmm0
		bytes[ptr++] = 0xF2;
		bytes[ptr++] = 0x0F;
		bytes[ptr++] = 0x11;
		bytes[ptr++] = 0x00;
	}

	// 第2引数			=14
	{
		// mov	 rax, XXXX
		bytes[ptr++] = 0x48;
		bytes[ptr++] = 0xB8;
		*((INT64*)&bytes[ptr]) = (INT64)&cData->xmm1; ptr += 8;

		// movsd		 QWORD PTR[rax], xmm1
		bytes[ptr++] = 0xF2;
		bytes[ptr++] = 0x0F;
		bytes[ptr++] = 0x11;
		bytes[ptr++] = 0x08;
	}

	// 第3引数			=14
	{
		// mov	 rax, XXXX
		bytes[ptr++] = 0x48;
		bytes[ptr++] = 0xB8;
		*((INT64*)&bytes[ptr]) = (INT64)&cData->xmm2; ptr += 8;

		// movsd		 QWORD PTR[rax], xmm2
		bytes[ptr++] = 0xF2;
		bytes[ptr++] = 0x0F;
		bytes[ptr++] = 0x11;
		bytes[ptr++] = 0x10;
	}

	// 第4引数			=14
	{
		// mov	 rax, XXXX
		bytes[ptr++] = 0x48;
		bytes[ptr++] = 0xB8;
		*((INT64*)&bytes[ptr]) = (INT64)&cData->xmm3; ptr += 8;

		// movsd		 QWORD PTR[rax], xmm3
		bytes[ptr++] = 0xF2;
		bytes[ptr++] = 0x0F;
		bytes[ptr++] = 0x11;
		bytes[ptr++] = 0x18;
	}

	// スタックから取得(第5引数以上)			= 18 * n
	{
		if (5 <= cData->args_count)
		{
			int nMax = cData->args_count - 4;
			int nRspAddr = 0x28;

			for (int i = 0; i < nMax; i++)
			{
				// mov	 rax, QWORD PTR[rsp + nRspAddr]
				bytes[ptr++] = 0x48;
				bytes[ptr++] = 0x8B;
				bytes[ptr++] = 0x84;
				bytes[ptr++] = 0x24;
				*((int*)&bytes[ptr]) = nRspAddr; ptr += 4;

				// mov	 QWORD PTR ds : xx xx xx xx xx xx xx xx, rax
				bytes[ptr++] = 0x48;
				bytes[ptr++] = 0xA3;
				*((INT64*)&bytes[ptr]) = (INT64)&cData->args[i]; ptr += 8;

				nRspAddr += 8;
			}
		}
	}

	// コールバック			=36
	{
		// 第1引数にコールバックデータのポインタを入れる
		// mov rcx, QWORD PTR
		bytes[ptr++] = 0x48;
		bytes[ptr++] = 0xB9;
		*((INT64*)&bytes[ptr]) = (INT64)cData; ptr += 8;
		// memcpy((void*)bytes[ptr], cData, 8); ptr += 8;

		// mov rax, QWORD PTR
		bytes[ptr++] = 0x48;
		bytes[ptr++] = 0xB8;
		*((INT64*)&bytes[ptr]) = *(INT64*)&cData->internal_call; ptr += 8;

		// スタックを進める
		// sub rsp, 引数+1
		bytes[ptr++] = 0x48;
		bytes[ptr++] = 0x81;
		bytes[ptr++] = 0xEC;
		*((int*)&bytes[ptr]) = 8 * ( uArgsCount + 1); ptr += 4;

		// 実行
		// call rax
		bytes[ptr++] = 0xFF;
		bytes[ptr++] = 0xD0;

		// スタックを戻す
		// add rsp, 引数+1
		bytes[ptr++] = 0x48;
		bytes[ptr++] = 0x81;
		bytes[ptr++] = 0xC4;
		*((int*)&bytes[ptr]) = 8 * ( uArgsCount + 1); ptr += 4;

	}

	// 戻り値をセット		=24
	{
		// rax, xmm0 の両方入れておく

		// mov rax, QWORD PTR: 
		bytes[ptr++] = 0x48;
		bytes[ptr++] = 0xB8;
		*((INT64*)&bytes[ptr]) = (INT64)&cData->ret; ptr += 8;

		// movsd	 QWORD PTR [rax], xmm0
		bytes[ptr++] = 0x42;
		bytes[ptr++] = 0x0f;
		bytes[ptr++] = 0x10;
		bytes[ptr++] = 0x00;

		// mov rax, QWORD PTR: ds
		bytes[ptr++] = 0x48;
		bytes[ptr++] = 0xA1;
		*((INT64*)&bytes[ptr]) = (INT64)&cData->ret; ptr += 8;
	}

	// ret					=1
	{
		bytes[ptr++] = 0xC3;
	}

	// バッファオーバーフロー検出
	if ( cData->proc_call_size < ptr)
	{
		_ASSERT(0);
		::DebugBreak();
		return false;
	}

	return true;
}

PCallbackData callback64_new(int args_count)
{
	PCallbackData cData = new CallbackData();
	if (!callback64_new2( cData, args_count))
	{
		delete cData;
		return nullptr;
	}

	return cData;
}

void callback64_free2(PCallbackData ptr)
{
	TRACE(_T("callback64_free2\r\n"));

	// 生成コールバックコードの削除
	if (ptr != nullptr
		&& ptr->proc_call != nullptr)
	{
		// 一応、メモリ保護を戻しておく
		if (ptr->flOldProtect != 0)
		{
			DWORD dw;
			::VirtualProtect(
				ptr->proc_call, ptr->proc_call_size,
				ptr->flOldProtect, &dw);
		}

		delete[] ptr->proc_call;
		ptr->proc_call = nullptr;
	}

	// 第5引数以上の引数データの削除
	if (ptr != nullptr
		&& ptr->args != nullptr)
	{
		delete[] ptr->args;
		ptr->args = nullptr;
	}

}

void callback64_free( PCallbackData ptr)
{
	if ( ptr != nullptr)
	{
		callback64_free2(ptr);

		//// 全体を削除
		//delete ptr;
		//ptr = nullptr;
	}
}