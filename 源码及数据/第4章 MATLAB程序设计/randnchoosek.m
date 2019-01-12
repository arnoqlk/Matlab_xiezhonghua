function r = randnchoosek(n,m)
%n：数组，需要从中随机选取m个不重复的元素
%r: 数组n中随机选取的m个不重复的元素
ln = length(n);
for i = 1:m  
    ind = i-1+unidrnd(ln-i+1);
    a = n(ind);
    n(ind) = n(i);
    n(i) = a;
end
r = n(1:m);
