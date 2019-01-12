function [sys,x0,str,ts,simStateCompliance] = quad_msfunc(t,x,u,flag,a,b,c)

% The following outlines the general structure of an S-function.
switch flag,
    
    % Initialization %
    case 0,
        [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes;
        
        % Outputs %
    case 3,
        sys=mdlOutputs(t,x,u,a,b,c);
        
        % Unhandled flags %
    case{1,2,4,9}
        sys = [];
        
        % Unexpected flags %
    otherwise
        DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));
        
end

%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================

function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes

sizes = simsizes;

sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = -1;
sizes.NumInputs      = -1;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;     % at least one sample time is needed

sys = simsizes(sizes);

% initialize the initial conditions
x0  = [];
str = [];

% initialize the array of sample times
ts  = [-1 0];      % inherited sample time

% speicfy that the simState for this s-function is same as the default
simStateCompliance = 'DefaultSimState';

%=============================================================================
% mdlOutputs
% Return the block outputs.
%=============================================================================

function sys=mdlOutputs(t,x,u,a,b,c)

sys = a*u.^2+b*u+c;

%==================