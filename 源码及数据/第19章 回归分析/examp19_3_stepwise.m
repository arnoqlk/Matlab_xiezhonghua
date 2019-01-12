%--------------------------------------------------------------------------
%            读取原始数据，调用stepwise函数作交互式逐步回归分析
%--------------------------------------------------------------------------

%% 线性模型
xydata = xlsread('examp19_3_1.xls');
y = xydata(:, 2);
X = xydata(:, 3:7);
inmodel = 1:5;
stepwise(X,y,inmodel);


%% 广义线性模型
xydata = xlsread('examp19_3_1.xls');
y = xydata(:, 2);
x1 = xydata(:, 3);
x2 = xydata(:, 4);
x3 = xydata(:, 5);
x4 = xydata(:, 6);
x5 = xydata(:, 7);

X = [x1,x2,x3,x4,x5,x1.*x2,x2.*x3,x2.*x5,x4.^2,log(x2),sqrt(x5)];
inmodel = 1:size(X,2);
stepwise(X,y,inmodel);
