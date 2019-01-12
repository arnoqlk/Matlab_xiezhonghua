function r = NestedFunctionVarScopeDemo(a)
b = a+1;
    function Nested1
        c = b+1;
        function Nested11
            d = c+a;
        end
        Nested11;
    end
Nested1
r = d;
end
