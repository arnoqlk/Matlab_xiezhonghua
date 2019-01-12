function T0 = examp12_2_3
%用nested function 表示微分方程
    function dy = DyDxNestedFun(t,y)
        ft = 0;
        gt = 0;
        if t<4*pi
            ft = 2*sin(t);
        end
        if t>3.5*pi
            gt = cos(t);
        end
        dy = [y(2)-ft;y(1)*gt-y(2)];
    end
tspan = [0,20];%变量求解区间
y0 = [1,2];%初值
sol = ode23tb(@DyDxNestedFun,tspan,y0);%调用ode23tb求解
subplot(121);
plot(sol.x,sol.y(1,:),'k-','linewidth',2);%画出函数y1(t)曲线
hold on;
plot(sol.x,sol.y(2,:),'k-.','linewidth',2);%画出函数y2(t)曲线
hold off;
%图例，图例位置自动选择最佳位置
L1 = legend('{\ity}_1(t)','{\ity}_2(t)','Location','best'); 
set(L1,'fontname','Times New Roman');
xlabel('\itt','fontsize',16);
subplot(122);
plot(sol.x,sum(sol.y),'linewidth',2);hold on;
plot([0,20],[0 0],'color','r','linestyle',':','linewidth',2);
xlabel('\itt','fontsize',16);
%图例，图例位置自动选择最佳位置
L2 = legend('F(t) = {\ity}_1(t) + {\ity}_2(t)','y = 0直线','Location','best'); 
set(L2,'fontname','Times New Roman');
hold off;
%以下代码利用arrayfun+fzero+deval实现求F(t)的所有零点
T0 = arrayfun(@(t0) fzero(@(t) sum(deval(sol,t)),t0),[2 4 6 10 18]);
end
