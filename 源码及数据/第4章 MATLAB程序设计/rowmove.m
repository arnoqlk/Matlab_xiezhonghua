function B=rowmove(A)
 [m,n]=size(A);
I=repmat(1:n,m,1)+repmat((0:m-1)'*(m+n),1,n);
B=zeros(m+n-1,m);
B(I(:))=A(:);
B=B';
