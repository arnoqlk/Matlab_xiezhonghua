function example1000000fast2
clear
A = unidrnd(100,1000000,7); 
B = repmat([4,6,8],1000000,1);
tic;C = [any(AA == 4,2) any(AA == 6,2) any(AA == 8,2)];
B(C) = 0;
toc
