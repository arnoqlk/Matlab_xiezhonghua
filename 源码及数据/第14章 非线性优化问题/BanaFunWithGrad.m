function [f,g]=BanaFunWithGrad(x)
%code by ariszheng@gmail.com  2010-7-19
f=100*(x(2)-x(1)^2)^2+(1-x(1))^2;
g=[100*(4*x(1)^3-4*x(1)*x(2))+2*x(1)-2; 100*(2*x(2)-2*x(1)^2)];