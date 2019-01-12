%--------------------------------------------------------------------------
%                    调用load函数读取文件中的数据
%--------------------------------------------------------------------------

load examp6_2_1.txt
load  -ascii  examp6_2_1.txt
x1 = load('examp6_2_2.txt')

x1 = load('examp6_2_2.txt', '-ascii');

x2 = dlmread('examp6_2_1.txt');

x3 = textread('examp6_2_1.txt');
load examp6_2_3.txt
load examp6_2_4.txt

% 用load函数载入文件examp6_2_5.txt中的数据，出现错误
load examp6_2_5.txt

% 用load函数载入文件examp6_2_7.txt中的数据，出现错误
load examp6_2_7.txt

% 用load函数载入文件examp6_2_10.txt中的数据，出现错误
load examp6_2_10.txt

% 用load函数载入文件examp6_2_11.txt中的数据，出现错误
load examp6_2_11.txt

x = load('examp6_2_12.txt')