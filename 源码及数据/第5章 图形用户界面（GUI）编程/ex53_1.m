function varargout = ex53_1(varargin)
% ex53_1 M-file for ex53_1.fig
%      ex53_1, by itself, creates a new ex53_1 or raises the existing
%      singleton*.
%
%      H = ex53_1 returns the handle to a new ex53_1 or the handle to
%      the existing singleton*.
%
%      ex53_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ex53_1.M with the given input arguments.
%
%      ex53_1('Property','Value',...) creates a new ex53_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ex53_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ex53_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ex53_1
% Last Modified by GUIDE v2.5 31-Jul-2010 14:48:06
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ex53_1_OpeningFcn, ...
                   'gui_OutputFcn',  @ex53_1_OutputFcn, ...
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


% --- Executes just before ex53_1 is made visible.
function ex53_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ex53_1 (see VARARGIN)

x=0:pi/50:8*pi;
y=sin(x);
axes(handles.axes1);
handles.hplot=plot(x,y,'color',[1 0 0]);

 myvalue=10;
handles.newvalue=myvalue;
guidata(hObject,handles);


% Choose default command line output for ex53_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ex53_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ex53_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

val = get(hObject,'Value');
switch val
    case 1
        set(handles.hplot,'color',[1 0 0]);
    case 2
        set(handles.hplot,'color',[0 1 0]);
    case 3
        set(handles.hplot,'color',[0 0 1]);
    case 4
        set(handles.hplot,'color',[1 1 0]);
    case 5
        set(handles.hplot,'color',[0 0 0]);
    case 6
        set(handles.hplot,'color',[0 1 1]);
    case 7
        set(handles.hplot,'color',[1 0 1]);
end


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



