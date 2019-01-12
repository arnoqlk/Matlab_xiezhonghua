function r = NestedFunctionVarScopeDemo2(a)
b = a+1;
    function Nested1
        c = b+1;
        c1 = 10;
        function Nested11
            d = c+a;
        end        
    end
Nested1
e = c1
r = d;
end