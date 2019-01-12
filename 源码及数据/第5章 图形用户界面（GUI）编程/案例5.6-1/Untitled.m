%%
filename=ls('*.m'); %通配符*代表要列出所有文件，.m是文件的扩展名。
filename=ls(' C:\Users\Default\Pictures \*.jpg');
number_of_files=size(filename,1); 
fileii=filename(1,:);

%%
files=dir('dirname'); 
filename=dir(' C:\Users\Default\Pictures\*.jpg');
% 取得filename中保存的文件的数目：
number_of_files=length(filename); %filename为m╳1的结构体
% 取得filename中第ii个文件的名称：
fileii=filename(ii).name;
% 取得列表框中的选中条目
str=get(h,'string'); %取得控件中的所有条目，str是N×1的cell数组
value=get(h,'value'); %取得所选条目的序号，是1×n的数组
%取得所选条目的字符串，selected_str是1×n的cell数组
selected_str=str(value(:));
%删除列表框中的选中条目
str=get(h,'string'); %取得控件中的所有条目
value=get(h,'value'); %取得所选条目的序号
str(value(:))=[]; %把指定条目的字符串设置为[]，即可删除所选的条目
%重新设置显示的条目，并设置第一个条目为选中状态
set(h,'string',str,'value',1); 

