%code by ariszheng@gmail.com 2010-7-19
OPTIONS = optimset('display','iter');
x=[-1.9,2];
[x,fval,exitflag,output] = fminsearch(@BanaFun,x,OPTIONS)