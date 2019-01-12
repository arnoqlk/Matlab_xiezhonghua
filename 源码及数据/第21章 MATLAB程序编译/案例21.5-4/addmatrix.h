/*
 * MATLAB Compiler: 4.8 (R2008a)
 * Date: Thu Oct 07 14:11:00 2010
 * Arguments: "-B" "macro_default" "-m" "-W" "main" "-T" "link:exe" "-B"
 * "csharedlib:addmatrix" "-W" "lib:addmatrix" "-T" "link:lib" "addmatrix.m"
 * "multiplymatrix.m" "eigmatrix.m" "-v" 
 */

#ifndef __addmatrix_h
#define __addmatrix_h 1

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

#ifdef EXPORTING_addmatrix
#define PUBLIC_addmatrix_C_API __global
#else
#define PUBLIC_addmatrix_C_API /* No import statement needed. */
#endif

#define LIB_addmatrix_C_API PUBLIC_addmatrix_C_API

#elif defined(_HPUX_SOURCE)

#ifdef EXPORTING_addmatrix
#define PUBLIC_addmatrix_C_API __declspec(dllexport)
#else
#define PUBLIC_addmatrix_C_API __declspec(dllimport)
#endif

#define LIB_addmatrix_C_API PUBLIC_addmatrix_C_API


#else

#define LIB_addmatrix_C_API

#endif

/* This symbol is defined in shared libraries. Define it here
 * (to nothing) in case this isn't a shared library. 
 */
#ifndef LIB_addmatrix_C_API 
#define LIB_addmatrix_C_API /* No special import/export declaration */
#endif

extern LIB_addmatrix_C_API 
bool MW_CALL_CONV addmatrixInitializeWithHandlers(mclOutputHandlerFcn error_handler,
                                                  mclOutputHandlerFcn print_handler);

extern LIB_addmatrix_C_API 
bool MW_CALL_CONV addmatrixInitialize(void);

extern LIB_addmatrix_C_API 
void MW_CALL_CONV addmatrixTerminate(void);



extern LIB_addmatrix_C_API 
void MW_CALL_CONV addmatrixPrintStackTrace(void);


extern LIB_addmatrix_C_API 
bool MW_CALL_CONV mlxAddmatrix(int nlhs, mxArray *plhs[],
                               int nrhs, mxArray *prhs[]);

extern LIB_addmatrix_C_API 
bool MW_CALL_CONV mlxMultiplymatrix(int nlhs, mxArray *plhs[],
                                    int nrhs, mxArray *prhs[]);

extern LIB_addmatrix_C_API 
bool MW_CALL_CONV mlxEigmatrix(int nlhs, mxArray *plhs[],
                               int nrhs, mxArray *prhs[]);


extern LIB_addmatrix_C_API bool MW_CALL_CONV mlfAddmatrix(int nargout
                                                          , mxArray** a
                                                          , mxArray* a1
                                                          , mxArray* a2);

extern LIB_addmatrix_C_API bool MW_CALL_CONV mlfMultiplymatrix(int nargout
                                                               , mxArray** m
                                                               , mxArray* a1
                                                               , mxArray* a2);

extern LIB_addmatrix_C_API bool MW_CALL_CONV mlfEigmatrix(int nargout
                                                          , mxArray** e
                                                          , mxArray* a1);

#ifdef __cplusplus
}
#endif

#endif
