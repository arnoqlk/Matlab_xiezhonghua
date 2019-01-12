function r = NestedFunctionVarScopeDemo3(a)
b = a+1;
    function Nested1
        c = b+1;
        c1 = 10;
        Nested2;
        c2 = d^2;
    end
    function Nested2
        d = 2*b;
    end
Nested1
r = c2
end