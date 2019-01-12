function VisitSpeedOfDifferentDataTypes
n = 30000;
a = 8;
b{1} =8;
c.data = 8;
%%
tic;
for k = 1:n
    a;
end
time = toc;
disp(['访问',num2str(n),'次double型数组时间是：',num2str(time),'秒!'])
%%
tic;
for k = 1:n
    b{1};
end
time = toc;
disp(['访问',num2str(n),'次cell型数组时间是：',num2str(time),'秒!'])
%%
tic;
for k = 1:n
    c.data;
end
time = toc;
disp(['访问',num2str(n),'次结构数组时间是：',num2str(time),'秒!'])
