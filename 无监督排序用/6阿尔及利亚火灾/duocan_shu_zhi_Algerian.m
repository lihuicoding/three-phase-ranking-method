clc
close all
clear all
X=xlsread('C:\Users\Administrator\Desktop\工作 安大写文章\工作第2篇- 准则偏好下的三支多准则决策方法\程序\本身\实验分析\实验—有序分类—阿尔及利亚火灾\Algerian_forest_fires','D3:M246'); 
J = [1 2 2 2 1 1 1 1 1 1];
[m,n] = size(X);
A=zeros(m,n);
for j = 1:n
	if J(j) == 1
       %A(:,j) = X(:,j)./max(X(:,j));
       A(:,j) = X(:,j)./max(X(:,j));
  %A(:,j) = (X(:,j)-min(X(:,j)))./(max(X(:,j))-min(X(:,j)));
    else
        %A(:,j) = min(X(:,j))./X(:,j);
        A(:,j) = 1-X(:,j)./max(X(:,j));
   %A(:,j) = (max(X(:,j))-X(:,j))./(max(X(:,j))-min(X(:,j)));
	end    
end
RTR=A;%数据规范化后的
%W=[0.25,0.3,0.2,0.25];
W=ones(1,n).*(1/n);


mu_biao=mean(RTR);
k_lei=2;
EII=[];
for rho=0.1:0.01:0.49 
 

%---------------TOPSIS
I=topsis(RTR,W);

%---------------WAA
[wA,wm,wn]=WAA(RTR,W);

% %张凯TFS,two
[PX5_xiang,f_DOM1_xiang,f_DOM2_xiang,f_DOM3_xiang,xiangdui_POS,xiangdui_NEG]=Zhang202138413856_xiang(RTR,W,mu_biao,rho);
[PX5_jue,f_DOM1_jue,f_DOM2_jue,f_DOM3_jue,juedui_POS,juedui_NEG]=Zhang202138413856_jue(RTR,W,mu_biao,rho);

% %贾凡,three
 [T1,Jia_px1,T2,Jia_px2,T3,Jia_px3]=Jia20192951(RTR,W,rho);
%  [A3,Br3,BR_alpha]=weizhi_fen2(T1);
%  [A4,Br4,BR_beta]=weizhi_fen2(T2);
%  [A5,Br5,BR_gamma]=weizhi_fen2(T3);
 %本文方法
[gui_fan_ju_zhen,oldcentroid,idx,C,gai_lv,AN_SUNSHI,AN_yuzhi,N_xiao,P_11,B_11,N_11,N_da,POS,BND,NEG,sheng_yu_xu,PX]=anda2(RTR,W,mu_biao,k_lei,rho);

 
 
data = [PX',wn',I',PX5_jue',PX5_xiang',Jia_px1',Jia_px2',Jia_px3'];                           % 将排序数据组集到data
% [m_data, n_data] = size(data);            
% data_cell = mat2cell(data, ones(m_data,1), ones(n_data,1)); % 将data切割成m_data*n_data的cell矩阵
% title = {'本文方法','WA','TOPSIS', 'Zhang202138413856_jue','Zhang202138413856_xiang','Jia1', 'Jia2','Jia3'};  % 添加变量名称
% result = [title; data_cell];   % 将变量名称和数值组集到result
% s=xlswrite('paixu_Algerian.xls', result);  % 将result写入到 文件中


ranking=data';
class=xlsread('C:\Users\Administrator\Desktop\工作 安大写文章\工作第2篇- 准则偏好下的三支多准则决策方法\程序\本身\实验分析\实验—有序分类—阿尔及利亚火灾\Algerian_forest_fires','P3:P246'); 
[EI]=Ob_EI(ranking,class);
% writematrix(EI,'youxu_fenlei_Algerian.xls','Range','A1:H1');
EII=[EII;EI];
end

rr=0.1:0.01:0.49;
EIII=[rr',EII];

data3=EIII;                           % 将排序数据组集到data
[m_data3, n_data3] = size(data3);            
data_cell3 = mat2cell(data3, ones(m_data3,1), ones(n_data3,1)); % 将data切割成m_data*n_data的cell矩阵
title3 = {'参数','本文方法','WA','TOPSIS', 'Zhang202138413856_jue','Zhang202138413856_xiang','Jia1', 'Jia2','Jia3'};  % 添加变量名称
result3 = [title3; data_cell3];   % 将变量名称和数值组集到result
s3=xlswrite('youxu_fenlei_Algerian.xls', result3);    % 将result写入到文件中

% P=Spearman(data');
% data2=P';                           % 将排序数据组集到data
% [m_data2, n_data2] = size(data2);            
% data_cell2 = mat2cell(data2, ones(m_data2,1), ones(n_data2,1)); % 将data切割成m_data*n_data的cell矩阵
% title2 = {'本文方法','WA','TOPSIS', 'Zhang202138413856_jue','Zhang202138413856_xiang','Jia1', 'Jia2','Jia3','BR_alpha','BR_beta','BR_gamma','BR1','BR2'};  % 添加变量名称
% result2 = [title2; data_cell2];   % 将变量名称和数值组集到result
% s2=xlswrite('Spearman_machine.xls', result2);    % 将result写入到paixu.xls文件中
% 
%  

 