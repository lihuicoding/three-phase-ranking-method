clc
close all
clear all
X=xlsread('C:\Users\Administrator\Desktop\���� ����д����\������2ƪ- ׼��ƫ���µ���֧��׼����߷���\����\����\ʵ�����\ʵ�顪������ࡪ���������ǻ���\Algerian_forest_fires','D3:M246'); 
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
RTR=A;%���ݹ淶�����
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

% %�ſ�TFS,two
[PX5_xiang,f_DOM1_xiang,f_DOM2_xiang,f_DOM3_xiang,xiangdui_POS,xiangdui_NEG]=Zhang202138413856_xiang(RTR,W,mu_biao,rho);
[PX5_jue,f_DOM1_jue,f_DOM2_jue,f_DOM3_jue,juedui_POS,juedui_NEG]=Zhang202138413856_jue(RTR,W,mu_biao,rho);

% %�ַ�,three
 [T1,Jia_px1,T2,Jia_px2,T3,Jia_px3]=Jia20192951(RTR,W,rho);
%  [A3,Br3,BR_alpha]=weizhi_fen2(T1);
%  [A4,Br4,BR_beta]=weizhi_fen2(T2);
%  [A5,Br5,BR_gamma]=weizhi_fen2(T3);
 %���ķ���
[gui_fan_ju_zhen,oldcentroid,idx,C,gai_lv,AN_SUNSHI,AN_yuzhi,N_xiao,P_11,B_11,N_11,N_da,POS,BND,NEG,sheng_yu_xu,PX]=anda2(RTR,W,mu_biao,k_lei,rho);

 
 
data = [PX',wn',I',PX5_jue',PX5_xiang',Jia_px1',Jia_px2',Jia_px3'];                           % �����������鼯��data
% [m_data, n_data] = size(data);            
% data_cell = mat2cell(data, ones(m_data,1), ones(n_data,1)); % ��data�и��m_data*n_data��cell����
% title = {'���ķ���','WA','TOPSIS', 'Zhang202138413856_jue','Zhang202138413856_xiang','Jia1', 'Jia2','Jia3'};  % ��ӱ�������
% result = [title; data_cell];   % ���������ƺ���ֵ�鼯��result
% s=xlswrite('paixu_Algerian.xls', result);  % ��resultд�뵽 �ļ���


ranking=data';
class=xlsread('C:\Users\Administrator\Desktop\���� ����д����\������2ƪ- ׼��ƫ���µ���֧��׼����߷���\����\����\ʵ�����\ʵ�顪������ࡪ���������ǻ���\Algerian_forest_fires','P3:P246'); 
[EI]=Ob_EI(ranking,class);
% writematrix(EI,'youxu_fenlei_Algerian.xls','Range','A1:H1');
EII=[EII;EI];
end

rr=0.1:0.01:0.49;
EIII=[rr',EII];

data3=EIII;                           % �����������鼯��data
[m_data3, n_data3] = size(data3);            
data_cell3 = mat2cell(data3, ones(m_data3,1), ones(n_data3,1)); % ��data�и��m_data*n_data��cell����
title3 = {'����','���ķ���','WA','TOPSIS', 'Zhang202138413856_jue','Zhang202138413856_xiang','Jia1', 'Jia2','Jia3'};  % ��ӱ�������
result3 = [title3; data_cell3];   % ���������ƺ���ֵ�鼯��result
s3=xlswrite('youxu_fenlei_Algerian.xls', result3);    % ��resultд�뵽�ļ���

% P=Spearman(data');
% data2=P';                           % �����������鼯��data
% [m_data2, n_data2] = size(data2);            
% data_cell2 = mat2cell(data2, ones(m_data2,1), ones(n_data2,1)); % ��data�и��m_data*n_data��cell����
% title2 = {'���ķ���','WA','TOPSIS', 'Zhang202138413856_jue','Zhang202138413856_xiang','Jia1', 'Jia2','Jia3','BR_alpha','BR_beta','BR_gamma','BR1','BR2'};  % ��ӱ�������
% result2 = [title2; data_cell2];   % ���������ƺ���ֵ�鼯��result
% s2=xlswrite('Spearman_machine.xls', result2);    % ��resultд�뵽paixu.xls�ļ���
% 
%  

 