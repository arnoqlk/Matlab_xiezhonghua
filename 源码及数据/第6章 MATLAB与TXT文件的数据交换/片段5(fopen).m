%--------------------------------------------------------------------------
%                         调用fopen函数打开文件
%--------------------------------------------------------------------------

[fid, message] = fopen('xiezhh.txt')

fid = fopen('xiezhh.txt')
[filename, permission] = fopen(fid)

% 调用fopen函数以只读方式打开文件examp6_2_1.txt 
fid = fopen('examp6_2_1.txt','rt');
tline = fgets(fid, 32)
fclose(fid);
