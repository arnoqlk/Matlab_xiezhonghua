function examp12_2_2
tspan = [0,10];%变量求解区间
y0 = [3 4];%初值
a = 100;%参数赋值
b = 50;
options = odeset('RelTol',0.001);%设置相对误差
tic;
%需要把ode45输入参数都写全，待传递的参数a,b写在后面。下面ode23，ode15s类似
[t45,y45] = ode45(@DyDtSubFun,tspan,y0,options,a,b);
time45 = toc;
disp(['ode45计算点数(子函数表示微分方程)：',num2str(length(t45)),...
    '；所用时间：',num2str(time45),'s.'])
tic;
[t23,y23] = ode23(@DyDtSubFun,tspan,y0,options,a,b);
time23 = toc;
disp(['ode23计算点数(子函数表示微分方程)：',num2str(length(t23)),...
    '；所用时间：',num2str(time23),'s.'])
tic;
[t15s,y15s] = ode15s(@DyDtSubFun,tspan,y0,options,a,b);
time15s = toc;
disp(['ode15s计算点数(子函数表示微分方程)：',num2str(length(t15s)),...
    '；所用时间：',num2str(time15s),'s.'])
%用匿名函数表示微分方程
DyDtAnony = @(t,y,a,b) [a - (b+1)*y(1)+y(1).^2*y(2);b*y(1)-y(1).^2*y(2)];
tic;
[t15sAnony,y15sAnony] = ode15s(DyDtAnony,tspan,y0,options,a,b);
time15sAnony = toc;
disp(['ode15s计算点数(匿名函数表示微分方程)：：',num2str(length(t15sAnony)),...
    '；所用时间：',num2str(time15sAnony),'s.'])
%画图展示
figure;
subplot(131);
plot(t23,y23,'k-');xlabel('\itt','fontsize',16);
title('子函数形式/ode23')
subplot(132);
plot(t15s,y15s,'k--');xlabel('\itt','fontsize',16);
title('子函数形式/ode15s')
subplot(133);
plot(t15sAnony,y15sAnony,'k:');xlabel('\itt','fontsize',16);
title('匿名函数形式/ode15s')

%用子函数来表示微分方程
function dy = DyDtSubFun(t,y,a,b)
dy(1,1) = a - (b+1)*y(1)+y(1).^2*y(2);
dy(2,1) = b*y(1)-y(1).^2*y(2);
