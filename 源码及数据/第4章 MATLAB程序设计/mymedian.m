function b = mymedian(a)
a = sort(a);
n = length(a);
half = floor(n/2);%若非整数则向下取整，整数维持不变
b = a(half+1);
if half*2 == n%若n为偶数，b等于排好序的中间两个数平均值
    b = (b+a(half))/2;
end
