n = 200;
x0 = 10*ones(1,n); %³õÊ¼µü´úµã
PTIONS = optimset('LargeScale','on','display','iter','TolFun',1e-8);
[x,fval,exitflag,output] = fminunc(@LargObjFun,x0,PTIONS)