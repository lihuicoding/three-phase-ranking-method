function I=topsis(X,W)
[p,g]=size(X);
aa1=[];
for i=1:p
    aa11=X(i,:).*W;
    aa1=[aa1;aa11];
end
H=aa1;%Ȩ�ع�һ������
ba1=max(H);%ÿһ�����ֵ��������
ba2=min(H);%ÿһ����Сֵ��������
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
ab1=sqrt(sum(bba.*bba,2));%���������
ab2=sqrt(sum(baa.*baa,2));%���������
ab=ab2./(ab1+ab2);

[m,n]=sort(ab','descend');
I=n;
end


