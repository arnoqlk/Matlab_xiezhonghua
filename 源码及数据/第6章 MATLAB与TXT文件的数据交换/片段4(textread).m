%--------------------------------------------------------------------------
%                    调用textread函数读取文件中的数据
%--------------------------------------------------------------------------

% 调用textread函数读取文件examp6_2_1.txt中的数据
x1 = textread('examp6_2_1.txt');
% 调用textread函数读取文件examp6_2_2.txt中的数据
x2 = textread('examp6_2_2.txt');

% 调用textread函数读取文件examp6_2_3.txt中的数据
x3 = textread('examp6_2_3.txt','','delimiter',',');

% 调用textread函数读取文件examp6_2_4.txt中的数据
[c1,c2,c3,c4,c5]=textread('examp6_2_4.txt','%f %f %f %f %f','delimiter',',;*');
c5

% 调用textread函数读取文件examp6_2_5.txt中的数据
x5 = textread('examp6_2_5.txt','','emptyvalue',-1)

% 调用textread函数读取文件examp6_2_6.txt中的数据
x6 = textread('examp6_2_6.txt','','emptyvalue',-1)

% 调用textread函数读取文件examp6_2_8.txt中的数据
x8 = textread('examp6_2_8.txt','','headerlines',7)

% 调用textread函数读取文件examp6_2_9.txt中的数据，
x9 = textread('examp6_2_9.txt','','delimiter',', ','whitespace','+i')

% 调用textread函数读取文件examp6_2_9.txt中的数据
x9 = textread('examp6_2_9.txt','','delimiter','+i,')

% 调用textread函数读取文件examp6_2_9.txt中的数据
[c1,c2,c3,c4,c5,c6,c7,c8] = textread('examp6_2_9.txt',...
'%f %f %f %f %f %f %f %f','delimiter',', ','whitespace','+i');
x9 = [c1,c2,c3,c4,c5,c6,c7,c8]

% 调用textread函数读取文件examp6_2_10.txt中的数据
 [c1,c2,c3,c4,c5,c6,c7] = textread('examp6_2_10.txt',...
'%4d %d %2d %d %d %6.3f %s','delimiter','-,:');
[c1,c2,c3,c4,c5,c6]


format = '%s %s %s %d %s %d %s %d %s';
% 调用textread函数读取文件examp6_2_11.txt中的数据，
[c1,c2,c3,c4,c5,c6,c7,c8,c9] = textread('examp6_2_11.txt',format,...
'delimiter',': ');
[c4 c6 c8]