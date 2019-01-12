function [c,ceq] = noncon_2(x)
%code by ariszheng@gmail.com  2010-7-20
c =-x(1)-x(2)-x(3)+72;  % 关于x非线性不等式约束. 
ceq =[]; % 关于x非线性等式约束