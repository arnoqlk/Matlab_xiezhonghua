function InlineSubAnonymousNestedCallDemo
% 各种类型函数调用效率比较
n = 10000;
f1 = inline('x');% f(x) = x 的inline形式
f2 = @(x) x;% f(x) = x 的anonymous function形式
    function f3 = f3(x) % f(x) = x 的nested function形式
        f3 = x;
    end
%% inline的调用效率
tic
for k = 1:n
    f1(1);
end
time = toc;
disp(['f(x) = x 的inline形式调用',num2str(n),'次时间是：',num2str(time),'秒!'])
%% anonymous function的调用效率
tic
for k = 1:n
    f2(1);
end
time = toc;
disp(['f(x) = x 的anonymous function形式调用',num2str(n),'次时间是：',...
    num2str(time),'秒!'])
%% nested function的调用效率
tic
for k = 1:n
    f3(1);
end
time = toc;
disp(['f(x) = x 的nested function形式调用',num2str(n),'次时间是：',...
    num2str(time),'秒!'])
%%  sub-function的调用效率
tic
for k = 1:n
    f4(1);
end
time = toc;
disp(['f(x) = x 的sub-function形式调用',num2str(n),'次时间是：',...
    num2str(time),'秒!'])
end

function f4 = f4(x) % f(x) = x 的sub-function形式
f4 = x;
end
