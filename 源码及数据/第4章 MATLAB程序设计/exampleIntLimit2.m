function sol = exampleIntLimit2(a,e,l)
%被积表达式
    function f = fun1(beta)
            f = a.*(1-e.^2)./(1-e.^2.*sin(beta).^2).^(3/2);
    end
%计算积分
    function g = fun2(beta0)
        g = quadl(@fun1,0,beta0)-l;
    end
sol = fzero(@fun2,3);
end
