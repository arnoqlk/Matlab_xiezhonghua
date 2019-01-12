function T = cat_in_holl(varargin)
%varargin,使函数可以接受参数个数不定的输入
if ~isempty(varargin) %输入参数非空
n = varargin{1};%varargin为cell型数组，取其第一个元素赋给n
end
%try -catch结构用法示例
try  
    %如果n是正整数下面语句不会发生错误，进而执行try -catch结构之后的语句
    %否则会发生错误,执行由catch引导的语句。
   if n>0&&mod(n,1)==0; %n为正整数的判断条件
      %空语句，不会报错
   else %n不是正整数，报错
       error;
   end
catch ME   %ME,用来记录发生错误的一些信息
    disp('函数没有输入参数或者输入参数不是正整数标量');
    T = [];%给T赋空值
    return;%函数返回，后面语句不再执行，没有return会接着执行后面的语句
end
%switch-case-end结构用法示例
switch nargin %nargin，函数输入参数的个数
    case 1
        %case 1 的情况是我们程序的核心部分，即整个模拟出洞的过程
        T = zeros(1,n);
        for k = 1:n %for循环用法示例
            c = unidrnd(3,1);%等概率随机生成{1，2，3}中某个数字
            while c ~= 1 %while循环用法示例
                if c == 2 
                    T(k) = T(k)+4;
                else
                    T(k) = T(k)+6;
                end
                c = unidrnd(3,1);
            end
            T(k) = T(k)+2;
        end
    case 2
        T = [];
        disp('函数只能有一个输入参数，且为正整数');
    otherwise
        T = [];
        disp('函数输入参数个数不能大于1，参数需为正整数');
end
