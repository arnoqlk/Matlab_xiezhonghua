function  NestedFunctionCallDemo4
Nested1(5)
    function  Nested1(x)
        disp(['Nested1执行，输入：',num2str(x)])
        Nested11(6)
        function  Nested11(xx)
            disp(['Nested11执行，输入：',num2str(xx)]);
            Nested2(pi)
            Nested22(10);
        end
    end
    function  Nested2(y)
        disp(['Nested2执行，输入：',num2str(y)])
        Nested22(pi*pi)
        function  Nested22(yy)
            disp(['Nested22执行，输入：',num2str(yy)]);
        end
    end
end

