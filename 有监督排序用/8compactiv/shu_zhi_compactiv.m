clc
close all
clear all
X=xlsread('C:\Users\Administrator\Desktop\��������ʵ��\ʵ�顪�ع顪compactiv\compactiv','A1:U8192');
J = [2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 1];
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
RTR=A;%���ݹ淶�����
%W=[0.15,0.2,0.1,0.25,0.1,0.2];
W=ones(1,n).*(1/n);
%W=shang_quan(RTR);
X1=xlsread('C:\Users\Administrator\Desktop\��������ʵ��\ʵ�顪�ع顪compactiv\compactiv','V1:V8192');
%X2=xlsread('C:\Users\Administrator\Desktop\���� ����д����\������2ƪ- ׼��ƫ���µ���֧��׼����߷���\����\����\ʵ�����\ʵ�顪�ع顪Concrete\Concrete-Compressive-Strength','A2:H1031'); %Y2
[A1,Br1,BR1]=weizhi_fen(X1');
%[A2,Br2,BR2]=weizhi_fen(X2');




mu_biao=mean(RTR);
k_lei=4;
rho=0.45;

%---------------TOPSIS
I=topsis(RTR,W);

%---------------WAA
[wA,wm,wn]=WAA(RTR,W);

% %�ſ�TFS,two
[PX5_xiang,f_DOM1_xiang,f_DOM2_xiang,f_DOM3_xiang,xiangdui_POS,xiangdui_NEG]=Zhang202138413856_xiang(RTR,W,mu_biao,rho);
[PX5_jue,f_DOM1_jue,f_DOM2_jue,f_DOM3_jue,juedui_POS,juedui_NEG]=Zhang202138413856_jue(RTR,W,mu_biao,rho);

% %�ַ�,three
 [T1,Jia_px1,T2,Jia_px2,T3,Jia_px3]=Jia20192951(RTR,W,rho);

 
 %���ķ���
[gui_fan_ju_zhen,oldcentroid,idx,C,gai_lv,AN_SUNSHI,AN_yuzhi,N_xiao,P_11,B_11,N_11,N_da,POS,BND,NEG,sheng_yu_xu,PX]=anda2(RTR,W,mu_biao,k_lei,rho);

 
 
data = [PX',wn',I',PX5_jue',PX5_xiang',Jia_px1',Jia_px2',Jia_px3'];                           % �����������鼯��data
[m_data, n_data] = size(data);            
data_cell = mat2cell(data, ones(m_data,1), ones(n_data,1)); % ��data�и��m_data*n_data��cell����
title = {'���ķ���','WA','TOPSIS', 'Zhang202138413856_jue','Zhang202138413856_xiang','Jia1', 'Jia2','Jia3'};  % ��ӱ�������
result = [title; data_cell];   % ���������ƺ���ֵ�鼯��result
s=xlswrite('paixu_compactiv.xls', result);  % ��resultд�뵽paixu.xls�ļ���



data31= [PX',wn',I',PX5_jue',PX5_xiang',Jia_px1',Jia_px2',Jia_px3',A1'];   
RO=relative_volatility(data31');
data3=RO';                           % �����������鼯��data
[m_data3, n_data3] = size(data3);            
data_cell3 = mat2cell(data3, ones(m_data3,1), ones(n_data3,1)); % ��data�и��m_data*n_data��cell����
title3 = {'���ķ���','WA','TOPSIS', 'Zhang202138413856_jue','Zhang202138413856_xiang','Jia1', 'Jia2','Jia3','A1'};  % ��ӱ�������
result3 = [title3; data_cell3];   % ���������ƺ���ֵ�鼯��result
s3=xlswrite('volatility_compactiv.xls', result3);    % ��resultд�뵽�ļ���


A=data';
[a,b]=size(A);
B=[];
for c=1:a
    C=A(c,:);
    [D,IX]=sort(C);
    B=[B;IX];
end
B1=[B;BR1];  %����Ǽ��ַ����£������λ�÷���,������˹Ƥ����������������
%writematrix(B1,'weizhi_bufen.xls','Range','A1:M13');

data1 =B1';                           % �����������鼯��data
[m_data1, n_data1] = size(data1);            
data_cell1 = mat2cell(data1, ones(m_data1,1), ones(n_data1,1)); % ��data�и��m_data*n_data��cell����
title1 = {'���ķ���','WA','TOPSIS', 'Zhang202138413856_jue','Zhang202138413856_xiang','Jia1', 'Jia2','Jia3','BR1'};  % ��ӱ�������
result1 = [title1; data_cell1];   % ���������ƺ���ֵ�鼯��result
s1=xlswrite('weizhi_compactiv.xls', result1);    % ��resultд�뵽paixu.xls�ļ���





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
data2=P';                           % �����������鼯��data
[m_data2, n_data2] = size(data2);            
data_cell2 = mat2cell(data2, ones(m_data2,1), ones(n_data2,1)); % ��data�и��m_data*n_data��cell����
title2 = {'���ķ���','WA','TOPSIS', 'Zhang202138413856_jue','Zhang202138413856_xiang','Jia1', 'Jia2','Jia3','BR1'};  % ��ӱ�������
result2 = [title2; data_cell2];   % ���������ƺ���ֵ�鼯��result
s2=xlswrite('Spearman_compactiv.xls', result2);    % ��resultд�뵽paixu.xls�ļ���




 