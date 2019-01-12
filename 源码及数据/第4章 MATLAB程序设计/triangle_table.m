function triangle_table
%生成界面，默认控件属性为’normalized’即随界面大小而变化，名称为'triangle_table'，
%figure的编号去掉，不显示菜单项
fig = figure('defaultuicontrolunits','normalized','name','triangle_table',...
    'numbertitle','off','menubar','none');
%建立坐标轴，但是不显示它
ah = axes('Pos',[.1 .2 .75 .75],'Visible','off');
%建立滚动条，回调函数为change_color
slider_h = uicontrol('style','slider','units','normalized','pos',...
    [0.1,0.05,0.75,0.05],'sliderstep',[1/6,0.05],'callback',@change_color);
%画网格并填好数字
hold on
for k = 0:6
    plot(0:6-k,(6-k)*ones(1,(7-k)),'k');
    plot(k*ones(1,(7-k)),k:6,'k');
end
plot([0,6],[0,6],'k');
hold off;
for x = 1:5
    for y = 1:x
        text(y-0.5,x+0.5,num2str(x),'color','k','tag','数字');
    end
end
for k = 0:5
    text(k+0.1,k+0.5,[num2str(k),'.5'],'tag','数字');
end
%====滚动条的回调函数======
    function change_color(hObject,eventdata)
        %滚动条控件句柄slider_h在主函数中，由于是嵌套函数，可以直接使用
        v = round(6*get(slider_h,'value'));
        num_h = findobj('tag','数字');
        num_pos = get(num_h,'pos');
        %红色数字的索引
        red_num_logic = cellfun(@(x) (x(1)<=v&&x(2)<=v),num_pos);
        set(num_h(red_num_logic),'color','r');
        set(num_h(~red_num_logic),'color','k');
    end
end
