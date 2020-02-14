
//
//	hspvar_float.cpp header
//
#ifndef __hspvar_float_h
#define __hspvar_float_h

#include "hspvar_core.h"

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


