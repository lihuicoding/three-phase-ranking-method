function [A,Br,BR]=weizhi_fen(ae)
% 查找重复元素的所有位置
duplicates = unique(ae);
positions = cell(size(duplicates));
for ii = 1:length(duplicates)
    pos = find(ae== duplicates(ii));
    if length(pos) > 1
        positions{ii} = pos;
    end
end
 positions;%输出具有元素相同的位置元组
% 输出结果
for ii = 1:length(duplicates)
    if ~isempty(positions{ii})
        fprintf('Value %d appears at positions: ', duplicates(ii));
        fprintf('%d ', positions{ii});
        fprintf('\n');
    end
end

[~,A]=sort(ae,'descend');%这里IX_2就是我们需要的对象从1到n的序位置，为列向量，用于排序画图
[a,b]=size(A);
B=[];
for c=1:a
    C=A(c,:);
    [D,IX]=sort(C);
    B=[B;IX];
end
Br=B;%这个是每个对象对应的排序位置

for j=1:length(duplicates)
    as=positions{j};
    B1=B(as);
    B2=mean(B1);
    %B2=sum(B1)/length(B1);
    B(as)=B2;
end
BR=B; %这个是每个对象对应的排序得分
end