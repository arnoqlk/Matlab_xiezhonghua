%--------------------------------------------------------------------------
%  第16章  概率分布与随机数
%--------------------------------------------------------------------------

%% examp16.1-1
x = 0:10;    %产生一个向量
Y = normpdf(x, 1.2345, 6)
P = normcdf(x, 1.2345, 6)

%% examp16.1-2
u = norminv(1-0.05, 0, 1)
t = tinv(1-0.05, 50)
chi2 = chi2inv(1-0.025, 8)
f1 = finv(1-0.01, 7, 13)
f2 = finv(1-0.99, 13, 7)

%% examp16.2-1
x = rand(10)
y = x(:);
hist(y)
xlabel('[0,1]上均匀分布随机数');
ylabel('频数');

rand('twister',1);
x1 = rand(2,6)
x2 = rand(2,6)
rand('twister',1)
x3 = rand(2,6)

%% examp16.2-2
x = normrnd(75, 8, 1000, 3);
hist(x) 
xlabel('正态分布随机数（\mu = 75,  \sigma = 8）');
ylabel('频数');
legend('第一列', '第二列', '第三列')

%% examp16.2-3
x = normrnd(repmat([0 15 40], 1000, 1), repmat([1 2 3], 1000, 1), 1000, 3);
hist(x, 50)
xlabel('正态分布随机数');
ylabel('频数');
legend('\mu = 0,  \sigma = 1','\mu = 15,  \sigma = 2','\mu = 40,  \sigma = 3')

%% examp16.2-4
x = random('bino', 10, 0.3, 10000, 1);
[fp, xp] = ecdf(x);
ecdfhist(fp, xp, 50);
xlabel('二项分布（n = 10, p = 0.3）随机数');
ylabel('f(x)');

%% examp16.2-5
x = random('chi2', 10, 10000, 1);
[fp, xp] = ecdf(x);
ecdfhist(fp, xp, 50);
hold on
t = linspace(0, max(x), 100);
y = chi2pdf(t, 10);
plot(t, y, 'r', 'linewidth', 3) 
xlabel('x  ( \chi^2(10) )');
ylabel('f(x)');
legend('频率直方图', '密度函数曲线')

%% examp16.2-6
xvalue = [-2 -1 0 1 2];
xp = [0.05 0.2 0.5 0.2 0.05];
x = randsample(xvalue, 100, true, xp);
reshape(x,[10, 10])
tabulate(x)

%% examp16.2-7
xvalue = 'ABCDE';
xp = [0.05 0.2 0.5 0.2 0.05];
x = randsample(xvalue, 100, true, xp);
reshape(x,[4, 25])
tabulate(x')

%% examp16.2-6续
DistributionList = [-2,-1,0,1,2;0.05,0.2,0.5,0.2,0.05];
x = randsrc(10,10,DistributionList)
tabulate(x(:))

%% examp16.2-8
x = randint(10,10,[0,10])
tabulate(x(:))

%% examp16.3-1
n = 100;
p = [0.2  0.3  0.5];
r = mnrnd(n, p, 10)

r = mnrnd(n, p, 10000);
hist3(r(:,1:2),[50,50])
xlabel('X_1')
ylabel('X_2')
zlabel('频数')

%% examp16.3-2
mu = [10  20];
sigma = [1  3; 3  16];
xy = mvnrnd(mu, sigma, 10000);
hist3(xy, [15, 15]);
xlabel('X')
ylabel('Y')
zlabel('频数')