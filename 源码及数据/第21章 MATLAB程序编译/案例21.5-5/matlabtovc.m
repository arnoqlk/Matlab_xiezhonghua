function matlabtovc()
figure('menubar','none',...
    'toolbar','none',...
    'numbertitle','off',...
    'name','MATLAB与VC联合编程');
x=0:pi/50:2*pi;

subplot(221);
plot(x,sin(x),'r-','marker','o');
title('sin');
grid on

subplot(222);
plot(x,cos(x),'g:','marker','*');
title('cos');
grid on

Y = [5 2 1
     8 7 3
     9 8 6
     5 5 5
     4 3 2];
subplot(223);
bar(Y);
title('bar');
grid on

subplot(224);
mesh(peaks);
title('mesh');
set(gca,'xminorgrid','on','yminorgrid','on');
