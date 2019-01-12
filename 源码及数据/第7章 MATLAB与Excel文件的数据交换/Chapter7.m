%--------------------------------------------------------------------------
%  第7章  MATLAB与Excel文件的数据交换
%--------------------------------------------------------------------------

%% examp7.2-1
%code by ariszheng@gmail.com
%2010-6-22
%文件名称“excel.xls”
[typ, desc, fmt] = xlsfinfo('excel.xls')
%文件在当前工作目录下，直接输入文件名称即可。
system('taskkill /F /IM EXCEL.EXE');

%% examp7.2-2
% 读取文件examp7_1_1.xls第1个工作表中单元格A2:H4中的数据
% 第一种方式：
num = xlsread('examp7_1_1.xls','A2:H4')    % 返回读取的数据矩阵num
% 第二种方式：
num = xlsread('examp7_1_1.xls',1,'A2:H4')    % 返回读取的数据矩阵num
% 第三种方式：
num = xlsread('examp7_1_1.xls','Sheet1','A2:H4')    % 返回读取的数据矩阵num

%% examp7.2-3
convertdata = xlsread('examp7_1_1.xls', '', 'A2:C3', '', @setplusone1)
[num, txt, raw, X] = xlsread('examp7_1_1.xls', '', 'A2:H2', '', @setplusone2)

%% examp7.2-4
%code by ariszheng@gmail.com
%2010-6-22
%产生随机数据
X = rand(10,10);
%将随机数据X写入Excel文件excel.xls的第2个工作表的默认区域
[status, message] = xlswrite('excel.xls', X, 'sheet2')
system('taskkill /F /IM EXCEL.EXE')
