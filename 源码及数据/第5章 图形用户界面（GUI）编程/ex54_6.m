function ex54_6
%使用缺省属性值创建图形窗口
hf=figure;
%设置图形窗口的部分属性值
set(hf,...
    'toolbar','figure',...
    'menubar','none',...
    'numbertitle','off',...
    'name','example window',...
    'units','normalized',...
    'position',[0.3 0.4 0.6 0.5]);