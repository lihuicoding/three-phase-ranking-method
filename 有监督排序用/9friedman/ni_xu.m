function nx=ni_xu(x)
%x=[4 2 3 1];%输入数据
str=num2str(x);%转换字符串
for i=1:length(str)%字符串长度
    r(i)=str2double(str(i));%再转换为双精度
end
if length(r)==1 %如果长度为1则逆序数为0
    disp('逆序数为');
    disp(0);
else
     for j=2:length(r)
          s=find(r(1:j-1)>r(j));%查找逆序数的下标索引
          u(j)=length(s);%生成每个下标索引长度组成的数组u
         result=sum(u);%求和
     end
     %disp('逆序数为');
     %disp(result);
     nx=result;
end