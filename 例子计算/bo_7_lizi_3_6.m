clc
close all
clear all
X=[0.67 0.93 0.77
0.73 0.51 0.55
0.33  0.78 0.75 
0.96  0.49 0.73];%%%行为对象，列为准则  
J = [1 1 2 1 1 1 2 1];
[m,n] = size(X);
TA=X;
W=[0.35,0.35,0.3];
H=[ 0.73    0.7    0.65];%面向准则的模糊概念H，h_j
%H=[ 0.73    0.17    0.15     0.83    0.11     0.25    0.95     0.98];%面向准则的模糊概念H，h_j
X1=ones(1,n);    %每个准则上的绝对最大评价值组合的模糊集，称绝对最大模糊集
X0=zeros(1,n);   %每个准则上的绝对最小评价值组合的模糊集，称绝对最小模糊集
d_01=Dist(W,H,X0);   %面向准则的模糊概念H和绝对最小模糊集之间的加权距离
d_11=Dist(W,H,X1);   %面向准则的模糊概念H和绝对最大模糊集之间的加权距离

DD1=[];
DD2=[];
for i=1:m
    dd1=Dist(W,X0,TA(i,:));
    dd2=Dist(W,X1,TA(i,:));
    DD1=[DD1,dd1];
    DD2=[DD2,dd2];
end
DD1; %对象模糊集合和绝对最小模糊集之间的加权距离
DD2; %对象模糊集合和绝对最大模糊集之间的加权距离

%正域POS
POS=[];
for i=1:m
    if Dist(W,X0,TA(i,:))>=d_01 && Dist(W,X1,TA(i,:))<=d_11   
        p1=1;
    else
        p1=0;
    end
        POS=[POS,p1];  
end
POS   %分类到正域中的对象

f_POS=find(POS==1);
TA_POS=TA(f_POS,:);   % 提取正域中的对象，所对应的原始数据
I_POS=topsis(TA_POS,W); %使用TOPSIS方法获得的，正域内的对象的排序
%由于自动的顺序问题，新的矩阵数据的排序下标需要对应原始对象集合的下标
P_POS=[]; 
for j=1:length(I_POS)
    p_POS=f_POS(1,I_POS(1,j));
    P_POS=[P_POS,p_POS];
end
P_POS;  %最终的正域中的排序

%边界域BND
BND=[];
for i=1:m
    if (Dist(W,X0,TA(i,:))>d_01 && Dist(W,X1,TA(i,:))>d_11) || (Dist(W,X0,TA(i,:))<d_01 && Dist(W,X1,TA(i,:))<d_11)  
        p2=1;
    else
        p2=0;
    end
        BND=[BND,p2];  
end
BND  %分类到边界域中的对象


f_BND=find(BND==1);
TA_BND=TA(f_BND,:);   % 提取边界域中的对象，所对应的原始数据
I_BND=topsis(TA_BND,W); %使用TOPSIS方法获得的，边界域内的对象的排序
%由于自动的顺序问题，新的矩阵数据的排序下标需要对应原始对象集合的下标
P_BND=[]; 
for j=1:length(I_BND)
    p_BND=f_BND(1,I_BND(1,j));
    P_BND=[P_BND,p_BND];
end
P_BND;  %最终的边界域中的排序

%负域BND
NEG=[];
for i=1:m
    if (Dist(W,X0,TA(i,:))<=d_01 && Dist(W,X1,TA(i,:))>=d_11) && (~(Dist(W,X0,TA(i,:))==d_01 && Dist(W,X1,TA(i,:))==d_11))  
        p3=1;
    else
        p3=0;
    end
        NEG=[NEG,p3];  
end
NEG  %分类到负域中的对象

f_NEG=find(NEG==1);
TA_NEG=TA(f_NEG,:);   % 提取负域中的对象，所对应的原始数据
I_NEG=topsis(TA_NEG,W); %使用TOPSIS方法获得的，负域内的对象的排序
%由于自动的顺序问题，新的矩阵数据的排序下标需要对应原始对象集合的下标
P_NEG=[]; 
for j=1:length(I_NEG)
    p_NEG=f_NEG(1,I_NEG(1,j));
    P_NEG=[P_NEG,p_NEG];
end
P_NEG;  %最终的负域中的排序

Rank=[P_POS P_BND P_NEG]  %最终排序







