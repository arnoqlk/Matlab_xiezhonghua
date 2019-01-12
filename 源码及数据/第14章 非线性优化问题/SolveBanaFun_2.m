%code by ariszheng@gmail.com
OPTIONS = optimset('HessUpdate','bfgs','gradobj','on','display','iter');
x=[-1.9,2];
[x,fval,exitflag,output]=fminunc(@BanaFunWithGrad,x,OPTIONS)