function examp12_5_1
T = linspace(0,4,10); %为bvpinit生成初始化网络准备
    function yinit = mat4init(t)
        %对y初值的估计函数,由于y1(0) = 1,y1(4) = 2;所以挑选一个满足上述条件的函数
        %这里选择的是1+t/4来作为对y1(t)的估计，从而其导数1/4作为对y2(t)的估计
        yinit = [  1+t/4;
            1/4 ];
    end
    function res = mat4bc(ya,yb)
        %边界条件;边界条件为y1(0) = 1,y1(4) = 2; 0,4分别对应ya,yb边界两端，而y1,y1
        %对应的都是第一个状态变量，因此是ya(1)-1,yb(1)-2;
        res = [  ya(1)-1
            yb(1)-2];
    end
    function dydx = mat4ode(t,y)
        %微分方程函数        
        dydx = [  y(2)
             2*y(2)*cos(t)-y(1)*sin(4*t)-cos(3*t) ];
    end
solinit = bvpinit(T,@mat4init);%由bvpinit生成的初始化网格
sol = bvp4c(@mat4ode,@mat4bc,solinit);%调用bvp4c求解,也可以换成bvp5c
tint = linspace(0,4);
Stint = deval(sol,tint);%根据得到的sol利用deval函数求出[0,4]区间内更多其他的解
%画图展示
figure;
plot(tint,Stint(1,:),'k-','linewidth',2);
hold on
plot(tint,Stint(2,:),'k:','linewidth',2);
L = legend('{\ity}_1(t)','{\ity}_2(t)','Location','best');
set(L,'fontname','Times New Roman');
xlabel('\itt','fontsize',16);ylabel('方程的解');
title('求解结果')
end
