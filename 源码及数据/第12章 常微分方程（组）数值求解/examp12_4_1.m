function examp12_4_1
y01 = [0.8;0.1];%第一种方法的初值（第一方法只需要用到两个变量）
y0 = [0.8;0.1;0.1];%初值
tspan = [0 20];
%===============================
%方法1：变量替换
%===============================
%将y(3)用1-y(1)-y(2)代替
    function DyDt = DyDtNestedFun1(t,y)
        DyDt = [-0.2*y(1)+y(2)*(1-y(1)-y(2))+0.3*y(1)*y(2);
            2*y(1)*y(2)-5*y(2)*(1-y(1)-y(2))-2*y(2)^2];
    end
[T1,Y1] = ode45(@DyDtNestedFun1,tspan,y01);
%===============================
%方法2：设置质量矩阵，用ode15s函数
%===============================
M = [1 0 0;0 1 0;0 0 0];%质量矩阵
options = odeset('mass',M);
%被ode15s调用的微分函数表达式
    function DyDt = DyDtNestedFun2(t,y)
        DyDt = [-0.2*y(1)+y(2)*y(3)+0.3*y(1)*y(2);
            2*y(1)*y(2)-5*y(2)*y(3)-2*y(2)^2;
            y(1)+y(2)+y(3)-1];
    end
[T2,Y2] = ode15s(@DyDtNestedFun2,tspan,y0,options);
%===============================
%方法3：用ode15i函数
%===============================
%被ode15i调用的微分函数表达式
    function DyDt = DyDtNestedFun3(t,y,dy)
        DyDt = [dy(1)+0.2*y(1)-y(2)*y(3)-0.3*y(1)*y(2);
            dy(2)-2*y(1)*y(2)+5*y(2)*y(3)+2*y(2)^2;
            y(1)+y(2)+y(3)-1];
    end
%y(1)+y(2)+y(3)-1=0 表明y0中任何一个改变后都会至少引起其余一个发生变化，因此
y0_fix = [0;0;1];%任意两位位都可以改为0，比如[0;1;0]或者[1;0;0]
%状态变量一阶微分初值，例子中没有提供，因此可以随意猜测一组值
dy0 = [1;1;1];
%该组初值都可以改变，故全部为0
dy0_fix = [0;0;0];
%时间变量的初值
t0 = 0;
%计算输入到ode15i解算器的dy以及dy3
[y00,dy00] = decic(@DyDtNestedFun3,0,y0,y0_fix,dy0,dy0_fix);
[T3,Y3] = ode15i(@DyDtNestedFun3,tspan,y00,dy00);
%=========================
%画图呈现三个方法计算结果
%=========================
figure;
%方法1得到的图
subplot(131);
plot(T1,Y1(:,1),'k-','linewidth',2);
hold on
plot(T1,Y1(:,2),'k-.','linewidth',2);
plot(T1,1-Y1(:,1)-Y1(:,2),'k:','linewidth',2);
hold off
%图例,位置自动选择最佳位置
L = legend('{\ity}_1(t)','{\ity}_2(t)','{\ity}_3(t)','Location','best');
set(L,'fontname','Times New Roman');
xlabel('\itt','fontsize',16);title('方法1计算结果图')
%方法2得到的图
subplot(132);
plot(T2,Y2(:,1),'k-','linewidth',2);
hold on
plot(T2,Y2(:,2),'k-.','linewidth',2);
plot(T2,Y2(:,3),'k:','linewidth',2);
hold off
L = legend('{\ity}_1(t)','{\ity}_2(t)','{\ity}_3(t)','Location','best');
set(L,'fontname','Times New Roman');
xlabel('\itt','fontsize',16);title('方法2计算结果图')
%方法3得到的图
subplot(133);
plot(T3,Y3(:,1),'k-','linewidth',2);
hold on
plot(T3,Y3(:,2),'k-.','linewidth',2);
plot(T3,Y3(:,3),'k:','linewidth',2);
hold off
L = legend('{\ity}_1(t)','{\ity}_2(t)','{\ity}_3(t)','Location','best');
set(L,'fontname','Times New Roman');
xlabel('\itt','fontsize',16);title('方法3计算结果图')
end
