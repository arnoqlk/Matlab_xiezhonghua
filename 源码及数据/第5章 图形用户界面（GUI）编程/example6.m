% （1）查看图形窗口对象的大小和位置的度量单位
%使用缺省的属性创建一个图形窗口对象
fh=figure;
%查看度量单位
get(fh,'units')
% ans =
% pixels
% （2）改变窗口的大小和位置
%将窗口的左下角移动到点（200，300）处，大小设置为400×300像素点
set(fh,'Position',[200 300 400 300]);
% 可以看到，图形窗口在屏幕上的位置和大小均发生了改变。
% （3）查看可以设置的鼠标指针的形状
set(fh,'Pointer')%Pointer属性标识鼠标指针的形状，{arrow}表示默认的指
% 针形状
% [ crosshair | fullcrosshair | {arrow} | ibeam | watch | topl | topr | botl | botr | left | top | right | bottom | circle | cross | fleur | custom | hand ]
