function IntDemo
    function f1 = myfun1(x)
        f1 = zeros(size(x));
        for k = 1:length(x)
            f1(k) = quadl(@(y) x(k)*y,sin(x(k)),cos(x(k)));
        end
    end
y = quadl(@myfun1,1,2)
end
