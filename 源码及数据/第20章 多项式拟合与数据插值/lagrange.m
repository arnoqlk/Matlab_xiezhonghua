function y = lagrange(x0,y0,x)
% 拉格朗日多项式插值的MATLAB函数
% y = lagrange1(x0,y0,x) 返回x处的拉格朗日多项式插值y，输入参数x0和y0为等长向量，
%            用来指定型值点坐标。输入参数x用来指定插值点坐标，可以是向量或标量。
% CopyRight  xiezhh(谢中华)  2012.2.12

% 判断原始坐标点是否等长
if numel(x0) ~= numel(y0)
    error('原始坐标点应等长')
end
x0 = x0(:);  % 将x0拉长为长向量
% 判断插值节点是否有重复值
if any(diff(sort(x0))==0)
    error('插值节点不能有重复值')
end

n = numel(x0);  % 插值节点个数
m = numel(x);  % 插值点个数
y0 = y0(:);  % 将y0拉长为长向量
x = x(:)';  % 将x拉长为长向量，然后转置
y = zeros(n,m);  % 生成n行，m列的零矩阵
% 通过循环求拉格朗日插值多项式
for i = 1:n
    y(i,:) = y0(i)*prod(repmat(x,n-1,1)-...
        repmat(x0(1:n~=i),1,m))/prod(x0(i)-x0(1:n~=i));
end
y = sum(y);  % 求和