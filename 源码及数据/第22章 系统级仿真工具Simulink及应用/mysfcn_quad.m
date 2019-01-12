function mysfcn_quad(block)
% Level-2 M file S-Function for quadratic
% Copyright 2010 RIGOL.Inc

  setup(block);

function setup(block)
  
  %% Register dialog parameter: edge direction 
  block.NumDialogPrms = 3;
  block.DialogPrmsTunable = {'Tunable','Tunable','Tunable'};
  %% Register number of input and output ports
  block.NumInputPorts  = 1;
  block.NumOutputPorts = 1;

  %% Setup functional port properties to dynamically
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;
 
  block.InputPort(1).Dimensions        = 1;
  block.InputPort(1).DirectFeedthrough = true;
  
  block.OutputPort(1).Dimensions       = 1;
  
  %% Set block sample time to variable sample time
  block.SampleTimes = [-1 0];
  
  %% Set the block simStateComliance to default (i.e., same as a built-in block)
  block.SimStateCompliance = 'DefaultSimState';

  %% Register methods
  block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);
  block.RegBlockMethod('InitializeConditions',    @InitConditions); 
  block.RegBlockMethod('Outputs',                 @Output);  
  block.RegBlockMethod('Update',                  @Update);  

function DoPostPropSetup(block)

  %% Setup Dwork
  block.NumDworks = 1;
  block.Dwork(1).Name = 'X'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = true;

function InitConditions(block)

  %% Initialize Dwork
  block.Dwork(1).Data = 0;

function Output(block)

  a = block.DialogPrm(1).Data;
  b = block.DialogPrm(2).Data;
  c = block.DialogPrm(3).Data;
  block.OutputPort(1).Data = a*block.Dwork(1).Data.^2+b*block.Dwork(1).Data+c;
  
function Update(block)

  block.Dwork(1).Data = block.InputPort(1).Data(1);
  
%==================