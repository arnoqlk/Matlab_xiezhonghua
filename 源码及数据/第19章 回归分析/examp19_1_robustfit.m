%--------------------------------------------------------------------------
%             读取原始数据，调用robustfit函数作稳健回归
%--------------------------------------------------------------------------

%*****************************读取数据**************************************
ClimateData = xlsread('examp19_1_1.xls');
x = ClimateData(:, 1);
y = ClimateData(:, 5);

%************************调用robustfit函数作稳健回归*************************
[b, stats] = robustfit(x, y)

stats.p


%**************************绘制残差和权重的散点图****************************
figure;
plot(stats.resid,  stats.w, 'o')
xlabel('残差')
ylabel('权重')


%***************绘制regress函数和robustfit函数对应的回归直线*****************
[xsort, id] = sort(x);
ysort = y(id);
xdata = [ones(size(xsort, 1), 1), xsort];
b1 = regress(ysort, xdata);
yhat1 = xdata*b1;

b2 = robustfit(xsort, ysort);
yhat2 = xdata*b2;
plot(x, y, 'ko')
hold on
plot(xsort, yhat1, 'r--','linewidth',3)
plot(xsort, yhat2, 'linewidth', 3)
% 为图形加标注框
legend('原始数据散点','regress函数对应的回归直线','robustfit函数对应的回归直线');
xlabel('年平均气温(x)')
ylabel('全年日照时数(y)')