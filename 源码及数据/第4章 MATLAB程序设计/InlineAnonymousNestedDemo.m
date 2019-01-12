function InlineAnonymousNestedDemo
%% 用inline解决
tic;
k=linspace(0,5);
y1 = zeros(size(k));
for i=1:length(k)
    kk=k(i);
    fun=inline(['sin(',num2str(kk),'*x).*x.^2']);
    y1(i)=quadl(fun,0,5);
end
time = toc;
disp(['用inline方法的时间是：',num2str(time),'秒!'])
%% 用anonymous function 解决
tic;
f=@(k) quadl(@(x)  sin(k.*x).*x.^2,0,5);
kk=linspace(0,5);
y2=zeros(size(kk));
for ii=1:length(kk)
    y2(ii)=f(kk(ii));
end
time = toc;
disp(['用anonymous function方法的时间是：',num2str(time),'秒!'])
%% 用nested function解决
    function y = ParaInteg(k)
        y=quadl(@(x) sin(k.*x).*x.^2 ,0,5);
    end
tic;
kk=linspace(0,5);
y3=zeros(size(kk));
for ii=1:length(kk)
    y3(ii)=ParaInteg(kk(ii));
end
time = toc;
disp(['用nested function方法的时间是：',num2str(time),'秒!'])
%% 用 arrayfun + anonymous function 解决
tic;y4 = arrayfun(@(k) quadl(@(x)  sin(k.*x).*x.^2,0,5),linspace(0,5));time = toc;
disp(['用arrayfun + anonymous function方法的时间是：',num2str(time),'秒!'])
plot(kk,y2);
xlabel('k');
ylabel('f(k)')
end
