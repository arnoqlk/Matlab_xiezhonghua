function examp12_3_2
% nested function数构造微分方程，利用fzero求解隐微分方程输出项
    function DyDt = DyDtNestedFun(t,y)
        fun = @(yp) yp - exp(-(( y-0.5-exp(-t+yp))^2 + y^2-t/5+3));
        DyDt = fzero(fun,3);
    end
tspan = [0,20];%时间区间
y0 = 0.1;
[t y] = ode45(@DyDtNestedFun,tspan,y0);
figure;
plot(t,y,'k-','linewidth',2);
xlabel('\itt','fontsize',16);
end
