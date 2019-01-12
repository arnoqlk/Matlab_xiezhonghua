% examp13_5_1 代码
% code by xiezhh
% 2012-1-26

f0 = [1,1,1];
a = [-1,-2,-3];
f = a.*f0;
A = [7, 3, 9; 8, 5, 4; 6, 9, 5];
b = [1; 1; 1];
Aeq = [];
beq = [];
lb = [0, 0, 0];
ub = [];
% 调用linprog函数求解
[x,fval,exitflag,output,lambda] = linprog(f,A,b,Aeq,beq,lb,ub)
