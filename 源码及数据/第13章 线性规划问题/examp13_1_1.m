% examp13_1_1 代码
% code by xiezhh
% 2012-1-26

%%大规模内点法 
f = [-12,-14,-13];
A= [1.1, 1.2, 1.4; 0.5, 0.6, 0.6; 0.7, 0.8, 0.6];
b= [4600; 2100; 2500];
Aeq=[];
beq=[];
lb=[0; 0; 0];
ub=[];
% 调用linprog函数，使用默认算法（即大规模内点法）求解模型(13.4-1)
[x,fval,exitflag,output,lambda] = linprog(f,A,b,Aeq,beq,lb,ub)


options = optimset('LargeScale', 'off', 'Simplex', 'on','Display','iter');
% 调用linprog，使用单纯形算法求解模型(13.4-1)，并显示每一步迭代结果
[x,fval,exitflag,output,lambda] = linprog(f,A,b,Aeq,beq,lb,ub,[],options)