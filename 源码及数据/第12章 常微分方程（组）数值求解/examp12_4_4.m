function examp12_4_4
    function v = ddex3hist(t)
        %历史函数
        v = [ log(t); 1./t];
    end
    function d = ddex3delay(t,y)
        %延迟函数
        d = exp(1 - y(2));
    end
    function dydt = ddex3de(t,y,Z)
        %延迟微分方程函数.由于只有一个延迟项，因此Z为1列的向量，y2(exp(1-y2(t)))延迟
        %了exp(1-y2(t))，而y2又是第二个状态变量，因此y2(exp(1-y2(t)))用Z(2)来表示
        dydt = [ y(2); -Z(2)*y(2)^2*exp(1 - y(2))];
    end
t0 = 0.1;
tfinal = 5;
tspan = [t0, tfinal];%求解时间范围
sol = ddesd(@ddex3de,@ddex3delay,@ddex3hist,tspan);
%准确解
texact = linspace(t0,tfinal);
yexact = ddex3hist(texact);
%以下画图呈现结果
figure;
plot(sol.x,sol.y(1,:),'o','markersize',7);
hold on
plot(sol.x,sol.y(2,:),'*','markersize',7);
plot(texact,yexact(1,:),'k-','linewidth',2);
plot(texact,yexact(2,:),'k:','linewidth',2);
%图例,位置自动选择最佳位置
L = legend('{\ity}_1,ddesd','{\ity}_2,ddesd','{\ity}_1,解析解',...
    '{\ity}_2,解析解','Location','best');
set(L,'fontname','Times New Roman');
hold off
xlabel('\fontname{隶书}时间t','fontsize',16);
ylabel('\fontname{隶书}y的解','fontsize',16);
title('ddesd求解和解析解对比图');
end
