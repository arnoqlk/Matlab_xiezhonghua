function examp12_4_3
lags = [1,3];%延迟常数向量
history = [0,0,1];%小于初值时的历史函数
tspan = [0,8];
%用nested function构造延迟微分方程组函数
    function dy = ddefunNestedFun(t,y,Z)
        y1d = Z(:,1);%对所有延迟为lags(1)的状态变量的近似
        y3d = Z(:,2);%对所有延迟为lags(2)的状态变量的近似
        %y3(t-3)的时间延迟了lags(2),而y3又是第三个状态变量，因此y3(t-3)用y3d(3)来表示
        %同理，y1(t-1)用y1d(1)来表示。因此得到dy的如下表达式
        dy = [0.5*y3d(3)+0.5*y(2)*cos(t);
            0.3*y1d(1)+0.7*y(3)*sin(t);
            y(2)+cos(2*t)];
    end
sol = dde23(@ddefunNestedFun,lags,history,tspan);%调用dde23求解
%以下画图呈现结果
plot(sol.x,sol.y(1,:),'k-','linewidth',2);
hold on
plot(sol.x,sol.y(2,:),'k-.','linewidth',2);
plot(sol.x,sol.y(3,:),'k-*','linewidth',1);
hold off
%图例,位置自动选择最佳位置
L = legend('{\ity}_1(t)','{\ity}_2(t)','{\ity}_3(t)','Location','best');
set(L,'fontname','Times New Roman');
xlabel('\itt','fontsize',16);title('方程各解的曲线图')
end
