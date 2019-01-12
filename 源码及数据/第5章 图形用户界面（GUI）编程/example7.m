function [] = example7()
S.fh = figure('units','normalized',...
    'position',[0.1 0.1 0.3 0.3],...
    'menubar','none',...
    'name','example7',...
    'numbertitle','off',...
    'resize','off');
S.text = uicontrol('style','text',...
    'unit','normalized',...
    'position',[0.1,0.85 0.4 0.05],...
    'string','change line color');
S.pop = uicontrol('style','popupmenu',...
    'unit','normalized',...
    'position',[0.6,0.8 0.3 0.1],...
    'string',{'red';'green';'blue'; ...
    'yellow';'black';'cyan';'magenta'});
S.axes = axes('unit','normalized','position',[0.1 0.1 0.8 0.7]);

x=0:pi/50:8*pi;
y=sin(x);
axes(S.axes);
S.hplot=plot(x,y,'color',[1 0 0]);

set(S.pop,'callback',{@mycallback,S});

function mycallback(obj,event,S)
val = get(obj,'Value');
switch val
    case 1
        set(S.hplot,'color',[1 0 0]);
    case 2
        set(S.hplot,'color',[0 1 0]);
    case 3
        set(S.hplot,'color',[0 0 1]);
    case 4
        set(S.hplot,'color',[1 1 0]);
    case 5
        set(S.hplot,'color',[0 0 0]);
    case 6
        set(S.hplot,'color',[0 1 1]);
    case 7
        set(S.hplot,'color',[1 0 1]);
end