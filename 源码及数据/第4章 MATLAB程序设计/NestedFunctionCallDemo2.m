function  NestedFunctionCallDemo2(flag)
switch flag
    case 1
        disp('flag = 1');
        return;
    case 2
        disp('flag = 2');
        NestedFun1
    case 3
        disp('flag = 3');
        return
    otherwise
        disp(['flag = ',num2str(flag)]);
        return
end
    function NestedFun1
        NestedFunctionCallDemo2(1);
        NestedFun2
        function NestedFun2
            NestedFunctionCallDemo2(3)
        end
    end
end
