function ex54_4
%创建界面窗口，不包含工具条
h0=figure('toolbar','none',...
    'position',[200 150 450 250],...
    'name','ex54_4',...
    'numbertitle','off');
%在窗口中绘制正弦曲线
global h
x=0:0.5:2*pi;
y=sin(x);
h=plot(x,y);
grid on
%创建静态文本控件
hm=uicontrol(h0,'style','text',...
    'string',...
    '绘图函数',...
    'position',[380 180 50 20]);
%创建弹出式菜单控件，并初始化其string属性值
hm=uicontrol(h0,'style','popupmenu',...
    'string',...
    'sin(x)|cos(x)|sin(x)+cos(x)',...
    'position',[380 150 50 20]);
%设置弹出式菜单的第一项为默认选项
set(hm,'value',1)
%设置弹出式菜单的callback属性值
set(hm,'callback',{@popupmenu_callback,x})
%设置坐标轴的位置和大小，坐标轴对象的units属性缺省值为normalized
set(gca,'position',[0.2 0.2 0.6 0.6])

%定义弹出式菜单的callback，为子函数
function popupmenu_callback(hobj,event,x)
global h
v=get(hobj,'value');
switch v
    case 1
        delete(h);
        y=sin(x);
        h=plot(x,y);
        grid on
    case 2
        delete(h);
        y=cos(x);
        h=plot(x,y);
        grid on
    case 3
        delete(h);
        y=sin(x)+cos(x);
        h=plot(x,y);
        grid on
end
