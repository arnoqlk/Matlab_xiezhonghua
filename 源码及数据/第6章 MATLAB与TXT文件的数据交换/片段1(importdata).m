%--------------------------------------------------------------------------
%                调用importdata函数读取文件中的数据
%--------------------------------------------------------------------------

% 调用importdata函数读取文件examp6_2_4.txt中的数据
importdata('examp6_2_4.txt')

% 调用importdata函数读取文件examp6_2_7.txt中的数据
x = importdata('examp6_2_7.txt')
x.data 
x.textdata

% 调用importdata函数读取文件examp6_2_3.txt中的数据
x = importdata('examp6_2_3.txt',';')
x{1}

% 调用importdata函数读取文件examp6_2_8.txt中的数据
x = importdata('examp6_2_8.txt',' ',2)

% 调用importdata函数读取文件examp6_2_7.txt中的数据
[x, s, h] = importdata('examp6_2_7.txt')

% 调用importdata函数读取文件examp6_2_10.txt中的数据
FileContent = importdata('examp6_2_10.txt')
FileContent = char(FileContent)
t = str2num(FileContent(:, 8:9))