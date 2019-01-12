function r = MyTestNestedFun(input)
a =  5;
c = sin(input)+tan(input);
function y = nestedfun(b)
y = a*c+b;
end
r = nestedfun(5);
end
