function nx=ni_xu(x)
%x=[4 2 3 1];%��������
str=num2str(x);%ת���ַ���
for i=1:length(str)%�ַ�������
    r(i)=str2double(str(i));%��ת��Ϊ˫����
end
if length(r)==1 %�������Ϊ1��������Ϊ0
    disp('������Ϊ');
    disp(0);
else
     for j=2:length(r)
          s=find(r(1:j-1)>r(j));%�������������±�����
          u(j)=length(s);%����ÿ���±�����������ɵ�����u
         result=sum(u);%���
     end
     %disp('������Ϊ');
     %disp(result);
     nx=result;
end