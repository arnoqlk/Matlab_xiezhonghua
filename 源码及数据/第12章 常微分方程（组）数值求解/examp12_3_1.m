function examp12_3_1
%用符号积分求解dy的解析表达式
[dy(1,1),dy(2,1)] = solve('dy2*(y(2)*cos(4*t) - y(1)^3) - t/5*dy1',...
    't*sin(y(2))/8 - 2*y(2)*dy2 + sqrt(t)*dy1','dy1','dy2');
%利用字符串执行函数eval生成微分方程的匿名函数
eval(['DyDtAnony = @(t,y) [' char(dy(1,1)),';',char(dy(2,1)),']']);
tspan = [1 30];
y0 = [1;1];
[t,y] = ode45(DyDtAnony,tspan,y0);%调用ode45求解
figure;
plot(t,y(:,1),'k-');
hold on
plot(t,y(:,2),'k:');
%图例,位置自动选择最佳位置
L = legend('{\ity}_1(t)','{\ity}_2(t)','Location','best');
set(L,'fontname','Times New Roman');
xlabel('\itt','fontsize',16);
