clear
N = 1e6+1; k = [1:N]; x = 1+1e-6;
tic
p1 = sum(k.*x.^[N-1:-1:0]); %方法1：用sum函数的方法
p1, toc %
tic, p2 = polyval(k,x), toc %方法2：调用polyvol函数实现
tic, p3=k(1);
for i = 2:N %nested multiplication
p3 = p3*x + k(i);
end
p3,toc  %方法3：根据上述多项式求和算法实现