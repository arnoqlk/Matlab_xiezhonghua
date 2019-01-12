%--------------------------------------------------------------------------
%  第2章  MATLAB基本操作
%--------------------------------------------------------------------------

%% examp2.1-1
x = 1
y = 1+2+sqrt(9)
z = 'Hellow World !!!'

%% examp2.2-1
x = [1  -1.65  2.2  -3.1];
y1 = abs(x)
y2 = sin(x)
y3 = round(x)
y4 = floor(x)
y5 = ceil(x)
y6 = min(x)
y7 = mean(x)
y8 = range(x)
y9 = sign(x)

%% examp2.3-1
x = []
y = [1, 2, 3;4  5  6;7  8, 9]
z = [1  2  3
     4  5  6
     7  8  9]

%% examp2.3-2
x = 1:10 
y = 1:2:10
z = [1:3; 4:6; 7:9]

%% examp2.3-3
x = linspace(1, 10, 10)

%% examp2.3-4
x = [1  2  3; 4  5  6]
size(x)
[m, n] = size(x)

%% examp2.3-5
x = [1  2  3; 4  5  6; 7  8  9]
y1 = x(1, 2)
y2 = x(2:3, 1:2)
y3 = x(:, 1:2)
y4 = x(1, :)
y5 = x(:)'
y6 = x(3:6)

%% examp2.3-6
x1 = [1  2  3];
x2 = [4  5  6];
x = [x1; x2]
y = reshape(x, [3, 2])
z = repmat(x, [2, 2])

%% examp2.3-7
x = ['abc'; 'def'; 'ghi'] 
size(x)

%% examp2.3-8
x = 2i+5
y = [1  2  3; 4  5  6]*i+7
a = [1  2; 3  4];
b = [5  6; 7  8];
c = complex(a,b)

%% examp2.3-9
syms a b c d
x = [a  b; c  d]
y = [1  2  3; 4  5  6];  
y = sym(y)

%% examp2.3-10
A = zeros(3)
B = ones(3,5)
C = eye(3,5)
D = diag([1 2 3])
E = diag(D)
F = rand(3)
G = magic(3)

%% examp2.3-11
% 定义一个2行，2列，2页的3维数组
x(1:2, 1:2, 1)=[1  2; 3  4];
x(1:2, 1:2, 2)=[5  6; 7  8];

%% examp2.3-12
A1 = [1  2; 3  4];
A2 = [5  6; 7  8];
A = cat(3, A1, A2)

%% examp2.3-13
x = reshape(1:12, [2, 2, 3]) 

%% examp2.3-14
x = repmat([1  2; 3  4], [1 1 2])

%% examp2.3-15
% 通过直接赋值方式定义一个1行2列的结构体数组
struct1(1).name = 'xiezhh';
struct1(2).name = 'heping';
struct1(1).age = 31;
struct1(2).age = 32;
struct1 

%% examp2.3-16
struct2 = struct('name', {'xiezhh', 'heping'}, 'age',{31, 32})
struct2(1).name

%% examp2.3-17
c1 = {[1  2; 3  4], 'xiezhh', [5  6  7], 'I LOVE MATLAB'}

%% examp2.3-18
c2 = cell(2,4)
c2{2, 3} = [1  2  3]

%% examp2.3-19
c = {[1  2], 'xie', 'xiezhh'; 'MATLAB', [3  4; 5  6], 'I LOVE MATLAB'}
c(2, 2)
c{2, 2}
c = {[1  2],  'xiezhh'; 'MATLAB', [3  4; 5  6]};
celldisp(c)

%% examp2.3-20
A1 = rand(60,50);
B1 = mat2cell(A1, [10 20 30], [25 25])
C1 = cell2mat(B1);
isequal(A1,C1)
A2 = [1 2 3 4;5 6 7 8;9 10 11 12];
B2 = num2cell(A2)
C = {'Heping', 'Tianjin', 35;  'Xiezhh', 'Xingyang', 30}
fields = {'Name', 'Address', 'Age'};
S = cell2struct(C, fields, 2)
CS = struct2cell(S)
isequal(C,CS')

%% examp2.3-21
A = [1  2; 3  4];
B = [5  6; 7  8];
C = A+B
D = A-B

%% examp2.3-22
A = [1  2  3; 4  5  6];
B = [1  1  1  1; 2  2  2  2; 3  3  3  3];
C = A*B 
D = [1  1  1; 2  2  2];
E = A.*D 

%% examp2.3-23
A = [2  3  8; 1  -2  -4; -5  3  1];
b = [-5; 3; 2];
x = A\b
B = A;
C = A./B

%% examp2.3-24
A = [1  2; 3  4];
B = A ^ 2
C = A .^ 2
D = A .^ A

%% examp2.3-25
A = [1  2; 3  4];
B = [2  2; 2  2];
C1 = A > B 
C2 = A ~= B
C3 = A >=2

%% examp2.3-26
A = [0  0  1  2];
B = [0  -2  0  1];
C1 = A | B
C2 = A & B
C3 = ~ A
C4 = xor(A, B)
x = 5;
y = 0;
x || y
x && y

%% examp2.3-27
A = [1  2  3; 4  5  6; 7  8  9]
B = A'

%% examp2.3-28
A = [1  2  3; 4  5  6; 7  8  9];
B1 = flipud(A)
B2 = fliplr(A)
B3 = rot90(A)

%% examp2.3-29
A = [1  2; 3  4];
d1 = det(A)
syms a b c d
B = [a  b; c  d];
d2 = det(B)

%% examp2.3-30
A = [1  2; 3  4];
Ai = inv(A)
syms a b c d
B = [a  b; c  d];
Bi = inv(B) 
C = [1  2  3; 4  5  6];
Cpi = pinv(C)
D = C * Cpi * C

%% examp2.3-31
A = [5  0  4; 3  1  6; 0  2  3];
d = eig(A)
[V, D] = eig(A)
[Vs, Ds] = eig(sym(A))

%% examp2.3-32
A = [1  2  3; 4  5  6; 7  8  9];
t = trace(A)
r = rank(A)

%% examp2.5-1
A = [1 2 3;4 5 6;7 8 9];
B = 100;
Str = 'Hellow World !!!';
C = cell(2,3);
S = struct('name', {'heping','xiezhh'}, 'age',{30, 32});
syms a b c d
D = [a b;c d]; 
whos
save  xiezhh.mat A B Str 
clear  A  B  Str
load  xiezhh.mat
which sin
open sqrt
type trace