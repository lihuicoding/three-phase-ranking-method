function [A,Br,BR]=weizhi_fen(ae)
% �����ظ�Ԫ�ص�����λ��
duplicates = unique(ae);
positions = cell(size(duplicates));
for ii = 1:length(duplicates)
    pos = find(ae== duplicates(ii));
    if length(pos) > 1
        positions{ii} = pos;
    end
end
 positions;%�������Ԫ����ͬ��λ��Ԫ��
% ������
for ii = 1:length(duplicates)
    if ~isempty(positions{ii})
        fprintf('Value %d appears at positions: ', duplicates(ii));
        fprintf('%d ', positions{ii});
        fprintf('\n');
    end
end

[~,A]=sort(ae,'descend');%����IX_2����������Ҫ�Ķ����1��n����λ�ã�Ϊ����������������ͼ
[a,b]=size(A);
B=[];
for c=1:a
    C=A(c,:);
    [D,IX]=sort(C);
    B=[B;IX];
end
Br=B;%�����ÿ�������Ӧ������λ��

for j=1:length(duplicates)
    as=positions{j};
    B1=B(as);
    B2=mean(B1);
    %B2=sum(B1)/length(B1);
    B(as)=B2;
end
BR=B; %�����ÿ�������Ӧ������÷�
end