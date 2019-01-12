/*  File: quad_sfunc.c
 *
 *      Example C-file S-function for defining a quadratic.
 *      y(t) = 3*u(t)^2+2*u(t)+1
 */

#define S_FUNCTION_NAME quad_sfunc
#define S_FUNCTION_LEVEL 2

#include "simstruc.h"

/* Function: mdlInitializeSizes ===========================================
 * The sizes information is used by Simulink to determine the S-function
 * block's characteristics (number of inputs, outputs, states, etc.).
 */
static void mdlInitializeSizes(SimStruct *S) 
{
    ssSetNumSFcnParams(S, 0);  /* Number of expected parameters */
    if (ssGetNumSFcnParams(S) != ssGetSFcnParamsCount(S)) {
        return; /* Parameter mismatch will be reported by Simulink */
    }
    
    ssSetNumContStates(S, 0);
    ssSetNumDiscStates(S, 0);
    
    if (!ssSetNumInputPorts(S, 1)) return;
    ssSetInputPortWidth(S, 0, DYNAMICALLY_SIZED);
    ssSetInputPortDirectFeedThrough(S, 0, 1);
    
    if (!ssSetNumOutputPorts(S, 1)) return;
    ssSetOutputPortWidth(S, 0, DYNAMICALLY_SIZED);
    
    ssSetNumSampleTimes(S, 1);
    
    ssSetSimStateCompliance(S, USE_DEFAULT_SIM_STATE);
   
    /* Take care when specifying exception free code - see sfuntmpl_doc.c */
    ssSetOptions(S,
                 SS_OPTION_WORKS_WITH_CODE_REUSE |
                 SS_OPTION_EXCEPTION_FREE_CODE |
                 SS_OPTION_USE_TLC_WITH_ACCELERATOR);
}

/* Function: mdlInitializeSampleTimes ================================== */
static void mdlInitializeSampleTimes(SimStruct *S) 
{
    ssSetSampleTime(S, 0, INHERITED_SAMPLE_TIME);
    ssSetOffsetTime(S, 0, 0.0);
    ssSetModelReferenceSampleTimeDefaultInheritance(S);
}

/* Function: mdlOutputs =======================================================
 * Abstract: y =3*x^2+2*x+1
 */
static void mdlOutputs(SimStruct *S, int_T tid) 
{
    int_T  k;
    InputRealPtrsType uPtrs = ssGetInputPortRealSignalPtrs(S,0);
    real_T *y = ssGetOutputPortRealSignal(S,0);
    int_T  width=ssGetOutputPortWidth(S,0);
    /*real_T *x = ssGetRealDiscStates(S);*/
    
    for(k=0; k<width; k++) {
        *y++ = 3.0*(*uPtrs[k])*(*uPtrs[k])+2.0*(*uPtrs[k])+1;
    }
    
}

/* Function: mdlTerminate =====================================================
 * Abstract: No termination needed, but we are required to have this routine.
 */
static void mdlTerminate(SimStruct *S) 
{
}

#ifdef  MATLAB_MEX_FILE    /* Is this file being compiled as a MEX-file? */
#include "simulink.c"      /* MEX-file interface mechanism */
#else
#include "cg_sfun.h"       /* Code generation registration function */
#endif
