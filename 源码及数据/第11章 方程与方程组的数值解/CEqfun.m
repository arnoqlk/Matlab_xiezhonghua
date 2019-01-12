function F = CEqfun(x,a,b)
%code by ariszheng@gmail.com 
%2010-7-6
F = [a*x(1) - x(2) - exp(-x(1));
      -x(1) + b*x(2) - exp(-x(2))];
