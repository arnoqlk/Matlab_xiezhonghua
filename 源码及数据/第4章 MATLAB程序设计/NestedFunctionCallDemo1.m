function r = NestedFunctionCallDemo1(a)
b = a+1;
    function c1 = Nested1(x)
        c = b+1;
        c1 = 10+c*x;
        function d = Nested11
            d = c+a;
        end        
    end
c1 = Nested1(1),
r = Nested11;
end
