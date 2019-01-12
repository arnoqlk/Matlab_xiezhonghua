function f = nIntegrate(fun,low,up)
%f, 返回值，n重积分积分结果
%fun, 是被积函数字符串形式；
%low存储从外到内各重积分的积分下限函数；
%up存储从外到内各重积分的积分上限函数（都是字符串形式）
%为了保证函数正常运行，low和up内的函数遵循如下原则：设积分重数为m，最内层到最外层的
%积分变量依次以xm,...x2,x1来表示（只能以这样顺序，其他顺序或者别的字母表示变量都不可以）
%最内层的上下限函数不管是不是关于x(m-1)的函数都要求x(m-1)必须出现，不是其函数时
%可以写成“+0*x(m-1)”等形式,依次类推次内层要求x(m-2)必须要出现等等，一直到次外层
%要求变量x1出现，最外层才是常数。
N = length(low); %判断积分重数
fun = vectorize(fun); %将被积函数写成点乘形式，方便数值积分函数调用
if verLessThan('MATLAB','7.8') %判断当前运行该函数的MATLAB版本是否低于7.8即R2009a
    %低于7.8调用GenerateExpr_quadl函数递归构造求解表达式
    expr = GenerateExpr_quadl(N); 
else %7.8或者以后的版本调用GenerateExpr_quad2d函数递归构造求解表达式
    if mod(N,2) == 0
        expr = GenerateExpr_quad2d(N);
    else
        expr = ['quadl(@(x1) arrayfun(@(x1)',...
            GenerateExpr_quad2d(N-1),',x1),',low{1},',',up{1},')'];
    end
    
end
%=======================================================
%主要利用quadl函数递归构造求解表达式，适用于R2009a以前的版本
%=======================================================
    function expr = GenerateExpr_quadl(n)
        if n == 1
            expr = ['quadl(@(x',num2str(N),')',fun,',',low{N},',',up{N},')' ];
        else
            expr = ['quadl(@(x',num2str(N-n+1),') arrayfun(@(x',...
              num2str(N-n+1),')',GenerateExpr_quadl(n-1),',x',num2str(N-n+1),...
                '),',low{N-n+1},',',up{N-n+1},')'];
        end
    end
%============================================================
%主要利用quad2d函数递归构造求解表达式，适用于R2009a以及以后的版本
%============================================================
    function expr = GenerateExpr_quad2d(n)
        if n == 2
            expr = ['quad2d(@(x',num2str(N-1),',x',num2str(N),')',fun,',',...
                low{N-1},',',up{N-1},',@(x',num2str(N-1),')',low{N},',@(x',...
                num2str(N-1),')',up{N},')' ];
        else
            expr = ['quad2d(@(x',num2str(N-n+1),',x',num2str(N-n+2),')',...
                'arrayfun(@(x',num2str(N-n+1),',x',num2str(N-n+2),')',...
                GenerateExpr_quad2d(n-2),...
                ',x',num2str(N-n+1),',x',num2str(N-n+2),'),',...
                low{N-n+1},',',up{N-n+1},...
                ',@(x',num2str(N-n+1),')',low{N-n+2},...
                ',@(x',num2str(N-n+1),')',up{N-n+2},')' ];
        end
    end
f = eval(expr);
end