function examp12_2_1
close all;
%利用nested function形式来表示微分方程
    function ydot = DyDtNestedFun(t,y)
        ydot = [y(2);mu*(1-y(1)^2)*y(2)-y(1)];
    end
%利用匿名函数形式来表示微分方程
DyDtAnony = @(mu)@(t,y)[y(2);mu*(1-y(1)^2)*y(2)-y(1)];
%以下代码对mu = 1，2，3分别求解微分方程，并画出微分方程的解
tspan = [0,30];%时间区间
y0 = [1 0];
figure(1);h1 = axes;hold on;
figure(2);g1 = axes;hold on;
ColorOrder = get(gca,'ColorOrder');%默认的坐标轴曲线颜色顺序
%曲线类型顺序，方便成书时区分显示不同线
LineStyle = { '-','--',':'};
for mu = 1:3
    %利用ode45求解微分方程（输入微分方程组是nested function形式表示的）
    [tt yy] = ode45(@DyDtNestedFun,tspan,y0);
    %在句柄值为h1的坐标轴上根据不同的mu画相应的解曲线
    plot(h1,tt,yy(:,1),'color',ColorOrder(mu,:),'LineStyle',LineStyle{mu});
    %在句柄值为g1的坐标轴上根据不同的mu画相应的平面相轨迹
    plot(g1,yy(:,1),yy(:,2),'color',ColorOrder(mu,:),'LineStyle',LineStyle{mu});
end
xlabel(h1,'t');%在句柄值为h1的坐标轴的x轴上标注
title(h1,'x(t)');
legend('\mu = 1','\mu = 2','\mu = 3');hold off
xlabel(g1,'位移');ylabel(g1,'速度');hold off
%下面利用ode45求解微分方程（输入的微分方程组是匿名函数形式表示的）
figure(3);h2 = axes;hold on;
figure(4);g2 = axes;hold on;
for mu = 1:3
    [tt yy] = ode45(DyDtAnony(mu),tspan,y0);
    plot(h2,tt,yy(:,1),'color',ColorOrder(mu,:),'LineStyle',LineStyle{mu});
    plot(g2,yy(:,1),yy(:,2),'color',ColorOrder(mu,:),'LineStyle',LineStyle{mu});
end
xlabel(h2,'t');
title(h2,'x(t)');
legend('\mu = 1','\mu = 2','\mu = 3');hold off
xlabel(g2,'位移');ylabel(g2,'速度');hold off
end
