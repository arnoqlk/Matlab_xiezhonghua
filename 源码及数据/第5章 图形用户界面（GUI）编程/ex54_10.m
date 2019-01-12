function ex54_10
%创建图形窗口对象
hFig= figure('units','normalize',...
    'position',[0.4 0.4 0.3 0.2]);
%创建下压按钮对象，设置其Callback属性
hPush=uicontrol('parent',hFig,...
    'style','pushbutton',...
    'String','',...
    'units','normalize',...
    'position',[0.4 0.4 0.2 0.2]);
%读取按钮的背景图片
[a,map]=imread('mute.jpg');
%取得图片的尺寸
[r,c,d]=size(a);
%改变图片的大小，使其和按钮的大小相符
x=ceil(r/30); 
y=ceil(c/30); 
g=a(1:x:end,1:y:end,:);
%设置按钮的CData属性值
set(hPush,'CData',g);
