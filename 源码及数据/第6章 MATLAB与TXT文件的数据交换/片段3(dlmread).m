%--------------------------------------------------------------------------
%                   调用dlmread函数读取文件中的数据
%--------------------------------------------------------------------------

% 调用dlmread函数读取文件examp6_2_3.txt中的数据
x = dlmread('examp6_2_3.txt')

% 调用dlmread函数读取文件examp6_2_3.txt中的数据
x = dlmread('examp6_2_3.txt', ',', 2, 3)

% 调用dlmread函数读取文件examp6_2_3.txt中的数据
x = dlmread('examp6_2_3.txt', ',', [1, 2, 2, 5])

% 调用dlmread函数读取文件examp6_2_4.txt中的数据，出现错误
x = dlmread('examp6_2_4.txt')

% 调用dlmread函数读取文件examp6_2_5.txt中的数据
x = dlmread('examp6_2_5.txt')

% 调用dlmread函数读取文件examp6_2_6.txt中的数据
x = dlmread('examp6_2_6.txt')

% 调用dlmread函数读取文件examp6_2_7.txt中的数据，出现错误
x = dlmread('examp6_2_7.txt')

% 调用dlmread函数读取文件examp6_2_7.txt中的数据
x = dlmread('examp6_2_7.txt', ',', 2,0)

% 调用dlmread函数读取文件examp6_2_8.txt中的数据
x = dlmread('examp6_2_8.txt', ' ', [7,0,8,8])
x = x(:, 1:4:end)

% 调用dlmread函数读取文件examp6_2_9.txt中的数据
x = dlmread('examp6_2_9.txt')