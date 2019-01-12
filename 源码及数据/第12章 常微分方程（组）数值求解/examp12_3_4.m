function examp12_3_4
% nested function构造微分方程组，注意多了一个一阶导数变量dy(与非隐式微分方程不同)
    function DyDt = DyDtNestedFun(t,y,dy)
        DyDt = [dy(1)-y(2);
            dy(2)*sin(y(4))+dy(4)^2+2*y(1)*y(3)-y(1)*dy(2)*y(4)
            dy(3)-y(4)
            y(1)*dy(2)*dy(4)+cos(dy(4))-3*y(3)*y(2)];
    end
t0 = 0;%自变量的初值
y0 = [1;0;0;1];%初值y0
%fix_y0表明初值y0的值哪些不能改变。1表示对应位置初值不能改变，0为可以改变
fix_y0 = ones(4,1);%本例中y0的值都给出了，因此都不能改变，所有fix_y0全为1
dy0 = [0 3 1 0]';%猜测一下dy0的初值;
fix_dy0 = zeros(4,1);%由于本例中dy0的初值是猜测的，可以都改变，因此fix_dy0 全部为0
%调用decic函数来决定
[y02,dy02] = decic(@DyDtNestedFun,t0,y0,fix_y0,dy0,fix_dy0);
%求解微分方程
[t y] = ode15i(@DyDtNestedFun,[0 5],y02,dy02);%y02和dy02是由decic输出参数
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
