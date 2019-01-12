function f=LargObjFun(x)
f=0;
n = 200;
for ii=1:n
    f=f+(x(ii)-1/ii)^2;
end