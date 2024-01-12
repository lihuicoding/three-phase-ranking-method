function [oldcentroid,newLabels,newcentroid]=max_kmeans(X,k)
%其中，X是数据集，k是聚类数。首先，使用最大距离确定初始聚类中心，
%然后迭代更新聚类中心，直到簇分配不再改变。最后，可视化聚类结果。
% 数据集 X
 

 
% 确定初始聚类中心
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
oldcentroid=centroid;%输出的初始聚类中心
 

% 迭代更新聚类中心
oldLabels = zeros(size(X, 1), 1);
while true
    % 计算样本到聚类中心的距离
    D = pdist2(X, centroid);
    % 将样本划分到距离最近的聚类中心所在的簇
    [~, labels] = min(D, [], 2);
    % 如果簇分配不再改变，则停止迭代
    if all(labels == oldLabels)
        break;
    end
    % 更新聚类中心
    for i = 1:k
        centroid(i, :) = mean(X(labels == i, :));
    end
    oldLabels = labels;
end
newLabels=oldLabels;%输出的最终聚类标记
newcentroid=centroid;%输出的最终聚类中心
end

% 可视化聚类结果
% figure;
% gscatter(X(:, 1), X(:, 2), labels);
% hold on;
% plot(centroid(:, 1), centroid(:, 2), 'kx', 'MarkerSize', 10, 'LineWidth', 2);
% title(sprintf('K-means clustering with k = %d', k));