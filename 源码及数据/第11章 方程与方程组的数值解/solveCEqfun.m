%code by ariszheng@gmail.com
%2010-7-6
x0 = [-5; -5];
a=2;
b=2;
options=optimset('Display','iter');  
[x,fval,exitflag,output]= fsolve(@(x) CEqfun(x,a,b),x0,options)  
