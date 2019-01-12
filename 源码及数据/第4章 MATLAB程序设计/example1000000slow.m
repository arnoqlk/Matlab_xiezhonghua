function example1000000slow
A = unidrnd(100,1000000,7);%随机生成1000000*7的A矩阵，A的元素属于1到100的整数
B = zeros(1000000,3);
for m = 1:1000000
    a = A(m,:);
    b = [4 6 8];
    for ii = 1:3
        dd = a(a==b(ii));%dd：a中等于b(ii)的元素
        if isempty(dd)==0 %dd不为空
            b(ii)=0;
        end
    end
    B(m,:)=b;
end
