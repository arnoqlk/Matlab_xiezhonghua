function varargout = ex55_1(varargin)
% ex55_1 M-file for ex55_1.fig
%      ex55_1, by itself, creates a new ex55_1 or raises the existing
%      singleton*.
%
%      H = ex55_1 returns the handle to a new ex55_1 or the handle to
%      the existing singleton*.
%
%      ex55_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ex55_1.M with the given input arguments.
%
%      ex55_1('Property','Value',...) creates a new ex55_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ex55_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ex55_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ex55_1

% Last Modified by GUIDE v2.5 23-Aug-2010 09:34:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @ex55_1_OpeningFcn, ...
    'gui_OutputFcn',  @ex55_1_OutputFcn, ...
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


% --- Executes just before ex55_1 is made visible.
function ex55_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ex55_1 (see VARARGIN)

%初始化绘图数据
x=0:pi/50:2*pi;
y=sin(x);
%指定当前坐标轴
axes(handles.axes1);
%绘制图形
handles.plot=plot(x,y,'b','linewidth',1.5);
%设置坐标轴的文本为倾斜，x轴的颜色为红色
set(gca,'fontangle','italic','xcolor',[1 0 0]);
%打开栅格
grid on
%给x和y轴添加标签
xlabel('x坐标轴');
ylabel('y坐标轴');

% Choose default command line output for ex55_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ex55_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ex55_1_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1

value= get(hObject,'value');
switch value
    case 1
        set(handles.plot,'color','r');
    case 2
        set(handles.plot,'color','g');
    case 3
        set(handles.plot,'color','b');
end


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
value= get(hObject,'value');
switch value
    case 1
        set(handles.plot,'linestyle','-','marker','none');
    case 2
        set(handles.plot,'linestyle','--','marker','none');
    case 3
        set(handles.plot,'linestyle',':','marker','none');
    case 4
        set(handles.plot,'linestyle','-.','marker','none');
    case 5
        set(handles.plot,'linestyle','none','marker','none');
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

% --------------------------------------------------------------------
function uitoggletool1_OffCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.axes1,'xgrid','off','ygrid','off');

% --------------------------------------------------------------------
function uitoggletool1_OnCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.axes1,'xgrid','on','ygrid','on');

% --------------------------------------------------------------------
function menu_red_Callback(hObject, eventdata, handles)
% hObject    handle to menu_red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.plot,'color','r');

% --------------------------------------------------------------------
function menu_green_Callback(hObject, eventdata, handles)
% hObject    handle to menu_green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.plot,'color','g');

% --------------------------------------------------------------------
function menu_blue_Callback(hObject, eventdata, handles)
% hObject    handle to menu_blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.plot,'color','b');


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel1
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
tag= get(eventdata.NewValue,'Tag');
switch tag
    case 'radiobutton1'
        set(handles.axes1,'xgrid','on','ygrid','on');
    case 'radiobutton2'
        set(handles.axes1,'xgrid','off','ygrid','off');
end


