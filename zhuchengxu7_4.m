clc
close all
clear all
X=xlsread('C:\Users\张凯凯\Desktop\张bo7程序\无监督排序用\3葡萄酒\winequality-white','A2:K4899');
J = [2 2 2 2 1 1 2 2 1 2 1];
[m,n] = size(X);
A=zeros(m,n);
for j = 1:n
	if J(j) == 1
       A(:,j) = X(:,j)./max(X(:,j));
       %A(:,j) = X(:,j)./max(X(:,j));
  %A(:,j) = (X(:,j)-min(X(:,j)))./(max(X(:,j))-min(X(:,j)));
    else
        %A(:,j) = min(X(:,j))./X(:,j);
        A(:,j) = 1-X(:,j)./max(X(:,j));
   %A(:,j) = (max(X(:,j))-X(:,j))./(max(X(:,j))-min(X(:,j)));
	end    
end
TA=A;
%W=[0.125,0.2,0.1,0.25,0.1,0.2];
%H=[ 0.33    0.37    0.45     0.33    0.41     0.35];%面向准则的模糊概念H，h_j
W=ones(1,n).*(1/n);
%X1=xlsread('C:\Users\Administrator\Desktop\第7篇\程序\计算机硬件\machine','I10:I17'); %公布的性能表现
%X2=xlsread('C:\Users\Administrator\Desktop\第7篇\程序\计算机硬件\machine','J10:J17'); %原始方法中的性能表现
%[U_O1,I_X1]=sort(X1','descend');
%[U_O2,I_X2]=sort(X2','descend');
H=mean(TA);
%H=(max(TA)+min(TA))/2;
[Rank,f_POS,f_BND,f_NEG]=lunwen7(TA,W,H);
I1=topsis(TA,W);
I2=WAA(TA,W);

%张凯TFS
Q=0.4;%风险规避系数
[PX5_jue,f_DOM1_jue,f_DOM2_jue,f_DOM3_jue,juedui_POS,juedui_NEG]=lunwen5_jue(TA,W,H,Q);
 [PX5_xiang,f_DOM1_xiang,f_DOM2_xiang,f_DOM3_xiang,xiangdui_POS,xiangdui_NEG]=lunwen5_xiang(TA,W,H,Q);

%贾凡
 [Jia_px1,Jia_px2,Jia_px3]=Jia(TA,W,Q);
 
 %蒋海波TFS，第一篇,使用第三种邻域
 p=0.5;  %beta值
 k=0.1;  %变精度值
 [Jiang1_rank]=Jiang_1(TA,W,p,k);
 
 
% %PAI=[Rank;I1;I2;I_X1;I_X2;PX5];
 PAI=[Rank;I1;I2;PX5_jue;PX5_xiang;Jia_px1;Jia_px2;Jia_px3;Jiang1_rank];
% PPPP1=Spearman(PAI)
% PPPP2=relative_volatility(PAI)


% 
data = [Rank',I1',I2',PX5_jue',PX5_xiang',Jia_px1',Jia_px2',Jia_px3',Jiang1_rank'];                           % 将数据组集到data
[m_data, n_data] = size(data);            
data_cell = mat2cell(data, ones(m_data,1), ones(n_data,1)); % 将data切割成m_data*n_data的cell矩阵
title = {'本文方法', 'TOPSIS', 'WAA', '张凯TFS绝对', '张凯TFS相对', '贾凡alpha', '贾凡beta', '贾凡gamma','蒋海波TFS1'};  % 添加变量名称
result = [title; data_cell];   % 将变量名称和数值组集到result
s=xlswrite('paixu_7_4.xls', result);    % 将result写入到paixu.xls文件中





