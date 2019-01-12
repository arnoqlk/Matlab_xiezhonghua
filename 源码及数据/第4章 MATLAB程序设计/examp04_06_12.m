A = rand(1000);
tic;B = A(find(A>0.3 & A<0.7));toc
tic;C = A((A>0.3 & A<0.7));toc
