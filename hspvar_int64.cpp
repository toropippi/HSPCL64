
//
//	HSPVAR core module
//	onion software/onitama 2003/4
//
#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
#include <windows.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "hsp3plugin.h"
#include "hspvar_core.h"
#include "hsp3debug.h"

/*------------------------------------------------------------*/
/*
		HSPVAR core interface (float)
*/
/*------------------------------------------------------------*/

#define GetPtr(pval) ((INT64 *)pval)
#define sbAlloc hspmalloc
#define sbFree hspfree

static int mytype;
static INT64 conv;
static short *aftertype;
static char custom[64];

// Core
static PDAT *HspVarInt64_GetPtr( PVal *pval )
{
	return (PDAT *)(( (INT64 *)(pval->pt))+pval->offset);
}

void *HspVarInt64_Cnv(const void *buffer, int flag)
{
	//		リクエストされた型 -> 自分の型への変換を行なう
	//		(組み込み型にのみ対応でOK)
	//		(参照元のデータを破壊しないこと)
	//

	// 自信の型の場合
	if (flag == mytype){
		return (void *)buffer;
	}

	switch (flag) {
	case HSPVAR_FLAG_STR:
		conv = (INT64)_atoi64((char *)buffer);
		return &conv;
	case HSPVAR_FLAG_INT:
		conv = (INT64)(*(int *)buffer);
		return &conv;
	case HSPVAR_FLAG_DOUBLE:
		conv = (INT64)(*(double *)buffer);
		return &conv;
		break;
	default:
		throw HSPVAR_ERROR_TYPEMISS;
	}
	return (void *)buffer;
}


static void *HspVarInt64_CnvCustom(const void *buffer, int flag)
{
	//		(カスタムタイプのみ)
	//		自分の型 -> リクエストされた型 への変換を行なう
	//		(組み込み型に対応させる)
	//		(参照元のデータを破壊しないこと)
	//
	INT64 p;
	p = *(INT64 *)buffer;
	switch (flag) {
	case HSPVAR_FLAG_STR:
		sprintf(custom, "%I64d", p);
		break;
	case HSPVAR_FLAG_INT:
		*(int *)custom = (int)p;
		break;
	case HSPVAR_FLAG_DOUBLE:
		*(double *)custom = (double)p;
		break;
	default:
		throw HSPVAR_ERROR_TYPEMISS;
	}
	return custom;
}

static int GetVarSize( PVal *pval )
{
	//		PVALポインタの変数が必要とするサイズを取得する
	//		(sizeフィールドに設定される)
	//
	int size;
	size = pval->len[1];
	if ( pval->len[2] ) size*=pval->len[2];
	if ( pval->len[3] ) size*=pval->len[3];
	if ( pval->len[4] ) size*=pval->len[4];
	size *= sizeof(INT64);
	return size;
}


static void HspVarInt64_Free( PVal *pval )
{
	//		PVALポインタの変数メモリを解放する
	//
	if ( pval->mode == HSPVAR_MODE_MALLOC ) { sbFree( pval->pt ); }
	pval->pt = NULL;
	pval->mode = HSPVAR_MODE_NONE;
}


static void HspVarInt64_Alloc( PVal *pval, const PVal *pval2 )
{
	//		pval変数が必要とするサイズを確保する。
	//		(pvalがすでに確保されているメモリ解放は呼び出し側が行なう)
	//		(flagの設定は呼び出し側が行なう)
	//		(pval2がNULLの場合は、新規データ)
	//		(pval2が指定されている場合は、pval2の内容を継承して再確保)
	//
	int i,size;
	char *pt;
	INT64 *fv;
	if ( pval->len[1] < 1 ) pval->len[1] = 1;		// 配列を最低1は確保する
	size = GetVarSize( pval );
	pval->mode = HSPVAR_MODE_MALLOC;
	pt = sbAlloc( size );
	fv = (INT64 *)pt;
	for (i = 0; i<(int)(size / sizeof(INT64)); i++) { fv[i] = 0; }
	if ( pval2 != NULL ) {
		memcpy( pt, pval->pt, pval->size );
		sbFree( pval->pt );
	}
	pval->pt = pt;
	pval->size = size;
}

/*
static void *HspVarInt64_ArrayObject( PVal *pval, int *mptype )
{
	//		配列要素の指定 (文字列/連想配列用)
	//
	throw HSPERR_UNSUPPORTED_FUNCTION;
	return NULL;
}
*/

// Size
static int HspVarInt64_GetSize( const PDAT *pval )
{
	return sizeof(INT64);
}

// Set
static void HspVarInt64_Set( PVal *pval, PDAT *pdat, const void *in )
{
	*GetPtr(pdat) = *((INT64 *)(in));
}

// Add
static void HspVarInt64_AddI( PDAT *pval, const void *val )
{
	*GetPtr(pval) += *((INT64 *)(val));
	*aftertype = mytype;
}

// Sub
static void HspVarInt64_SubI( PDAT *pval, const void *val )
{
	*GetPtr(pval) -= *((INT64 *)(val));
	*aftertype = mytype;
}

// Mul
static void HspVarInt64_MulI( PDAT *pval, const void *val )
{
	*GetPtr(pval) *= *((INT64 *)(val));
	*aftertype = mytype;
}

