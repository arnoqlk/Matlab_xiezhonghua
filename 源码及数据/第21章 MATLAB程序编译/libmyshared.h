/*
 * MATLAB Compiler: 4.9 (R2008b)
 * Date: Sat Feb 11 10:32:18 2012
 * Arguments: "-B" "macro_default" "-W" "lib:libmyshared" "-T" "link:lib"
 * "ex21_3_1.m" 
 */

#ifndef __libmyshared_h
#define __libmyshared_h 1

#if defined(__cplusplus) && !defined(mclmcrrt_h) && defined(__linux__)
#  pragma implementation "mclmcrrt.h"
#endif
#include "mclmcrrt.h"
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

#ifdef EXPORTING_libmyshared
#define PUBLIC_libmyshared_C_API __global
#else
#define PUBLIC_libmyshared_C_API /* No import statement needed. */
#endif

#define LIB_libmyshared_C_API PUBLIC_libmyshared_C_API

#elif defined(_HPUX_SOURCE)

#ifdef EXPORTING_libmyshared
#define PUBLIC_libmyshared_C_API __declspec(dllexport)
#else
#define PUBLIC_libmyshared_C_API __declspec(dllimport)
#endif

#define LIB_libmyshared_C_API PUBLIC_libmyshared_C_API


#else

#define LIB_libmyshared_C_API

#endif

/* This symbol is defined in shared libraries. Define it here
 * (to nothing) in case this isn't a shared library. 
 */
#ifndef LIB_libmyshared_C_API 
#define LIB_libmyshared_C_API /* No special import/export declaration */
#endif

extern LIB_libmyshared_C_API 
bool MW_CALL_CONV libmysharedInitializeWithHandlers(mclOutputHandlerFcn error_handler,
                                                    mclOutputHandlerFcn print_handler);

extern LIB_libmyshared_C_API 
bool MW_CALL_CONV libmysharedInitialize(void);

extern LIB_libmyshared_C_API 
void MW_CALL_CONV libmysharedTerminate(void);



extern LIB_libmyshared_C_API 
void MW_CALL_CONV libmysharedPrintStackTrace(void);


extern LIB_libmyshared_C_API 
bool MW_CALL_CONV mlxEx21_3_1(int nlhs, mxArray *plhs[],
                              int nrhs, mxArray *prhs[]);

extern LIB_libmyshared_C_API 
long MW_CALL_CONV libmysharedGetMcrID() ;



extern LIB_libmyshared_C_API bool MW_CALL_CONV mlfEx21_3_1();

#ifdef __cplusplus
}
#endif

#endif
