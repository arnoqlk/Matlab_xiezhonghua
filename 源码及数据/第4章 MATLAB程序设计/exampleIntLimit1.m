function sol = exampleIntLimit1(a,e,l)
%用嵌套函数表示被积表达式
    function f = fun1(beta)
        f = a.*(1-e.^2)./(1-e.^2.*sin(beta).^2).^(3/2);
    end
%调用fzero求满足条件的beta0值
sol = fzero(@(beta0)fun2(beta0,l,@fun1),3);
end
%用子函数表示积分
function g = fun2(beta0,l,fhdle)
g = quadl(fhdle,0,beta0)-l;
end