// Div
static void HspVarInt64_DivI( PDAT *pval, const void *val )
{
	INT64 p = *((INT64 *)(val));
	if ( p == 0 ) throw( HSPVAR_ERROR_DIVZERO );
	*GetPtr(pval) /= p;
	*aftertype = mytype;
}

// Eq
static void HspVarInt64_EqI( PDAT *pval, const void *val )
{
	*((int *)pval) = (*GetPtr(pval) == *((INT64 *)(val)));
	*aftertype = HSPVAR_FLAG_INT;
}

// Ne
static void HspVarInt64_NeI( PDAT *pval, const void *val )
{
	*((int *)pval) = (*GetPtr(pval) != *((INT64 *)(val)));
	*aftertype = HSPVAR_FLAG_INT;
}

// Gt
static void HspVarInt64_GtI( PDAT *pval, const void *val )
{
	*((int *)pval) = (*GetPtr(pval) > *((INT64 *)(val)));
	*aftertype = HSPVAR_FLAG_INT;
}

// Lt
static void HspVarInt64_LtI( PDAT *pval, const void *val )
{
	*((int *)pval) = ( *GetPtr(pval) < *((INT64 *)(val)) );//もともとINT64じゃなくてfloatだったバグがあった
	*aftertype = HSPVAR_FLAG_INT;
}

// GtEq
static void HspVarInt64_GtEqI( PDAT *pval, const void *val )
{
	*((int *)pval) = (*GetPtr(pval) >= *((INT64 *)(val)));
	*aftertype = HSPVAR_FLAG_INT;
}

// LtEq
static void HspVarInt64_LtEqI( PDAT *pval, const void *val )
{
	*((int *)pval) = (*GetPtr(pval) <= *((INT64 *)(val)));
	*aftertype = HSPVAR_FLAG_INT;
}

/*
// INVALID
static void HspVarInt64_Invalid( PDAT *pval, const void *val )
{
	throw( HSPVAR_ERROR_INVALID );
}
*/

static void *GetBlockSize( PVal *pval, PDAT *pdat, int *size )
{
	*size = pval->size - ( ((char *)pdat) - pval->pt );
	return (pdat);
}

static void AllocBlock( PVal *pval, PDAT *pdat, int size )
{
}

void HspVarCoreDupPtr(PVal *pval, int flag, void *ptr, int size)
{
	//		指定されたポインタからのクローンになる
	//
	PDAT *buf;
	HspVarProc *p;
	p = exinfo->HspFunc_getproc(flag);
	buf = (PDAT *)ptr;

	HspVarProc *phvp;
	phvp = exinfo->HspFunc_getproc(pval->flag);
	phvp->Free(pval);

	// HspVarCoreDispose(pval);
	pval->pt = (char *)buf;
	pval->flag = flag;
	pval->size = size;
	pval->mode = HSPVAR_MODE_CLONE;
	pval->len[0] = 1;

	if (p->basesize < 0) {
		pval->len[1] = 1;
	}
	else {
		pval->len[1] = size / p->basesize;
	}
	pval->len[2] = 0;
	pval->len[3] = 0;
	pval->len[4] = 0;
	pval->offset = 0;
	pval->arraycnt = 0;
	pval->support = HSPVAR_SUPPORT_STORAGE;
}
/*------------------------------------------------------------*/

EXPORT int HspVarInt64_typeid( void )
{
	return mytype;
}

EXPORT void HspVarInt64_Init( HspVarProc *p )
{
	aftertype = &p->aftertype;

	p->Set = HspVarInt64_Set;
	p->Cnv = HspVarInt64_Cnv;
	p->GetPtr = HspVarInt64_GetPtr;
	p->CnvCustom = HspVarInt64_CnvCustom;
	p->GetSize = HspVarInt64_GetSize;
	p->GetBlockSize = GetBlockSize;
	p->AllocBlock = AllocBlock;

//	p->ArrayObject = HspVarInt64_ArrayObject;
	p->Alloc = HspVarInt64_Alloc;
	p->Free = HspVarInt64_Free;

	p->AddI = HspVarInt64_AddI;
	p->SubI = HspVarInt64_SubI;
	p->MulI = HspVarInt64_MulI;
	p->DivI = HspVarInt64_DivI;
//	p->ModI = HspVarInt64_Invalid;

//	p->AndI = HspVarInt64_Invalid;
//	p->OrI  = HspVarInt64_Invalid;
//	p->XorI = HspVarInt64_Invalid;

	p->EqI = HspVarInt64_EqI;
	p->NeI = HspVarInt64_NeI;
	p->GtI = HspVarInt64_GtI;
	p->LtI = HspVarInt64_LtI;
	p->GtEqI = HspVarInt64_GtEqI;
	p->LtEqI = HspVarInt64_LtEqI;

//	p->RrI = HspVarInt64_Invalid;
//	p->LrI = HspVarInt64_Invalid;

	p->vartype_name = "int64";				// タイプ名
	p->version = 0x001;					// 型タイプランタイムバージョン(0x100 = 1.0)
	p->support = HSPVAR_SUPPORT_STORAGE|HSPVAR_SUPPORT_FLEXARRAY;
										// サポート状況フラグ(HSPVAR_SUPPORT_*)
	p->basesize = sizeof(INT64);		// １つのデータが使用するサイズ(byte) / 可変長の時は-1
	mytype = p->flag;
}

/*------------------------------------------------------------*/

