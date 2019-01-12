function DefineCallback
%创建图形窗口对象
hFig= figure('units','normalize',...
    'position',[0.4 0.4 0.3 0.2]);
%创建下压按钮对象，设置其Callback属性
hPush=uicontrol('parent',hFig,...
    'style','pushbutton',...
    'String','Execute Callback',...
    'units','normalize',...
    'position',[0.4 0.4 0.3 0.2]);
% set(hPush,'callback',@ex5_13_2_Callback)

set(hPush,'callback',@ex54_9_Callback)

function ex54_9_Callback(obj,event)
figure;
x = 0:pi/20:2*pi;
y = sin(x);
plot(x,y);