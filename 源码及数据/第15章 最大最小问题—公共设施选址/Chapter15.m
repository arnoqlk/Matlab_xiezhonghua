%--------------------------------------------------------------------------
%  第15章  最大最小问题—公共设施选址
%--------------------------------------------------------------------------

%% 无约束情形
% 以匿名函数形式编写目标函数
% code by xiezhh
minimaxMyfun = @(x)sqrt([(x(1)-1.5)^2+(x(2)-6.8)^2; 
   (x(1)-6.0)^2+(x(2)-7.0)^2;
   (x(1)-8.9)^2+(x(2)-6.9)^2;
   (x(1)-3.5)^2+(x(2)-4.0)^2;
   (x(1)-7.4)^2+(x(2)-3.1)^2]);

% 调用fminimax函数求解模型(15.2-2)
x0 = [0.0; 0.0];
[x,fval,maxfval,exitflag,output] = fminimax(minimaxMyfun,x0)

%% 有约束情形
% 以匿名函数形式编写目标函数
% code by xiezhh
minimaxMyfun = @(x)sqrt([(x(1)-1.5)^2+(x(2)-6.8)^2; 
   (x(1)-6.0)^2+(x(2)-7.0)^2;
   (x(1)-8.9)^2+(x(2)-6.9)^2;
   (x(1)-3.5)^2+(x(2)-4.0)^2;
   (x(1)-7.4)^2+(x(2)-3.1)^2]);

x0 = [0.0; 0.0];
Aeq = [1,-1];
beq = 2.5;

% 调用fminimax函数求解模型（15.3-1）
[x,fval,maxfval,exitflag,output] = fminimax(minimaxMyfun,x0,[],[],Aeq,beq)