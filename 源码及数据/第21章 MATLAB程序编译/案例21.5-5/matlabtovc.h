//
// MATLAB Compiler: 4.8 (R2008a)
// Date: Tue Oct 05 09:24:47 2010
// Arguments: "-B" "macro_default" "-m" "-W" "main" "-T" "link:exe" "-W"
// "cpplib:matlabtovc" "-T" "link:lib" "matlabtovc.m" 
//

#ifndef __matlabtovc_h
#define __matlabtovc_h 1

#if defined(__cplusplus) && !defined(mclmcrrt_h) && defined(__linux__)
#  pragma implementation "mclmcrrt.h"
#endif
#include "mclmcrrt.h"
#include "mclcppclass.h"
#ifdef __cplusplus
extern "C" {
#endif

#if defined(__SUNPRO_CC)
/* Solaris shared libraries use __global, rather than mapfiles
 * to define the API exported from a shared library. __global is
 * only necessary when building the library -- files including
 * this header file to use the library do not need the __global
 * declaration; hence the EXPORTING_<library> logic.
 */

#ifdef EXPORTING_matlabtovc
#define PUBLIC_matlabtovc_C_API __global
#else
#define PUBLIC_matlabtovc_C_API /* No import statement needed. */
#endif

#define LIB_matlabtovc_C_API PUBLIC_matlabtovc_C_API

#elif defined(_HPUX_SOURCE)

#ifdef EXPORTING_matlabtovc
#define PUBLIC_matlabtovc_C_API __declspec(dllexport)
#else
#define PUBLIC_matlabtovc_C_API __declspec(dllimport)
#endif

#define LIB_matlabtovc_C_API PUBLIC_matlabtovc_C_API


#else

#define LIB_matlabtovc_C_API

#endif

/* This symbol is defined in shared libraries. Define it here
 * (to nothing) in case this isn't a shared library. 
 */
#ifndef LIB_matlabtovc_C_API 
#define LIB_matlabtovc_C_API /* No special import/export declaration */
#endif

extern LIB_matlabtovc_C_API 
bool MW_CALL_CONV matlabtovcInitializeWithHandlers(mclOutputHandlerFcn error_handler,
                                                   mclOutputHandlerFcn print_handler);

extern LIB_matlabtovc_C_API 
bool MW_CALL_CONV matlabtovcInitialize(void);

extern LIB_matlabtovc_C_API 
void MW_CALL_CONV matlabtovcTerminate(void);



extern LIB_matlabtovc_C_API 
void MW_CALL_CONV matlabtovcPrintStackTrace(void);


extern LIB_matlabtovc_C_API 
bool MW_CALL_CONV mlxMatlabtovc(int nlhs, mxArray *plhs[],
                                int nrhs, mxArray *prhs[]);

#ifdef __cplusplus
}
#endif

#ifdef __cplusplus

/* On Windows, use __declspec to control the exported API */
#if defined(_MSC_VER) || defined(__BORLANDC__)

#ifdef EXPORTING_matlabtovc
#define PUBLIC_matlabtovc_CPP_API __declspec(dllexport)
#else
#define PUBLIC_matlabtovc_CPP_API __declspec(dllimport)
#endif

#define LIB_matlabtovc_CPP_API PUBLIC_matlabtovc_CPP_API

#else

#if !defined(LIB_matlabtovc_CPP_API)
#if defined(LIB_matlabtovc_C_API)
#define LIB_matlabtovc_CPP_API LIB_matlabtovc_C_API
#else
#define LIB_matlabtovc_CPP_API /* empty! */ 
#endif
#endif

#endif

extern LIB_matlabtovc_CPP_API void MW_CALL_CONV matlabtovc();

#endif

#endif
