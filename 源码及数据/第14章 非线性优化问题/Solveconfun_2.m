options = optimset('LargeScale','off','display','iter');
%Code by ariszheng@gmail.com  2010-7-20
%参数设置使用中等规模算法，显示迭代过程
x0=[10,10,10];%初始迭代点
lb=[0,0,0];%变量下限
[x,fval,exitflag,output]= fmincon(@confun_2,x0,[],[],[],[],lb,[],@noncon_2,options)
%x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)