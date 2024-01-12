function [oldcentroid,newLabels,newcentroid]=max_kmeans(X,k)
%���У�X�����ݼ���k�Ǿ����������ȣ�ʹ��������ȷ����ʼ�������ģ�
%Ȼ��������¾������ģ�ֱ���ط��䲻�ٸı䡣��󣬿��ӻ���������
% ���ݼ� X
 

 
% ȷ����ʼ��������
D = pdist(X);
D = squareform(D);
[maxDistance, index] = max(D(:));
[row, col] = ind2sub(size(D), index);
centroid = [X(row, :); X(col, :)];
while size(centroid, 1) < k
    D = pdist2(X, centroid);
    [minDistance, index] = min(D, [], 2);
    [maxDistance, index] = max(minDistance);
    centroid(end+1, :) = X(index, :);
end
oldcentroid=centroid;%����ĳ�ʼ��������
 

% �������¾�������
oldLabels = zeros(size(X, 1), 1);
while true
    % �����������������ĵľ���
    D = pdist2(X, centroid);
    % ���������ֵ���������ľ����������ڵĴ�
    [~, labels] = min(D, [], 2);
    % ����ط��䲻�ٸı䣬��ֹͣ����
    if all(labels == oldLabels)
        break;
    end
    % ���¾�������
    for i = 1:k
        centroid(i, :) = mean(X(labels == i, :));
    end
    oldLabels = labels;
end
newLabels=oldLabels;%��������վ�����
newcentroid=centroid;%��������վ�������
end

% ���ӻ�������
% figure;
% gscatter(X(:, 1), X(:, 2), labels);
% hold on;
% plot(centroid(:, 1), centroid(:, 2), 'kx', 'MarkerSize', 10, 'LineWidth', 2);
% title(sprintf('K-means clustering with k = %d', k));