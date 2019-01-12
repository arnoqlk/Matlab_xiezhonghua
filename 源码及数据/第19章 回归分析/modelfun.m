function T = modelfun(beta,xy)
% 理论回归方程所对应的M函数（需要在程序编辑窗口编写）
% xiezhh（谢中华）
x = xy(:,1);
y = xy(:,2);
T = sqrt((x-beta(1)).^2+(y-beta(2)).^2+beta(3).^2)/(60*beta(4))+beta(5);
