
//
//	hspvar_float.cpp header
//
#ifndef __hspvar_float_h
#define __hspvar_float_h

#include "hspvar_core.h"

#define HSP_VAR_NAME_FLOAT "float"

EXPORT void HspVarFloat_Init(HspVarProc *p);
EXPORT int HspVarFloat_typeid(void);

void *HspVarFloat_Cnv(const void *buffer, int flag);
void *HspVarFloat_CnvCustom(const void *buffer, int flag);

#endif


