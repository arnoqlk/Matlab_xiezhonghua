OPTIONS = optimset('display','iter');%显示迭戈过程
x=[-1.9,2];%初始迭代点
%调用fminunc函数
[x,fval,exitflag,output]=fminunc(@BanaFun,x,OPTIONS)