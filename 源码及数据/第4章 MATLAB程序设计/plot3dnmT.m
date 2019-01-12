function [m,n,TT]=plot3dnmT(N,L)
%N:inf的近似，L:[0,2]区间的剖分个数
C=zeros(N,1);%nested-function：Tmn=calcT(mm,nn)中用来存储计算结果
m=linspace(0,2,L);
[m,n]=meshgrid(m,m);
TT=zeros(size(n));%和网格数据m,n对应的计算出来的T(m,n)网格数据
for ii=1:L
    for jj=1:L
        TT(ii,jj)=calcT(m(ii,jj),n(ii,jj));
    end
end
%=====计算T(m,n)的nest-function
function Tmn=calcT(mm,nn)
for N1=1:N
     C(N1)=(mm^N1/gamma(N1+1))*sum(  nn.^(0:N1-1)./gamma(1:N1)  );
     Tmn=1.0-exp(-mm-nn)*sum(C);
end
end
mesh(n,m,TT);
end
