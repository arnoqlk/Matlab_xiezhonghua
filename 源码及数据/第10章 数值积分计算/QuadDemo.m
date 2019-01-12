function QuadDemo
format long
tic;a1 = quad(@(x) sin(x).^2,0,20),toc
tic;a2 = quadl(@(x) sin(x).^2,0,20),toc
tic;a3 = quadgk(@(x) sin(x).^2,0,20),toc
warning('off','all');
disp(' ');
disp('下面是震荡函数积分结果：');
disp(' ');
tic;b1 = quad(@(x) sin(100*x).^2,0,20),toc
tic;b2 = quadl(@(x) sin(100*x).^2,0,20),toc
tic;b3 = quadgk(@(x) sin(100*x).^2,0,20),toc
syms x
double(int(sin(100*x)^2,0,20))%符号积分给出精确结果