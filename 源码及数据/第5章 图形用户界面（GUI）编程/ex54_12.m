function varargout = ex54_12(varargin)
% ex54_12 M-file for ex54_12.fig
%      ex54_12, by itself, creates a new ex54_12 or raises the existing
%      singleton*.
%
%      H = ex54_12 returns the handle to a new ex54_12 or the handle to
%      the existing singleton*.
%
%      ex54_12('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ex54_12.M with the given input arguments.
%
%      ex54_12('Property','Value',...) creates a new ex54_12 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ex54_12_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ex54_12_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ex54_12

% Last Modified by GUIDE v2.5 14-Aug-2010 23:45:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ex54_12_OpeningFcn, ...
                   'gui_OutputFcn',  @ex54_12_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ex54_12 is made visible.
function ex54_12_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ex54_12 (see VARARGIN)

% Choose default command line output for ex54_12
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ex54_12 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ex54_12_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when selected object is changed in buttongroup1.
function buttongroup1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in buttongroup1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% h1=get(handles.buttongroup1,'SelectedObject');
tag= get(hObject,'Tag');
switch tag
    case 'radiobutton1'
        % Code for when radiobutton1 is selected.
    case 'radiobutton2'
        % Code for when radiobutton2 is selected.
    case 'togglebutton1'
        % Code for when togglebutton1 is selected.
    case 'togglebutton2'
        % Code for when togglebutton2 is selected.
    % Continue with more cases as necessary.
    otherwise
        % Code for when there is no match.
end



