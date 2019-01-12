global X Y Z
X=10;Y=20;Z=30;

global X Y Z
A=X;B=Y;C=Z;
disp(X);
disp(Y);
disp(Z);

%在控件的回调函数中将数据保存到handles结构中
handles.value1=10;
handles.value2=20;
guidata(hObject,handles);

%在控件的回调函数中引用handles结构中保存的数据
value1=handles.value1;
value2=handles.value2;
disp(value1);
disp(value2);

value=10;
set(handles.figure1,'userdata',value);
value1=get(handles.figure1,'userdata');