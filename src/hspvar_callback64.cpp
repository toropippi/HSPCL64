
//
//	HSPVAR core module
//	onion software/onitama 2007/1
//
#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
#include <windows.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "hsp3plugin.h"
#include "hspvar_core.h"
#include "hsp3debug.h"

#include "hspvar_float.h"
#include "hspvar_int64.h"

#include "callback64.h"

/*------------------------------------------------------------*/
/*
		HSPVAR core interface (Callback64)
*/
/*------------------------------------------------------------*/

#define GetPtr(pval) ((PPCallbackData)pval)
#define sbAlloc hspmalloc
#define sbFree hspfree

static int mytype;

// Core
static PDAT *HspVarCallback64_GetPtr( PVal *pval )
{
	return (PDAT *)(( (PCallbackData)(pval->pt))+pval->offset);
}

static int GetVarSize( PVal *pval )
{
	//		PVAL�|�C���^�̕ϐ����K�v�Ƃ���T�C�Y���擾����
	//		(size�t�B�[���h�ɐݒ肳���)
	//
	return sizeof(PCallbackData);
}

static void HspVarCallback64_Free( PVal *pval )
{
	//		PVAL�|�C���^�̕ϐ����������������
	//
	if ( pval->mode == HSPVAR_MODE_MALLOC ) 
	{ 
		callback64_free( *(PPCallbackData)pval->pt);
	}
	pval->pt = NULL;
	pval->mode = HSPVAR_MODE_NONE;
}


static void HspVarCallback64_Alloc( PVal *pval, const PVal *pval2 )
{
	//		pval�ϐ����K�v�Ƃ���T�C�Y���m�ۂ���B
	//		(pval�����łɊm�ۂ���Ă��郁��������͌Ăяo�������s�Ȃ�)
	//		(flag�̐ݒ�͌Ăяo�������s�Ȃ�)
	//		(pval2��NULL�̏ꍇ�́A�V�K�f�[�^)
	//		(pval2���w�肳��Ă���ꍇ�́Apval2�̓��e���p�����čĊm��)
	//
	
	int size;
	char *pt;

	if (pval->len[1] < 1) pval->len[1] = 1;		// �z����Œ�1�͊m�ۂ���
	size = GetVarSize(pval);
	pval->mode = HSPVAR_MODE_MALLOC;

	pt = (char *)new PCallbackData();

	if ( pval2 != NULL) 
	{
		memcpy(pt, pval->pt, pval->size);
	}

	pval->pt = pt;
	pval->size = size;
}

// Size
static int HspVarCallback64_GetSize( const PDAT *pval )
{
	return sizeof(PCallbackData);
}

// Using
static int HspVarCallback64_GetUsing( const PDAT *pdat )
{
	//		(���Ԃ̃|�C���^���n����܂�)
	return ( *pdat != NULL );
}

// Set
static void HspVarCallback64_Set( PVal *pval, PDAT *pdat, const void *in )
{
	*GetPtr(pdat) = *((PCallbackData *)(in));
}

static void *GetBlockSize( PVal *pval, PDAT *pdat, int *size )
{
	*size = pval->size - ( ((char *)pdat) - pval->pt );
	return (pdat);
}

static void AllocBlock( PVal *pval, PDAT *pdat, int size )
{
}


/*------------------------------------------------------------*/

EXPORT int HspVarCallback64_typeid(void)
{
	return mytype;
}

EXPORT void HspVarCallback64_Init( HspVarProc *p )
{
	p->Set = HspVarCallback64_Set;
	p->GetPtr = HspVarCallback64_GetPtr;
	p->GetSize = HspVarCallback64_GetSize;		// �Œ蒷�Ȃ̂ł���Ȃ��H
	p->GetUsing = HspVarCallback64_GetUsing;
	p->GetBlockSize = GetBlockSize;
	p->AllocBlock = AllocBlock;

	p->Alloc = HspVarCallback64_Alloc;
	p->Free = HspVarCallback64_Free;

	p->vartype_name = "callback64";				// �^�C�v��
	p->version = 0x001;					// �^�^�C�v�����^�C���o�[�W����(0x100 = 1.0)
	p->support = HSPVAR_SUPPORT_STORAGE | HSPVAR_SUPPORT_VARUSE;
										// �T�|�[�g�󋵃t���O(HSPVAR_SUPPORT_*)
	p->basesize = sizeof(PCallbackData);	// �P�̃f�[�^���g�p����T�C�Y(byte) / �ϒ��̎���-1

	mytype = p->flag;
}

/*------------------------------------------------------------*/

