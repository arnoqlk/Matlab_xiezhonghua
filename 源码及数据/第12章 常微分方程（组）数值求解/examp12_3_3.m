function examp12_3_3
% nested function构造微分方程组，利用fsolve求解隐微分方程组某些输出项
    function DyDt = DyDtNestedFun(t,y)
        fun = @(dy24)[dy24(1)*sin(y(4))+dy24(2)^2+2*y(1)*y(3)-y(1)*dy24(1)*y(4);
            y(1)*dy24(1)*dy24(2)+cos(dy24(2))-3*y(2)*y(3)];
        options = optimset('display','off');
        %使用fsolve求解出与原问题对应的x''和y''
        dy24Zero = fsolve(fun,y([1,3]),options);
        DyDt = [y(2);dy24Zero(1);y(4);dy24Zero(2)];%状态变量一阶微分值
    end
tspan = [0,5];%时间区间
y0 = [1 0 0 1]';
[t y] = ode45(@DyDtNestedFun,tspan,y0);
%画图结果展示
figure;
plot(t,y(:,1),'k-','linewidth',2);
hold on
plot(t,y(:,2),'k--','linewidth',2);
plot(t,y(:,3),'k-.','linewidth',2);
plot(t,y(:,4),'k:','linewidth',2);
%图例,位置自动选择最佳位置
L = legend('{\ity}_1(t)','{\ity}_2(t)','{\ity}_3(t)'...
    ,'{\ity}_4(t)','Location','best');
set(L,'fontname','Times New Roman');
xlabel('\itt','fontsize',16);
end
