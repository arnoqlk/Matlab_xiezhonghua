function examp12_5_3
X = linspace(0,pi,10); %为bvpinit生成初始化网络准备
q = 5;
lambda = 15;%对lambda的猜测值
    function yinit = mat4init(x)
        %对y初值的估计函数,由于y2(0) = 1,y2(pi) = 0;所以挑选一个满足上述条件的函数
        %这里选择的是-k*sin(4*x)来作为对y2(t)的估计，其原函数y1(t)满足y1(0)=1，因此
        %k = 4，所以y1(t)的估计为cos(4*x),y2(t)的估计为-4*sin(4*x)
        yinit = [   cos(4*x)
            -4*sin(4*x) ];
    end
    function res = mat4bc(ya,yb,lambda)
        %lambda作为未知参数不能省略
        %边界条件;边界条件为y1(0) = 1,y2(0) = 2,y2(pi) = 0; 0,0,pi分别对应ya,ya,yb
        %而y1,y2,y2分别是第一第二第二个状态变量。因此得到如下res表达式
        res = [ya(1)-1;
            ya(2);
            yb(2)
            ];
    end
    function dydx = mat4ode(x,y,lambda)
        %微分方程函数
        dydx = [  y(2);
            -(lambda - 2*q*cos(2*x))*y(1) ];
    end
solinit = bvpinit(X,@mat4init,lambda);%由bvpinit生成的初始化网格
sol = bvp4c(@mat4ode,@mat4bc,solinit);%调用bvp4c求解,也可以换成bvp5c
tint = linspace(0,pi);
Stint = deval(sol,tint);%根据得到的sol利用deval函数求出[0,4]区间内更多其他的解
%画图展示
figure;
plot(tint,Stint(1,:),'k-','linewidth',2);
hold on
plot(tint,Stint(2,:),'k:','linewidth',2);
L = legend('{\ity}_1(t)','{\ity}_2(t)','Location','best');
set(L,'fontname','Times New Roman');
xlabel('\itt','fontsize',16);ylabel('方程的解');
title('方程的解y_1(t)为Mathieu方程的特征函数')
end
