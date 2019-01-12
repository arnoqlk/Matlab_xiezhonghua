function ex54_7
%使用缺省属性值创建图形窗口对象
hf=figure;
%设置图形窗口对象的部分属性值
set(hf,...
    'toolbar','figure',...
    'menubar','none',...
    'numbertitle','off',...
    'name','example window',...
    'units','normalized',...
    'position',[0.3 0.4 0.6 0.5]);
%创建坐标轴对象
haxes=axes('parent',hf,'position',[0.1 0.1 0.5 0.8]);
%初始化绘图数据
x=0:pi/50:2*pi;
y=sin(x);
%指定当前坐标轴
axes(haxes);
%绘制图形
plot(x,y,'b*');
%设置坐标轴的文本为倾斜，x轴的颜色为红色
set(gca,'fontangle','italic','xcolor',[1 0 0]);
%打开栅格
grid on
%给坐标轴对象添加标题
title('我建立的第一个坐标轴');
%给x和y轴添加标签
xlabel('x坐标轴');
ylabel('y坐标轴');



