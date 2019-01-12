/*
 * MATLAB Compiler: 4.9 (R2008b)
 * Date: Sat Feb 11 10:32:18 2012
 * Arguments: "-B" "macro_default" "-W" "lib:libmyshared" "-T" "link:lib"
 * "ex21_3_1.m" 
 */

#include <stdio.h>
#define EXPORTING_libmyshared 1
#include "libmyshared.h"
#ifdef __cplusplus
extern "C" {
#endif

extern mclComponentData __MCC_libmyshared_component_data;

#ifdef __cplusplus
}
#endif


static HMCRINSTANCE _mcr_inst = NULL;


#if defined( _MSC_VER) || defined(__BORLANDC__) || defined(__WATCOMC__) || defined(__LCC__)
#ifdef __LCC__
#undef EXTERN_C
#endif
#include <windows.h>

static char path_to_dll[_MAX_PATH];

BOOL WINAPI DllMain(HINSTANCE hInstance, DWORD dwReason, void *pv)
{
    if (dwReason == DLL_PROCESS_ATTACH)
    {
        if (GetModuleFileName(hInstance, path_to_dll, _MAX_PATH) == 0)
            return FALSE;
    }
    else if (dwReason == DLL_PROCESS_DETACH)
    {
    }
    return TRUE;
}
#endif
#ifdef __cplusplus
extern "C" {
#endif

static int mclDefaultPrintHandler(const char *s)
{
  return mclWrite(1 /* stdout */, s, sizeof(char)*strlen(s));
}

#ifdef __cplusplus
} /* End extern "C" block */
#endif

#ifdef __cplusplus
extern "C" {
#endif

static int mclDefaultErrorHandler(const char *s)
{
  int written = 0;
  size_t len = 0;
  len = strlen(s);
  written = mclWrite(2 /* stderr */, s, sizeof(char)*len);
  if (len > 0 && s[ len-1 ] != '\n')
    written += mclWrite(2 /* stderr */, "\n", sizeof(char));
  return written;
}

#ifdef __cplusplus
} /* End extern "C" block */
#endif

/* This symbol is defined in shared libraries. Define it here
 * (to nothing) in case this isn't a shared library. 
 */
#ifndef LIB_libmyshared_C_API 
#define LIB_libmyshared_C_API /* No special import/export declaration */
#endif

LIB_libmyshared_C_API 
bool MW_CALL_CONV libmysharedInitializeWithHandlers(
    mclOutputHandlerFcn error_handler,
    mclOutputHandlerFcn print_handler
)
{
  if (_mcr_inst != NULL)
    return true;
  if (!mclmcrInitialize())
    return false;
  if (!GetModuleFileName(GetModuleHandle("libmyshared"), path_to_dll, _MAX_PATH))
    return false;
  if (!mclInitializeComponentInstanceWithEmbeddedCTF(&_mcr_inst,
                                                     &__MCC_libmyshared_component_data,
                                                     true, NoObjectType,
                                                     LibTarget, error_handler,
                                                     print_handler, 42767, path_to_dll))
    return false;
  return true;
}

LIB_libmyshared_C_API 
bool MW_CALL_CONV libmysharedInitialize(void)
{
  return libmysharedInitializeWithHandlers(mclDefaultErrorHandler,
                                           mclDefaultPrintHandler);
}

LIB_libmyshared_C_API 
void MW_CALL_CONV libmysharedTerminate(void)
{
  if (_mcr_inst != NULL)
    mclTerminateInstance(&_mcr_inst);
}

LIB_libmyshared_C_API 
long MW_CALL_CONV libmysharedGetMcrID() 
{
  return mclGetID(_mcr_inst);
}

LIB_libmyshared_C_API 
void MW_CALL_CONV libmysharedPrintStackTrace(void) 
{
  char** stackTrace;
  int stackDepth = mclGetStackTrace(_mcr_inst, &stackTrace);
  int i;
  for(i=0; i<stackDepth; i++)
  {
    mclWrite(2 /* stderr */, stackTrace[i], sizeof(char)*strlen(stackTrace[i]));
    mclWrite(2 /* stderr */, "\n", sizeof(char)*strlen("\n"));
  }
  mclFreeStackTrace(&stackTrace, stackDepth);
}


LIB_libmyshared_C_API 
bool MW_CALL_CONV mlxEx21_3_1(int nlhs, mxArray *plhs[],
                              int nrhs, mxArray *prhs[])
{
  return mclFeval(_mcr_inst, "ex21_3_1", nlhs, plhs, nrhs, prhs);
}

LIB_libmyshared_C_API 
bool MW_CALL_CONV mlfEx21_3_1()
{
  return mclMlfFeval(_mcr_inst, "ex21_3_1", 0, 0, 0);
}
