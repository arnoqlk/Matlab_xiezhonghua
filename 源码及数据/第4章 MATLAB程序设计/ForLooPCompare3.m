function y = ForLooPCompare3(x)
y(512,512) = 0;
tic;
for k1 = -1:1
    for k2 = -1:1
        for i = 2:511
            for j = 2:511                
                y(i,j) = y(i,j)+x(i+k1,j+k2)/9;
            end
        end
    end
end
toc
