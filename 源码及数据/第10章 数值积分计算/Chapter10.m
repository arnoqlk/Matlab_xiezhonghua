%--------------------------------------------------------------------------
%  第10章  数值积分计算
%--------------------------------------------------------------------------

%% examp10.1-2
format long
f = @(x,y) x.^2+y.^2;
a1 = dblquad(f,0,1,0,1)
a2 = quad2d(f,0,1,0,1)

%% examp10.1-3
f = @(x,y,z) x.^2+y.^2+z.^2;
a = triplequad(f,0,1,0,1,0,1)

%% examp10.1-4
format long
f = @(x,n) besselk(0,(1:n).^2*x.^0.5+1);%构造被积函数匿名函数句柄
sf = quadv(@(x)f(x,10),0,1)%quadv的调用示例

%% examp10.1-5
x = 0:pi/100:pi/2;
y = sin(x);
Intyx = trapz(x,y)%利用离散数据积分
Intyx2 = quadl(@sin,0,pi/2)%对sin(x)进行0到pi/2的积分
TrueValue = int(sym('sin(x)'),0,pi/2)%利用符号计算求真值

%% examp10.1-6
x = linspace(0,pi/2);
y = linspace(0,2*pi);
[X Y] = meshgrid(x,y);
f = cos(X).*sin(Y);
p = cos(x);
q = sin(y);

