% 定义匿名函数解方程，这时的y只能接受标量x作为输入
y = @(x) fzero(@(y) (exp(y)+x^y)^(1/y)-x^2*y,1 );
format long
y1 = y(1)
y2 = y(2)
y3 = y(3)

% 利用函数arrayfun，可以令其接受向量输入：
Y = @(x) arrayfun(@(xx)fzero(@(y) (exp(y)+xx^y)^(1/y)-xx^2*y,1 ), x);
Y(1:10)