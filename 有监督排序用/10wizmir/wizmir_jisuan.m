clc
close all
clear all
X=xlsread('C:\Users\张凯凯\Desktop\张bo7程序\有监督排序用\10wizmir\wizmir','A1:I1461');
J = [1 1 1 2 2 1 1 1 2];
[m,n] = size(X);
A=zeros(m,n);
for j = 1:n
	if J(j) == 1
       %A(:,j) = X(:,j)./sqrt(sum(X(:,j).^2));
       A(:,j) = X(:,j)./max(X(:,j));
       %A(:,j) = X(:,j)./max(X(:,j));
  %A(:,j) = (X(:,j)-min(X(:,j)))./(max(X(:,j))-min(X(:,j)));
    else
        %A(:,j) = min(X(:,j))./X(:,j);
        A(:,j) = 1-X(:,j)./max(X(:,j));
        %A(:,j) =1-X(:,j)./sqrt(sum(X(:,j).^2));
   %A(:,j) = (max(X(:,j))-X(:,j))./(max(X(:,j))-min(X(:,j)));
	end    
end
TA=A;%数据规范化后的
%W=[0.15,0.2,0.1,0.25,0.1,0.2];
W=ones(1,n).*(1/n);
%W=shang_quan(RTR);
%X1=xlsread('C:\Users\Administrator\Desktop\数据增加实验\实验—回归—abalone\abalone','I14:I4190');
X1=xlsread('C:\Users\张凯凯\Desktop\张bo7程序\有监督排序用\10wizmir\wizmir','J1:J1461');
%X2=xlsread('C:\Users\Administrator\Desktop\工作 安大写文章\工作第2篇- 准则偏好下的三支多准则决策方法\程序\本身\实验分析\实验—回归—Concrete\Concrete-Compressive-Strength','A2:H1031'); %Y2
[A1,Br1,BR1]=weizhi_fen(X1');
%[A2,Br2,BR2]=weizhi_fen(X2');




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


%PAI=[Rank;I1;I2;PX5_jue;PX5_xiang;Jia_px1;Jia_px2;Jia_px3;Jiang1_rank];
data = [Rank',I1',I2',PX5_jue',PX5_xiang',Jia_px1',Jia_px2',Jia_px3',Jiang1_rank'];                           % 将数据组集到data
[m_data, n_data] = size(data);            
data_cell = mat2cell(data, ones(m_data,1), ones(n_data,1)); % 将data切割成m_data*n_data的cell矩阵
title = {'本文方法', 'TOPSIS', 'WAA', '张凯TFS绝对', '张凯TFS相对', '贾凡alpha', '贾凡beta', '贾凡gamma','蒋海波TFS1'};  % 添加变量名称
result = [title; data_cell];   % 将变量名称和数值组集到result
s=xlswrite('paixu_wizmir.xls', result);    % 将result写入到paixu.xls文件中
 


data31= [Rank',I1',I2',PX5_jue',PX5_xiang',Jia_px1',Jia_px2',Jia_px3',Jiang1_rank',A1'];   
RO=relative_volatility(data31');
data3=RO';                           % 将排序数据组集到data
[m_data3, n_data3] = size(data3);            
data_cell3 = mat2cell(data3, ones(m_data3,1), ones(n_data3,1)); % 将data切割成m_data*n_data的cell矩阵
title3 = {'本文方法', 'TOPSIS', 'WAA', '张凯TFS绝对', '张凯TFS相对', '贾凡alpha', '贾凡beta', '贾凡gamma','蒋海波TFS1','A1'};  % 添加变量名称
result3 = [title3; data_cell3];   % 将变量名称和数值组集到result
s3=xlswrite('LRI_wizmir.xls', result3);    % 将result写入到文件中


A=data';
[a,b]=size(A);
B=[];
for c=1:a
    C=A(c,:);
    [D,IX]=sort(C);
    B=[B;IX];
end
B1=[B;BR1];  %这个是几种方法下，对象的位置分数,可用于斯皮尔曼，可用于排序
%writematrix(B1,'weizhi_bufen.xls','Range','A1:M13');

data1 =B1';                           % 将排序数据组集到data
[m_data1, n_data1] = size(data1);            
data_cell1 = mat2cell(data1, ones(m_data1,1), ones(n_data1,1)); % 将data切割成m_data*n_data的cell矩阵
title1 = {'本文方法', 'TOPSIS', 'WAA', '张凯TFS绝对', '张凯TFS相对', '贾凡alpha', '贾凡beta', '贾凡gamma','蒋海波TFS1','BR1'};  % 添加变量名称
result1 = [title1; data_cell1];   % 将变量名称和数值组集到result
s1=xlswrite('weizhi_wizmir.xls', result1);    % 将result写入到paixu.xls文件中





[ab,ba]=size(B1);
P=[];
for a1=1:ab
    P1=[];
    for a2=1:ab
    pi=1-(6.*(sum((B1(a1,:)-B1(a2,:)).^2)))./(ba.*(ba.^2-1));
    P1=[P1;pi];
    end
    P=[P,P1];
end
P=P;

%PPPP1=Spearman(data');
%writematrix(P,'Spearman_bufen.xls','Range','A1:M13');
data2=P';                           % 将排序数据组集到data
[m_data2, n_data2] = size(data2);            
data_cell2 = mat2cell(data2, ones(m_data2,1), ones(n_data2,1)); % 将data切割成m_data*n_data的cell矩阵
title2 = {'本文方法', 'TOPSIS', 'WAA', '张凯TFS绝对', '张凯TFS相对', '贾凡alpha', '贾凡beta', '贾凡gamma','蒋海波TFS1','BR1'};  % 添加变量名称
result2 = [title2; data_cell2];   % 将变量名称和数值组集到result
s2=xlswrite('GRI_wizmir.xls', result2);    % 将result写入到paixu.xls文件中




 