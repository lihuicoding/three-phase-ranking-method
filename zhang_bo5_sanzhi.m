clc
close all
clear all
X=xlsread('C:\Users\Administrator\Desktop\第7篇\程序\二分类任务\6appendicitis\appendicitis','A1:G106');
J = [1 1 1 1 1 1 1];
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
[a,b] = size(X);
 
TTTT=sum(A)./8
%bbbb=mean(TA);
bbbb=max(TA);
%bbbb=(max(TA)+min(TA))/2;
cccc=1-bbbb%l_j
Q=0.4;%rho
%------------------------------------------------- 
W=ones(1,n).*(1/n);


FF=TA*W';
FFF=bbbb*W';
FFFF=cccc*W';

 ba1=max(TA); %每一列最大值，正理想
 ba2=min(TA);%每一列最小值，负理想
 
% ap=0.4;
% bbbb=ap*ba1+(1-ap)*ba2;
%bbbb=sum(TA)/a

LD=[];
UD=[];
for aa1=1:a
    ld1=sum(max(0,TA(aa1,:)-bbbb(1,:)).*W);
    ud2=sum(max(0,bbbb(1,:)-TA(aa1,:)).*W);
    LD=[LD,ld1];
    UD=[UD,ud2];
end
ab1=LD              %%%加权状态损失,正理想
ab2=UD              %%%加权负状态损失，负理想

 SBP=Q*ab1; 
SNP=ab1; 
SPN=ab2; 
SBN=Q*ab2;
SPP=zeros(1,a); 
SNN=zeros(1,a);
 
%----------------------------------- 计算条件概率（模糊条件下的概率计算公式）

% NCX1=[];
% for j=1:a
%     ncx1=TA(j,:).*bbbb;
%     NCX1=[NCX1;ncx1];
% end
% CPC1=sum(NCX1');
% CP1=[];
% for k=1:a
%     cp1=CPC1(1,k)./(sum(TA(k,:)));
%     CP1=[CP1,cp1];            %%%%%%%条件概率
% end
%CP1%每个对象关于综合理想解的概率



 B=bbbb;
[u,v]=size(B);
LB=[];
UB=[];
for q=1:a
    ILB=[];
    TUB=[];
    for p=1:u
        L=[];
        U=[];
        for n=v;s=1:b;
            DL=max(1-TA(q,s),B(p,s));
            DU=min(TA(q,s),B(p,s));
            L=[L;DL];
            U=[U;DU];
        end
        n1=min(L);
        n2=max(U);
        ILB=[ILB;n1];
        TUB=[TUB;n2];
    end
    ILB=ILB';
    TUB=TUB';
    LB=[LB;ILB];
    UB=[UB;TUB];
end
   CP1=LB' 
   %CP1=UB' 





%%%-------------------------------------------- 计算阈值
alpha=(SPN-SBN)./((SPN-SBN)+(SBP-SPP))   %%%%%阿尔法
gamma=(SPN-SNN)./((SPN-SNN)+(SNP-SPP))   %%%%%伽玛
beta=(SBN-SNN)./((SBN-SNN)+(SNP-SBP))   %%%%%贝塔
T1=alpha;
T2=gamma;
T3=beta;
%%%--------------------------------. 求三个域和决策规则（模糊决策理论粗糙集）
DOM1=[];  %正域
DOM2=[];  %边界域
DOM3=[];  %负域
for a12=1:a
    if T1(1,a12)==0 && T3(1,a12)==0
        pos=1;
    else if T1(1,a12)==1 && T3(1,a12)==1
        pos=0;
        else if CP1(1,a12)>=T1(1,a12)
        pos=1;
            else
        pos=0;
            end
        end
    end
    DOM1=[DOM1,pos];
end
for a13=1:a
    if T3(1,a13)<CP1(1,a13) && CP1(1,a13)<T1(1,a13)
        bnd=1;
    else
        bnd=0;
    end
   DOM2=[DOM2,bnd];
end
for a14=1:a
    if T1(1,a12)==0 && T3(1,a12)==0
        neg=0;
    else if T1(1,a12)==1 && T3(1,a12)==1
        neg=1;
        else if CP1(1,a14)<=T3(1,a14)
        neg=1;
            else
        neg=0;
            end
        end
    end
    DOM3=[DOM3,neg];
end

CCP=1-CP1;  %%%补概率（坏状态的概率）
RP=(SPP.*CP1+SPN.*CCP).*DOM1   %%%正域相关损失
RB=(SBP.*CP1+SBN.*CCP).*DOM2   %%%边界域相关损失
RN=(SNP.*CP1+SNN.*CCP).*DOM3   %%%负域相关损失
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%正域排序

P_O1=find(DOM1==1);  %%%%%%%%%%%%%%%%%%%%%%%%%%分类到正域中的对象的位置
P_O2=RP(:,P_O1);   % 提取正域中的对象，所对应的相关损失
P_O2_0=find(P_O2==0);  %%%%%%%%%%%%%%%%%%%%%%%%%%分类到正域中的对象的期望损失为0的位置
P_O2_00=P_O1(:,P_O2_0);   % 提取期望损失为0的位置
[P_O3,P_O4]=sort(P_O2);
P_X1=[];
for a_P=1:length(P_O4) 
    P_x1=P_O1(1,P_O4(1,a_P));
    P_X1=[P_X1,P_x1];
end
P_X1;

 
B_O1=find(DOM2==1);  %%%%%%%%%%%%%%%%%%%%%%%%%%分类到边界域中的对象的位置
B_O2=RB(:,B_O1);   % 提取边界域中的对象，所对应的相关损失
B_O2_0=find(B_O2==0);  %%%%%%%%%%%%%%%%%%%%%%%%%%分类到边界域中的对象的期望损失为0的位置
B_O2_00=B_O1(:,B_O2_0);    % 提取期望损失为0的位置
[B_O3,B_O4]=sort(B_O2);
B_X1=[];
for a_B=1:length(B_O4) 
    B_x1=B_O1(1,B_O4(1,a_B));
    B_X1=[B_X1,B_x1];
end
B_X1;




N_O1=find(DOM3==1);  %%%%%%%%%%%%%%%%%%%%%%%%%%分类到负域中的对象的位置
N_O2=RN(:,N_O1);   % 提取负域中的对象，所对应的相关损失
N_O2_0=find(N_O2==0);  %%%%%%%%%%%%%%%%%%%%%%%%%%分类到负域中的对象的期望损失为0的位置
N_O2_00=N_O1(:,N_O2_0);   % 提取期望损失为0的位置
[N_O3,N_O4]=sort(N_O2);
N_X1=[];
for a_N=1:length(N_O4) 
    N_x1=N_O1(1,N_O4(1,a_N));
    N_X1=[N_X1,N_x1];
end
N_X1;

 
PX=[P_X1 B_X1 N_X1]        %%%%%%%%%%%%%%%%总排序
 
DOM1  %正域
DOM2   %边界域
DOM3   %负域
PX
% RRR1=[T1;T2;T3];
% [RR1,PP1]=size(RRR1);
% pr1=[];
% for ip=1:RR1
%     RRR=RRR1(ip,:);
%     [mn,nm]=sort(RRR);
% pr1=[pr1;nm];
% end
% pr1
 
 
 SUNSHI=[SPP',SBP',SNP',SPN',SBN',SNN']
