
//
//	hspvar_int64.cpp header
//
#ifndef __hspvar_int64_h
#define __hspvar_int64_h

#include "hspvar_core.h"

#define HSP_VAR_NAME_INT64 "int64"

EXPORT void HspVarInt64_Init(HspVarProc *p);
EXPORT int HspVarInt64_typeid(void);

void *HspVarInt64_Cnv(const void *buffer, int flag);
void *HspVarInt64_CnvCustom(const void *buffer, int flag);

#endif



/*
#ifdef __cplusplus
extern "C" {
#endif

void HspVarInt64_Init( HspVarProc *p );
int HspVarInt64_typeid(void);


#ifdef __cplusplus
}
#endif
void *HspVarInt64_Cnv(const void *buffer, int flag);

#endif
*/