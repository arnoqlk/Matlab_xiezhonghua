function my_callback
hm=findobj(gcf,'style','popupmenu');
h=findobj(gcf,'style','line');
x=evalin('base','x');
v=get(hm,'value');
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