Fx = zeros(size(x));
for k = 1:length(x)
    Fx(k) = trapz(y,f(:,k)'.*p(k).*q);
end
format long
trapz(x,Fx)
dblquad(@(x,y) cos(x).*sin(y).*cos(x).*sin(y),0,pi/2,0,2*pi)

%% examp10.3-1
tic,y1 = dblquad(@(x,y) sqrt(10^4-x.^2).*(x.^2+y.^2<=10^4),...
-100,100,-100,100 ),toc

tic,y2 = quad2d(@(x,y) sqrt(10^4-x.^2),-100,100,...
@(x)-sqrt(10^4-x.^2),@(x)sqrt(10^4-x.^2)),toc

%% examp10.3-2
syms x y
int(int(x*y,y,sin(x),cos(x)),1,2)
vpa(ans,20)

quad2d(@(x,y) x.*y,1,2,@(x)sin(x),@(x)cos(x),'AbsTol',1e-12)
quadl(@(x) arrayfun(@(xx) quadl(@(y) xx*y,sin(xx),cos(xx)),x),1,2)

%% examp10.3-3
tic,y1 = quad2d(@(x,y) exp(sin(x)).*log(y),10,20,@(x)5*x,@(x)x.^2),toc

tic,y2 = quadl(@(x) arrayfun(@(x) quadl(@(y) exp(sin(x)).*log(y),...
5*x,x.^2),x),10,20),toc

tic,y3 = dblquad(@(x,y) exp(sin(x)).*log(y).*(y>=5*x & y<=x.^2),10,20,50,400),toc

%% examp10.3-4
f1 = quadl(@(y) 2*y.*exp(-y.^2).*arrayfun(@(y)quadl(@(x) exp(-x.^2)./...
 (y.^2+x.^2),-1,1),y).^2,0.2,1)

%% examp10.4-1
fun = 'exp(x1*x2*x3*x4)';
%由于各层积分上下限都是常数，为了和程序中要求的保持一致，积分上下限函数可以写成如下形式，当然还可
%以写成任意满足程序要求的形式，譬如up = {'1','0*x1+1','0*(x1+x2)+1','0*(x1*x2-x3)+1'};
%等等
up = {'1','0*x1+1','0*x2+1','0*x3+1'};
low = {'0','0*x1','0*x2', '0*x3'};
format long
f = nIntegrate(fun,low,up)
%和真实值比较
syms x1 x2 x3 x4
double(int(int(int(int(exp(x1*x2*x3*x4),x4,0,1),x3,0,1),x2,0,1),x1,0,1))

%% examp10.4-2
fun = 'x1*x2*x3';
up = {'2','2*x1','2*x1*x2'};
low = {'1','x1','x1*x2'};
f = nIntegrate(fun,low,up)

%% examp10.4-3
fun4 = 'sqrt(x1*x2)*log(x3)+sin(x4/x2)'%构造被积函数字符表达式
up4 = {'2','3*x1','2*x1*x2','x1+2*x1*x3+0*x2'}%积分上限函数字符表达式
low4 = {'1','x1','x1*x2','x1+x1*x3+0*x2'}%积分下限函数字符表达式
f = nIntegrate(fun4,low4,up4)

%% examp10.4-4
fun5 = 'sin(x1*exp(x2*sqrt(x3)))+x4^x5'
up5 = {'1','exp(x1)','x1+sin(x2)','x1+x3','2*x4'}
low5 = {'0','exp(x1)/2','x1/2+sin(x2)/2','x1/2+x3/2','x4'}
f = nIntegrate(fun5,low5,up5)

%% examp10.5-1
%构造被积函数，x为长为4的行向量或者矩阵（列数为4）。x的每一行表示4维空间中的一个点
f = @(x) exp(prod(x,2));
n = 10000;
X = rand(n,4);%随机生成n个4维单位超立方体内的点
format long
I = sum(f(X))/n %用基本的蒙特卡洛法估计积分值

%% examp10.5-2
%构造被积函数，x为长为3的列向量或者矩阵（行数为3）。x的每一列表示s维空间中的一个点
f = @(x) prod(x);
n = 100000;
%随机均匀生成空间中包含积分区域的长方体内的点
x1 = unifrnd(1,2,1,n);
x2 = unifrnd(1,4,1,n);
x3 = unifrnd(1,16,1,n);
ind = (x2>=x1)&(x2<=2*x1)&(x3>x1.*x2)&(x3<2*x1.*x2);
X = [x1;x2;x3];
format long
I = (4-1)*(16-1)*sum(f(X(:,ind)))/n %用基本的蒙特卡洛法估计积分值

%% examp10.5-3
%构造被积函数，x为长为4的列向量或者矩阵（行数为4）。x的每一列表示4维空间中的一个点
f = @(x) exp(prod(x));
n = 10000;
%选取对有理数独立的无理数sqrt(2),sqrt(3),sqrt(6)/3,sqrt(10)来生成等分布序列
x = bsxfun(@times,repmat(1:n,4,1),[sqrt(2);sqrt(3);sqrt(6)/3;sqrt(10)]);
x = mod(x,1);
format long
I = sum(f(x))/n %用基本的蒙特卡洛法估计积分值

%% examp10.5-4
% +++++++++++++++++++++++++等序列的蒙特卡洛法+++++++++++++++++++++++++++++++
clear
format long
%构造被积函数
f = @(x) sin(x(1,:).*exp( x(2,:).*sqrt(x(3,:)) ))+x(4,:).^x(5,:);
n = 1000000;
%选取对有理数独立的无理数sqrt(2),sqrt(3),sqrt(6)/3,sqrt(10)来生成等分布序列
x = bsxfun(@times,repmat(1:n,5,1),[sqrt(2);sqrt(3);sqrt(6)/3;sqrt(10);sqrt(19)]);
x = mod(x,1);
%进行变换，使得区间(0,1)上的等分布序列变到各层积分区间上去
BminusA = diff([0.5 sin(exp(1))/2 sin(exp(1))/4 sin(exp(1))/4;exp(1) 2 3 6])';
x(2:end,:) = bsxfun(@times,x(2:end,:),BminusA);
x(2:end,:) = bsxfun(@plus,x(2:end,:),[0.5;sin(exp(1))/4*[2;1;1]]);
%判断哪些点落入积分区域
ind = ( x(2,:)>=exp(x(1,:))/2 )&( x(2,:)<=exp(x(1,:)) )&...
( x(3,:)>=(sin(x(2,:))+x(1,:))/2 )&( x(3,:)<=(sin(x(2,:))+x(1,:)))&...
( x(4,:)>=(x(1,:)+x(3,:))/2 )&( x(4,:)<=x(1,:)+x(3,:) )&...
( x(5,:)>=x(4,:) )&(x(5,:)<=2*x(4,:));
%求近似积分
I1 = (exp(1)-0.5)*(2-sin(exp(1))/2)*(3-sin(exp(1))/4)*(6-sin(exp(1))/4)*...
    sum(f(x(:,ind)))/n

% ++++++++++++++++++++++++++ 一般的蒙特卡洛法+++++++++++++++++++++++++++++++
clear
format long
%构造被积函数
f = @(x) sin(x(1,:).*exp( x(2,:).*sqrt(x(3,:)) ))+x(4,:).^x(5,:);
n = 1000000;
%生成超长方体内的随机数
x(1,:) = rand(1,n);
x(2,:) = unifrnd(0.5,exp(1),1,n);
x(3,:) = unifrnd(sin(exp(1))/2,2,1,n);
x(4,:) = unifrnd(sin(exp(1))/4,3,1,n);
x(5,:) = unifrnd(sin(exp(1))/4,6,1,n);
%判断哪些点落入积分区域
ind = ( x(2,:)>=exp(x(1,:))/2 )&( x(2,:)<=exp(x(1,:)) )&...
( x(3,:)>=(sin(x(2,:))+x(1,:))/2 )&( x(3,:)<=(sin(x(2,:))+x(1,:)))&...
( x(4,:)>=(x(1,:)+x(3,:))/2 )&( x(4,:)<=x(1,:)+x(3,:) )&...
( x(5,:)>=x(4,:) )&(x(5,:)<=2*x(4,:));
%求近似积分
I2 = (exp(1)-0.5)*(2-sin(exp(1))/2)*(3-sin(exp(1))/4)*(6-sin(exp(1))/4)*...
    sum(f(x(:,ind)))/n