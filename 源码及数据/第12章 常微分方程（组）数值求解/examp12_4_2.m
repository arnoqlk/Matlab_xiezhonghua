function examp12_4_2
y01 = [1;0.5;0.3];%第一种方法的初值（第一方法只需要用到三个变量）
y0 = [1;0.5;0.3;0.2];%初值
tspan = [0 5];
%===============================
%方法1：变量替换后用fsolve函数
%===============================
%将y(4)用y(1)+y(2)-y(3)-1代替
     function DyDt = DyDtNestedFun1(t,y)
        fun = @(dy)[dy(1)+0.3*y(1)+2*y(2)*sin(dy(3))+y(2)*(y(1)+y(2)-y(3)-1);
            dy(2)+y(2)+0.5*cos(dy(1)+y(3))+0.2*sin(0.6*t);
            dy(3)+0.2*y(1)*y(2)-exp(-dy(1))];
        options = optimset('display','off','TolX',1e-8,'TolFun',1e-8);
        %使用fsolve求解出与原问题对应的和y1',y2',y3'
        DyDt = fsolve(fun,y,options);%状态变量一阶微分值 
        end
[T1,Y1] = ode45(@DyDtNestedFun1,tspan,y01);
%===============================
%方法2：用ode15i函数
%===============================
%被ode15i调用的微分函数表达式
    function DyDt = DyDtNestedFun2(t,y,dy)
        DyDt = [dy(1)+0.3*y(1)+2*y(2)*sin(dy(3))+y(2)*y(4);
            dy(2)+y(2)+0.5*cos(dy(1)+y(3))+0.2*sin(0.6*t);
            dy(3)+0.2*y(1)*y(2)-exp(-dy(1));
            y(1)+y(2)-y(3)-y(4)-1];
    end
%y(1)+y(2)-y(3)-y(4)-1=0 表明y中任何一个改变后都会至少引起其余一个发生变化，因此
y0_fix = [0;1;0;0];%任意三位都可以改为0，比如[0;0;1;0]或者[1;0;0;0]等
%状态变量一阶微分初值，例子中没有提供，因此可以猜测一组值，可能需要猜测好几回才能保证
%不提示“Convergence failure in DECIC.”错误
dy0 = [-1;-1;2.5;0.5];
%该组初值都可以改变，故全部为0
dy0_fix = [0;0;0;0];
%时间变量的初值
t0 = 0;
%计算输入到ode15i解算器的dy以及dy3
[y00,dy00] = decic(@DyDtNestedFun2,0,y0,y0_fix,dy0,dy0_fix);
[T2,Y2] = ode15i(@DyDtNestedFun2,tspan,y00,dy00);
%=========================
%画图呈现三个方法计算结果
%=========================
figure;
%方法1得到的图
subplot(121);
plot(T1,Y1(:,1),'k-','linewidth',2);
hold on
plot(T1,Y1(:,2),'k-.','linewidth',2);
plot(T1,Y1(:,3),'k-*','linewidth',1);
plot(T1,Y1(:,1)+Y1(:,2)-Y1(:,3)-1,'k-o','linewidth',1);
hold off
%图例,位置自动选择最佳位置
L = legend('{\ity}_1(t)','{\ity}_2(t)','{\ity}_3(t)',...
    '{\ity}_4(t)','Location','best');
set(L,'fontname','Times New Roman');
xlabel('\itt','fontsize',16);title('方法1计算结果图')
%方法2得到的图
subplot(122);
plot(T2,Y2(:,1),'k-','linewidth',2);
hold on
plot(T2,Y2(:,2),'k-.','linewidth',2);
plot(T2,Y2(:,3),'k-*','linewidth',1);
plot(T2,Y2(:,4),'k-o','linewidth',1);
hold off
L = legend('{\ity}_1(t)','{\ity}_2(t)','{\ity}_3(t)',...
    '{\ity}_4(t)','Location','best');
set(L,'fontname','Times New Roman');
xlabel('\itt','fontsize',16);title('方法2计算结果图')
end
