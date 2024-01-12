function [EI] = Ob_EI(ranking,class)
% 返回有效性指数
%   通过输入的类别信息获取排序的有效性指数

[a,b]=size(ranking);
% 计算所有备选方案的序关系数量
values = unique(class)';
values=sort(values,'descend');
counts=sum(class==values);
[~,k]=size(values);
sum_relation=0;
pri_relation=0;
class=class';
for i=1:k-1
    pri_relation=pri_relation+counts(1,i);
    sum_relation=sum_relation+(b-pri_relation)*counts(1,i);
end
ordR=zeros(b);
EI=[];
%记录所有备选方案的序关系
for t=1:a
    ordR=zeros(b);
    for i=1:b
        pos=find(ranking(t,:)==i);
        for j=1:pos
            ordR(i,ranking(t,j))=1;
        end
    end
    %计算不符合现实排序方法的数量
    misord=0;
    for i=1:b
        for j=1:b
            if ordR(i,j)==1 && (class(1,i)-class(1,j))>0
                misord=misord+1;
            end
        end
    end
    EI=[EI (sum_relation-misord)/sum_relation];
end
end

