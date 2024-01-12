function I=topsis(X,W)
[p,g]=size(X);
aa1=[];
for i=1:p
    aa11=X(i,:).*W;
    aa1=[aa1;aa11];
end
H=aa1;%权重归一化矩阵
ba1=max(H);%每一列最大值，正理想
ba2=min(H);%每一列最小值，负理想
bba=[];
baa=[];
for i=1:p
    bba1=ba1-H(i,:);
    baa1=H(i,:)-ba2;
    bba=[bba;bba1];
   baa=[baa;baa1];
end
bba=bba;
baa=baa;
ab1=sqrt(sum(bba.*bba,2));%正理想距离
ab2=sqrt(sum(baa.*baa,2));%负理想距离
ab=ab2./(ab1+ab2);

[m,n]=sort(ab','descend');
I=n;
end


