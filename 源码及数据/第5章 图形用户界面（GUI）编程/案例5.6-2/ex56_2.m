function ex56_2
s.hf=figure('name','获得鼠标输入',...
    'numbertitle','off',...
    'tag','figure1',...
    'menubar','none',...
    'toolbar','none',...
    'units','normalized',...
    'position',[0.3 0.3 0.4 0.3]);
s.haxes=axes('parent',s.hf,...
    'units','normalized',...
    'position',[0.1 0.1 0.8 0.8],...
    'XTick',[],...
    'YTick',[],...
    'Box','on');
%设置figure的WindowButtonDownFcn属性
%以及WindowButtonMotionFcn属性
%以及WindowButtonUpFcn属性
set(s.hf,'WindowButtonDownFcn',@my_windowbuttondownfcn);
set(s.hf,'WindowButtonMotionFcn',@my_windowbuttonmotionfcn);
set(s.hf,'WindowButtonUpFcn',@my_windowbuttonUpfcn);
%定义一个绘图标志，其值为1表示正在绘图，为0表示停止绘图
global draw_enable
draw_enable=0;

function my_windowbuttondownfcn(hobj,event)
global draw_enable;
global x;
global y;
%如果figure的selectiontype属性值为normal，则表示点击鼠标左键，
%开始绘制折线，将绘图标志设置为1
if strcmp(get(hobj,'SelectionType'),'normal')
    draw_enable=1;
    p=get(gca,'currentpoint');
    x(1)=p(1);
    y(1)=p(3);
    x(2)=p(1);
    y(2)=p(3);
    line(x,y,'EraseMode','xor');

%如果figure的selectiontype属性值为alt，则表示点击鼠标右键，
%将绘图标志设置为0，退出绘图状态
elseif strcmp(get(hobj,'SelectionType'),'alt')
    cla;
end

function my_windowbuttonmotionfcn(hobj,event)
global draw_enable;
global x;
global y;
p=get(gca,'currentpoint');
if draw_enable==1
    x(1)=x(2);
    y(1)=y(2);
    x(2)=p(1);
    y(2)=p(3);
    line(x,y,'EraseMode','xor');
end

function my_windowbuttonUpfcn(hobj,event)
global draw_enable
draw_enable=0;

