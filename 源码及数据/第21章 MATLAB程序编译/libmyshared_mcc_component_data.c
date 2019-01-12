/*
 * MATLAB Compiler: 4.9 (R2008b)
 * Date: Sat Feb 11 10:32:18 2012
 * Arguments: "-B" "macro_default" "-W" "lib:libmyshared" "-T" "link:lib"
 * "ex21_3_1.m" 
 */

#include "mclmcrrt.h"

#ifdef __cplusplus
extern "C" {
#endif
const unsigned char __MCC_libmyshared_session_key[] = {
    '0', '1', '8', '4', '8', '4', '6', '8', 'B', 'F', '2', 'B', 'B', '0', '2',
    '8', 'B', '4', '6', '5', 'A', '3', '4', 'E', '0', 'D', '0', '6', '4', 'A',
    'A', 'A', '8', '5', 'F', 'A', 'E', 'E', '8', 'D', '2', 'E', 'F', '2', '9',
    '0', '9', '4', '4', '0', 'B', 'C', 'C', 'B', 'A', 'C', '2', '4', '7', '3',
    '1', 'D', '5', '3', 'B', '6', '7', '0', 'E', 'A', '5', '8', 'E', 'F', '3',
    '3', 'C', '8', '9', '1', '1', 'B', '6', '0', 'B', 'D', '7', '4', '9', '8',
    '2', '9', 'B', 'F', '3', '2', '2', '0', 'D', 'E', '9', '4', '9', 'D', 'B',
    '7', 'F', 'C', 'D', '4', 'E', 'E', '2', '7', 'C', 'A', 'C', '2', '8', '1',
    '7', 'A', 'A', 'C', 'B', '4', '5', '6', '5', 'E', '7', '8', '9', 'A', '4',
    '0', 'F', '1', 'C', '2', 'D', '7', '2', '8', '3', '1', 'A', '4', '2', '5',
    '9', '2', 'B', '0', '6', 'F', 'B', '3', 'A', '6', '8', 'C', '9', 'F', 'D',
    'E', '2', '3', 'A', 'E', '2', '6', 'D', 'F', '2', 'D', '0', 'D', 'D', '6',
    '3', 'B', 'C', 'F', 'C', 'F', '3', '6', '3', '8', '5', 'E', '0', '2', '5',
    '9', '3', '1', '8', 'B', '7', '5', '6', 'A', 'B', '1', '0', '7', 'A', 'B',
    'C', 'A', 'B', '4', '7', 'E', 'A', '7', '7', '0', '7', '8', 'A', '6', '1',
    '3', '9', 'C', '9', '9', 'B', '5', '9', '9', '5', '4', '7', '7', '8', '2',
    '0', '6', '8', '8', 'A', 'C', '1', '3', '7', 'E', '4', '3', '0', '6', '4',
    '5', '\0'};

const unsigned char __MCC_libmyshared_public_key[] = {
    '3', '0', '8', '1', '9', 'D', '3', '0', '0', 'D', '0', '6', '0', '9', '2',
    'A', '8', '6', '4', '8', '8', '6', 'F', '7', '0', 'D', '0', '1', '0', '1',
    '0', '1', '0', '5', '0', '0', '0', '3', '8', '1', '8', 'B', '0', '0', '3',
    '0', '8', '1', '8', '7', '0', '2', '8', '1', '8', '1', '0', '0', 'C', '4',
    '9', 'C', 'A', 'C', '3', '4', 'E', 'D', '1', '3', 'A', '5', '2', '0', '6',
    '5', '8', 'F', '6', 'F', '8', 'E', '0', '1', '3', '8', 'C', '4', '3', '1',
    '5', 'B', '4', '3', '1', '5', '2', '7', '7', 'E', 'D', '3', 'F', '7', 'D',
    'A', 'E', '5', '3', '0', '9', '9', 'D', 'B', '0', '8', 'E', 'E', '5', '8',
    '9', 'F', '8', '0', '4', 'D', '4', 'B', '9', '8', '1', '3', '2', '6', 'A',
    '5', '2', 'C', 'C', 'E', '4', '3', '8', '2', 'E', '9', 'F', '2', 'B', '4',
    'D', '0', '8', '5', 'E', 'B', '9', '5', '0', 'C', '7', 'A', 'B', '1', '2',
    'E', 'D', 'E', '2', 'D', '4', '1', '2', '9', '7', '8', '2', '0', 'E', '6',
    '3', '7', '7', 'A', '5', 'F', 'E', 'B', '5', '6', '8', '9', 'D', '4', 'E',
    '6', '0', '3', '2', 'F', '6', '0', 'C', '4', '3', '0', '7', '4', 'A', '0',
    '4', 'C', '2', '6', 'A', 'B', '7', '2', 'F', '5', '4', 'B', '5', '1', 'B',
    'B', '4', '6', '0', '5', '7', '8', '7', '8', '5', 'B', '1', '9', '9', '0',
    '1', '4', '3', '1', '4', 'A', '6', '5', 'F', '0', '9', '0', 'B', '6', '1',
    'F', 'C', '2', '0', '1', '6', '9', '4', '5', '3', 'B', '5', '8', 'F', 'C',
    '8', 'B', 'A', '4', '3', 'E', '6', '7', '7', '6', 'E', 'B', '7', 'E', 'C',
    'D', '3', '1', '7', '8', 'B', '5', '6', 'A', 'B', '0', 'F', 'A', '0', '6',
    'D', 'D', '6', '4', '9', '6', '7', 'C', 'B', '1', '4', '9', 'E', '5', '0',
    '2', '0', '1', '1', '1', '\0'};

static const char * MCC_libmyshared_matlabpath_data[] = 
  { "libmyshared/", "$TOOLBOXDEPLOYDIR/", "$TOOLBOXMATLABDIR/general/",
    "$TOOLBOXMATLABDIR/ops/", "$TOOLBOXMATLABDIR/lang/",
    "$TOOLBOXMATLABDIR/elmat/", "$TOOLBOXMATLABDIR/randfun/",
    "$TOOLBOXMATLABDIR/elfun/", "$TOOLBOXMATLABDIR/specfun/",
    "$TOOLBOXMATLABDIR/matfun/", "$TOOLBOXMATLABDIR/datafun/",
    "$TOOLBOXMATLABDIR/polyfun/", "$TOOLBOXMATLABDIR/funfun/",
    "$TOOLBOXMATLABDIR/sparfun/", "$TOOLBOXMATLABDIR/scribe/",
    "$TOOLBOXMATLABDIR/graph2d/", "$TOOLBOXMATLABDIR/graph3d/",
    "$TOOLBOXMATLABDIR/specgraph/", "$TOOLBOXMATLABDIR/graphics/",
    "$TOOLBOXMATLABDIR/uitools/", "$TOOLBOXMATLABDIR/strfun/",
    "$TOOLBOXMATLABDIR/imagesci/", "$TOOLBOXMATLABDIR/iofun/",
    "$TOOLBOXMATLABDIR/audiovideo/", "$TOOLBOXMATLABDIR/timefun/",
    "$TOOLBOXMATLABDIR/datatypes/", "$TOOLBOXMATLABDIR/verctrl/",
    "$TOOLBOXMATLABDIR/codetools/", "$TOOLBOXMATLABDIR/helptools/",
    "$TOOLBOXMATLABDIR/winfun/", "$TOOLBOXMATLABDIR/demos/",
    "$TOOLBOXMATLABDIR/timeseries/", "$TOOLBOXMATLABDIR/hds/",
    "$TOOLBOXMATLABDIR/guide/", "$TOOLBOXMATLABDIR/plottools/",
    "toolbox/local/", "toolbox/shared/dastudio/",
    "$TOOLBOXMATLABDIR/datamanager/", "toolbox/compiler/" };

static const char * MCC_libmyshared_classpath_data[] = 
  { "" };

static const char * MCC_libmyshared_libpath_data[] = 
  { "" };

static const char * MCC_libmyshared_app_opts_data[] = 
  { "" };

static const char * MCC_libmyshared_run_opts_data[] = 
  { "" };

static const char * MCC_libmyshared_warning_state_data[] = 
  { "off:MATLAB:dispatcher:nameConflict" };


mclComponentData __MCC_libmyshared_component_data = { 

  /* Public key data */
  __MCC_libmyshared_public_key,

  /* Component name */
  "libmyshared",

  /* Component Root */
  "",

  /* Application key data */
  __MCC_libmyshared_session_key,

  /* Component's MATLAB Path */
  MCC_libmyshared_matlabpath_data,

  /* Number of directories in the MATLAB Path */
  39,

  /* Component's Java class path */
  MCC_libmyshared_classpath_data,
  /* Number of directories in the Java class path */
  0,

  /* Component's load library path (for extra shared libraries) */
  MCC_libmyshared_libpath_data,
  /* Number of directories in the load library path */
  0,

  /* MCR instance-specific runtime options */
  MCC_libmyshared_app_opts_data,
  /* Number of MCR instance-specific runtime options */
  0,

  /* MCR global runtime options */
  MCC_libmyshared_run_opts_data,
  /* Number of MCR global runtime options */
  0,
  
  /* Component preferences directory */
  "libmyshared_DEF38A9C620F6361925E2C33346EFB82",

  /* MCR warning status data */
  MCC_libmyshared_warning_state_data,
  /* Number of MCR warning status modifiers */
  1,

  /* Path to component - evaluated at runtime */
  NULL

};

#ifdef __cplusplus
}
#endif


