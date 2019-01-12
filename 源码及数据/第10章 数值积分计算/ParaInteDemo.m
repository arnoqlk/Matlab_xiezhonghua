function ParaInteDemo
%{
方法1：num2str+inline
%}
clear all 
k=linspace(0,5);
y = zeros(1,length(k));
for i=1:length(k)
    kk=k(i);
    fun=strcat('sin(',num2str(kk),'*x).*x.^2');
    y(i)=quadl(inline(fun),1,5); 
end
plot(k,y) 
%=================
%方法2：匿名函数实现
%=================
f = @(k) quad(@(x)  sin(k.*x).*x.^2,0,5);
kk = linspace(0,5);
y = zeros(size(kk));
for ii = 1:length(kk)
y(ii) = f(kk(ii));
end
plot(kk,y)
%=================
%方法3：嵌套函数实现
%=================
function y = ParaIntDemo(k)
function f = f(x) 
f = sin(k.*x).*x.^2;
end
%上面是以嵌套函数的形式表示的f,也可以用匿名函数来表示f：即f = @(x) sin(k.*x).*x.^2;,
%当f无法简单表示的时候，只能采用嵌套函数了.
y = quadl(@f,1,5);
end
kk = linspace(0,5);
y=zeros(size(kk));
for ii=1:length(kk)
y(ii) = ParaIntDemo(kk(ii));
end
plot(kk,y)
%=========================
%方法4：积分函数本身传递参数
%=========================
kk = linspace(0,5);
y = zeros(size(kk));
for ii = 1:length(kk)
y(ii) = quad(@(x,k) sin(k.*x).*x.^2,0,5,[],[],kk(ii));
end

end

