function ColLoopVsRowLoop
n = 3000;
a = rand(n);
tic;
for ii = 1:n
    for jj = 1:n
        a(ii,jj);
    end
end
toc
 
 tic;
for ii = 1:n
    for jj = 1:n
        a(jj,ii);
    end
end
toc
