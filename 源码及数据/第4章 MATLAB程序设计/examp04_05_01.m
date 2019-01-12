f = @(x) exp(x)+x^2+x^(sqrt(x))-100 %构造方程的匿名函数形式
format long 
x0 = fzero(f,3) %求方程的根，初始值为3
f(x0)  %代入原方程验证

%--------------------------------------------------------------------------
% 例4.5-1续
%--------------------------------------------------------------------------
f = @(a) @(x) exp(x)+x^a+x^(sqrt(x))-100;%构造函数句柄
format long
aa = 0:0.01:2;
plot(aa,arrayfun(@(a) fzero(f(a),4),aa),'*-')%利用arrayfun求解不同的a对应的x
xlabel('$a$','interpreter','latex','fontsize',15)%标注x、y坐标轴，按照latex语法
ylabel('$x$','interpreter','latex','fontsize',15)
title('$\mathrm{e}^{x} + x^{\sqrt{x}} + x^a - 100$','interpreter','latex',...
'fontsize',15)
