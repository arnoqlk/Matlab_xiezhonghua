function SolveEqfun3
%初始迭代点为[-5;-5]
x0 = [-3; -5];
options=optimset('Display','iter'); %显示迭代过程
[x,fval] = fsolve(@Eqfunobj2,x0,options)

%目标方程:Eqfunobj3,用子函数的形式
function F = Eqfunobj3(x)
 F = [2*x(1) - x(2) - exp(-x(1));
      -x(1) + 2*x(2) - exp(-x(2))]; 
