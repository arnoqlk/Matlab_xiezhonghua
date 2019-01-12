function Nestedfun4ode(a)
tspan = [0,5];     %变量求解区间
y0 = [1,0];       %初值
[t,y] = ode45(@tfys,tspan,y0);         %调用ode45求解方程
figure;
plot(t,y(:,1),'k-');             %画函数y(t)的曲线
hold on;
plot(t,y(:,2),'k:');            %画函数y(t)导数的曲线
set(gca,'fontsize',12);          %设置当前坐标轴字体大小
xlabel('\itt','fontsize',16);        %标注x轴
%用嵌套函数定义微分方程组
    function dy = tfys(t,y)
        dy(1,1) = y(2);          %对应于例子中方程组第一个方程
        dy(2,1) = 3*sin(a*t)-4*y(1);              %对应于例子中方程组第二个方程
    end
end
