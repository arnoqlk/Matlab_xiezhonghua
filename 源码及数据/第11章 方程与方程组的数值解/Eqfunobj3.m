function F = Eqfunobj3(x)
%code by ariszheng@gmail.com 2010-7-6
F = [2*x(1) - x(2) - exp(-x(1));
      -x(1) + 2*x(2) - exp(-x(2))];
