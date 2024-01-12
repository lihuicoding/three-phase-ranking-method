clc
close all
clear all
X=xlsread('C:\Users\Administrator\Desktop\数据增加实验\实验—回归—compactiv\compactiv','A1:U8192');
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
RTR=A;%数据规范化后的
%W=[0.15,0.2,0.1,0.25,0.1,0.2];
W=ones(1,n).*(1/n);
%W=shang_quan(RTR);
X1=xlsread('C:\Users\Administrator\Desktop\数据增加实验\实验—回归—compactiv\compactiv','V1:V8192');
%X2=xlsread('C:\Users\Administrator\Desktop\工作 安大写文章\工作第2篇- 准则偏好下的三支多准则决策方法\程序\本身\实验分析\实验—回归—Concrete\Concrete-Compressive-Strength','A2:H1031'); %Y2
[A1,Br1,BR1]=weizhi_fen(X1');
%[A2,Br2,BR2]=weizhi_fen(X2');




mu_biao=mean(RTR);
k_lei=4;
rho=0.45;

%---------------TOPSIS
I=topsis(RTR,W);

%---------------WAA
[wA,wm,wn]=WAA(RTR,W);

% %张凯TFS,two
[PX5_xiang,f_DOM1_xiang,f_DOM2_xiang,f_DOM3_xiang,xiangdui_POS,xiangdui_NEG]=Zhang202138413856_xiang(RTR,W,mu_biao,rho);
[PX5_jue,f_DOM1_jue,f_DOM2_jue,f_DOM3_jue,juedui_POS,juedui_NEG]=Zhang202138413856_jue(RTR,W,mu_biao,rho);

% %贾凡,three
 [T1,Jia_px1,T2,Jia_px2,T3,Jia_px3]=Jia20192951(RTR,W,rho);

 
 %本文方法
[gui_fan_ju_zhen,oldcentroid,idx,C,gai_lv,AN_SUNSHI,AN_yuzhi,N_xiao,P_11,B_11,N_11,N_da,POS,BND,NEG,sheng_yu_xu,PX]=anda2(RTR,W,mu_biao,k_lei,rho);

 
 
data = [PX',wn',I',PX5_jue',PX5_xiang',Jia_px1',Jia_px2',Jia_px3'];                           % 将排序数据组集到data
[m_data, n_data] = size(data);            
data_cell = mat2cell(data, ones(m_data,1), ones(n_data,1)); % 将data切割成m_data*n_data的cell矩阵
title = {'本文方法','WA','TOPSIS', 'Zhang202138413856_jue','Zhang202138413856_xiang','Jia1', 'Jia2','Jia3'};  % 添加变量名称
result = [title; data_cell];   % 将变量名称和数值组集到result
s=xlswrite('paixu_compactiv.xls', result);  % 将result写入到paixu.xls文件中



data31= [PX',wn',I',PX5_jue',PX5_xiang',Jia_px1',Jia_px2',Jia_px3',A1'];   
RO=relative_volatility(data31');
data3=RO';                           % 将排序数据组集到data
[m_data3, n_data3] = size(data3);            
data_cell3 = mat2cell(data3, ones(m_data3,1), ones(n_data3,1)); % 将data切割成m_data*n_data的cell矩阵
title3 = {'本文方法','WA','TOPSIS', 'Zhang202138413856_jue','Zhang202138413856_xiang','Jia1', 'Jia2','Jia3','A1'};  % 添加变量名称
result3 = [title3; data_cell3];   % 将变量名称和数值组集到result
s3=xlswrite('volatility_compactiv.xls', result3);    % 将result写入到文件中


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
title1 = {'本文方法','WA','TOPSIS', 'Zhang202138413856_jue','Zhang202138413856_xiang','Jia1', 'Jia2','Jia3','BR1'};  % 添加变量名称
result1 = [title1; data_cell1];   % 将变量名称和数值组集到result
s1=xlswrite('weizhi_compactiv.xls', result1);    % 将result写入到paixu.xls文件中





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
title2 = {'本文方法','WA','TOPSIS', 'Zhang202138413856_jue','Zhang202138413856_xiang','Jia1', 'Jia2','Jia3','BR1'};  % 添加变量名称
result2 = [title2; data_cell2];   % 将变量名称和数值组集到result
s2=xlswrite('Spearman_compactiv.xls', result2);    % 将result写入到paixu.xls文件中




 