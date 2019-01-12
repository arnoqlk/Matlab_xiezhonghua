function PreAllocMemVSnot
n = 30000;
tic;
for k = 1:n
    a(k) = 1;
end
time = toc;
disp(['未预分配内存下动态赋值长为',num2str(n),'的数组时间是：',num2str(time),'秒!'])
%%
tic
b = zeros(1,n,'double');
for k = 1:n
    b(k) = 1;
end
time = toc;
disp(['预分配内存下赋值长为',num2str(n),'的数组时间是：',num2str(time),'秒!'])
