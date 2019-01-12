function SolveParaEqfun
x0 = [-5; -5];
a=2; %取值示例
b=2;
options=optimset('Display','iter');  
[x,fval] = fsolve(@(x) CEqfun(x,a,b),x0,options)  
%目标方程，预留了参数的输入项，方便后续结合匿名函数传递参数。
function F = CEqfun(x,a,b)
F = [a*x(1) - x(2) - exp(-x(1));
      -x(1) + b*x(2) - exp(-x(2))];