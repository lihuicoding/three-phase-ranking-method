clc
close all
clear all
%X=xlsread('C:\Users\Administrator\Desktop\��7ƪ\����\�޼ල������\3���Ѿ�\winequality-red','F18:K21');
X1=xlsread('C:\Users\Administrator\Desktop\��7ƪ\����\�޼ල������\3���Ѿ�\winequality-white','H2:K4899');
X=X1([15 16 17 18 47],:);
J = [2 1 2 1];
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
W=[0.15,0.2,0.3,0.35];
%W=ones(1,n).*(1/n);
%X1=xlsread('C:\Users\Administrator\Desktop\��7ƪ\����\�����Ӳ��\machine','I10:I17'); %���������ܱ���
%X2=xlsread('C:\Users\Administrator\Desktop\��7ƪ\����\�����Ӳ��\machine','J10:J17'); %ԭʼ�����е����ܱ���
%[U_O1,I_X1]=sort(X1','descend');
%[U_O2,I_X2]=sort(X2','descend');
H=mean(TA);
%H=(max(TA)+min(TA))/2;
[Rank,f_POS,f_BND,f_NEG]=lunwen7(TA,W,H);
I1=topsis(TA,W);
I2=WAA(TA,W);

%�ſ�TFS
Q=0.4;%���չ��ϵ��
[PX5_jue,f_DOM1_jue,f_DOM2_jue,f_DOM3_jue]=lunwen5_jue(TA,W,H,Q);
 [PX5_xiang,f_DOM1_xiang,f_DOM2_xiang,f_DOM3_xiang]=lunwen5_xiang(TA,W,H,Q);
%�ַ�
 [Jia_px1,Jia_px2,Jia_px3]=Jia(TA,W,Q);
 
 %������TFS����һƪ,ʹ�õ���������
 p=0.5;  %betaֵ
 k=0.1;  %�侫��ֵ
 [Jiang1_rank]=Jiang_1(TA,W,p,k);
 
 
%PAI=[Rank;I1;I2;I_X1;I_X2;PX5];
PAI=[Rank;I1;I2;PX5_jue;PX5_xiang;Jia_px1;Jia_px2;Jia_px3;Jiang1_rank];
PPPP1=Spearman(PAI)
PPPP2=relative_volatility(PAI)



data = [Rank',I1',I2',PX5_jue',PX5_xiang',Jia_px1',Jia_px2',Jia_px3',Jiang1_rank'];                           % �������鼯��data
[m_data, n_data] = size(data);            
data_cell = mat2cell(data, ones(m_data,1), ones(n_data,1)); % ��data�и��m_data*n_data��cell����
title = {'���ķ���', 'TOPSIS', 'WAA', '�ſ�TFS����', '�ſ�TFS���', '�ַ�alpha', '�ַ�beta', '�ַ�gamma','������TFS1'};  % ��ӱ�������
result = [title; data_cell];   % ���������ƺ���ֵ�鼯��result
s=xlswrite('paixu_7_5.xls', result);    % ��resultд�뵽paixu.xls�ļ���









