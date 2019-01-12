%--------------------------------------------------------------------------
%  第9章  符号计算
%--------------------------------------------------------------------------

%% examp9.1-1
a = sym('5');
b = sym('b');
syms c d e;
whos
a^100

%% examp9.1-2
syms x
f = sin(x^x/x^2/exp(x));
d2f = diff(f,x,2);%利用符号计算求f(x)的二阶导数
%第一种方法：利用subs函数求d2f在x=1时的值。
d2fx1 = subs(d2f,x,1)
%第二种方法：x赋值1后，利用eval函数求d2f在x = 1时的值
x = 1;
eval(d2f)
%第三种方法：将d2f转化成匿名函数，求其在x = 1时的值
F = eval(['@(x)',vectorize(char(d2f))]);
F(1)

%% examp9.2-1
syms n
limit(n^(n+1/2)/(exp(n)*gamma(n+1)),n,inf)

%% examp9.2-2
syms a t x;
f = [a,t*log(x);sqrt(t),x^2+3*x];
dfdt = diff(f,t)%矩阵f对t的一阶导数
dfdx2 = diff(f,2)%矩阵f对x的二阶导数，由于是x，而f中含有x变量，故x可以省略
dfdtdx = diff(diff(f,t),x)%求二阶混合导数

%% examp9.2-3
syms x1 x2 x3;
f = [x1*(exp(x2)+exp(x3));x1+x2;log(x1)*x2/sin(x3)];
v = [x1 x2 x3];
jac = jacobian(f,v)

%% examp9.2-4
syms k
f1 = symsum((k-2)/2^k,k,3,inf)
A = [1/(2*k+1)^2,(-1)^k/3^k];
f2 = symsum(A,k,1,inf)

%% examp9.2-5
syms x
s = int(1/(x*sqrt(x^2+1)),x)

%% examp9.2-6
syms x u v
f = [x*v v^2;sin(u)*v cos(u*x)];
intfu = int(f,u)
intf = int(f)

%% examp9.2-7
syms x y z
Result = int(int(int((x+y)/z,z,x*y,2*x*y),y,x,2*x),1,2)
double(Result) %转化成数值

%% examp9.3-1
x=solve('2*sin(3*x-pi/4)=1')                  %解第一个方程
x=solve('x+x*exp(x)-10') %解第二个方程
double(x) %将符号解形式抓化成数值解

%% examp9.3-2
[x y]=solve('1/x^3+1/y^3-28','1/x+1/y-4','x,y')

%% examp9.3-3
[x y] = solve('x+y-98','x^(1/3)+y^(1/3)-2','x,y')

[u v] = solve('u^3+v^3-98','u+v-2','u,v')
x = u.^3
y = v.^3

%% examp9.3-4
S = dsolve('Dx = y,Dy = -x')
S.x
S.y

%% examp9.3-5
y = dsolve('y = x*Dy - (Dy)^2','x')%注意书写规则，本例需要制定独立变量为x
%利用str2func函数转化符号表达式为匿名函数,vectorzie函数将其转化成“元素运算”形式，
%即通常的“点运算”形式
f1 = str2func(['@(x)' vectorize(char(y(1)))]) 
x1 = -6:0.2:6;
y1 = f1(x1);
%画奇异解,LineH为奇异解曲线的句柄，读者朋友可以运行set(lineH)观察其可设置的属性,
%set(LineH,’属性名’,属性值)来设置某属性
lineH = plot(x1,y1,'color','r','LineWidth',5,'LineStyle','-.'); 
f2 = str2func(['@(C3) @(x)' vectorize(char(y(2)))])%构造双重匿名函数
hold on
for C3 = -2:0.5:2
    f2C3 = f2(C3);%对于每个具体的C3，得到相应的通解的具体解
    plot(x1,f2C3(x1));
end
hold off
title('\fontname{隶书}\fontsize{16}微分方程通解和奇解')

%% examp9.3-6
y = dsolve('Dy=1+y^2','y(0)=1')
y = dsolve('Dy=1+y^2','y(0)=1','IgnoreAnalyticConstraints','none')

%% examp9.3-7
y = dsolve('x*D2y-3*Dy = x^2','y(1) = 0,y(5) = 0','x')
%用另一种方法将符号表达式转化成匿名函数，读者可以对照例9.3-5中的方法
eval(['f = @(x) ',vectorize(char(y))]) 
x = -1:0.2:6;
LineH = plot(x,f(x));%画微分方程解曲线，返回曲线句柄LineH
%通过曲线的句柄设置曲线一些属性值
set(LineH,'color',[0 1 1],'LineWidth',3,'LineStyle','--') 
hold on
plot([1 5],[0,0],'*','color','r','markersize',12)%画微分方程的两个边值点
text(1,1,'y(1) = 0')%图上标注边值条件
text(4,1,'y(5) = 0')
title(['x*D2y-3*Dy = x^2',', y(1) = 0,y(5) = 0'])
hold off