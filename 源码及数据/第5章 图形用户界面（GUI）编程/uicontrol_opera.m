%% checkbox
function checkbox1_Callback(hObject,eventdata)
%判断checkbox是否被选中
if (get(hObject,'Value') == get(hObject,'Max'))
   % checkbox被选中，在这里添加处理代码
else
   % checkbox未被选中，在这里添加处理代码
end

%  edit
function edittext1_Callback(hObject,eventdata)
user_string = get(hObject,'String');
% 后续处理代码
user_value=str2double(user_string);
user_value=str2num(user_string);

% listbox
function listbox1_Callback(hObject,eventdata)
%取得被选中条目的索引值
index_selected = get(hObject,'Value');
%取得列表框中的所有条目，保存到list元胞数组中
string_list = get(hObject,'String');
%根据索引值获取所选中的列表条目，item_selected为字符串
item_selected =string_list{index_selected}; 

%  popupmenu
function popupmenu1_Callback(hObject,eventdata)
%取得被选中条目的索引值
index_selected = get(hObject,'Value');
%取得弹出式菜单中的所有条目，保存到list元胞数组中
string_list = get(hObject,'String');
%根据索引值获取所选中的条目，item_selected为字符串
item_selected = string_list{index_selected}; 

% pushbutton
function mygui
hFig= figure('units','normalize',...
    'position',[0.4 0.4 0.3 0.2]);
%创建按钮控件
hButton=uicontrol('parent',hFig,...
    'style','push',...
    'String','push button',...
    'units','normalize',...
    'position',[0.3 0.4 0.4 0.2]);
%设置按钮控件的Callback属性
set(hButton,'Callback',@pushbutton1_Callback);
%按钮的回调函数
function pushbutton1_Callback(hObject,eventdata)
close(gcbf);

% radiobutton
function radiobutton1_Callback(hObject,eventdata)
if (get(hObject,'Value') == get(hObject,'Max'))
	%单选按钮被选中，进行后续处理
else
	% 单选按钮未被选中，进行后续处理
end

%slider
function slider1_Callback(hObject,eventdata)
%取得滑动条所指示的数值
slider_value = get(hObject,'Value');
%进行后续处理

%togglebutton
function togglebutton1_Callback(hObject,eventdata)
%取得其Value属性值
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
	% 按钮被按下，进行后续处理
   ...
elseif button_state == get(hObject,'Min')
	% 按钮抬起，进行后续处理
    ...
end
