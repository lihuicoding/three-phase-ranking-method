function [EI] = Ob_EI(ranking,class)
% ������Ч��ָ��
%   ͨ������������Ϣ��ȡ�������Ч��ָ��

[a,b]=size(ranking);
% �������б�ѡ���������ϵ����
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
%��¼���б�ѡ���������ϵ
for t=1:a
    ordR=zeros(b);
    for i=1:b
        pos=find(ranking(t,:)==i);
        for j=1:pos
            ordR(i,ranking(t,j))=1;
        end
    end
    %���㲻������ʵ���򷽷�������
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

