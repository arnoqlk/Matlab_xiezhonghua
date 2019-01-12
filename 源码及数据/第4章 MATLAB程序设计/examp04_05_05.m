syms x
f = (x+tan(x))^(sin(x));
c = diff(f,3);
f3 = eval(['@(x)' vectorize(c)]);
x = linspace(0,1,100);
plot(x,f3(x))
title('(x+tan(x))\^(sin(x))Èý½×µ¼ÊýÍ¼Ïñ')
