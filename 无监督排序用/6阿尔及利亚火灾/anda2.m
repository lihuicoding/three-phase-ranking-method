function [gui_fan_ju_zhen,oldcentroid,idx,C,gai_lv,AN_SUNSHI,AN_yuzhi,N_xiao,P_11,B_11,N_11,N_da,POS,BND,NEG,sheng_yu_xu,PX]=anda2(RTR,W,mu_biao,k_lei,rho)
[a1,b1]=size(RTR);

% -----------------找出小于准则模糊概念的，并使用WAA算子排序
tichu_xiao=[];
for ko1=1:a1
if (RTR(ko1,:)<mu_biao(1,:))==ones(1,b1)
    tic1=ko1;
else
    tic1=[];
end
tichu_xiao=[tichu_xiao,tic1];
end
man_zu_ju_zhen_xiao=RTR(tichu_xiao,:);% 找出小于准则模糊概念的对象的数据

%小于模糊概念的对象排序
r1=man_zu_ju_zhen_xiao*W';
r1=r1';
[PAi_xiao_zhi,PAi_xiao_xu]=sort(r1,'descend');
N_xiao=[];
for a_xiao=1:length(PAi_xiao_xu) 
    N_xiao1=tichu_xiao(1,PAi_xiao_xu(1,a_xiao));
    N_xiao=[N_xiao,N_xiao1];
end
N_xiao; 

 % 找出大于等于准则模糊概念的，并使用WAA算子排序
[a2,b2]=size(RTR);
tichu_da=[];
for ko2=1:a1
if (RTR(ko2,:)>=mu_biao(1,:))==ones(1,b1)
        tic2=ko2;
    else
    tic2=[];
end
    tichu_da=[tichu_da,tic2];
end 
man_zu_ju_zhen_da=RTR(tichu_da,:);% 找出大于等于准则模糊概念的对象的数据

%大于等于模糊概念的对象排序
r2=man_zu_ju_zhen_da*W';
r2=r2';
[PAi_da_zhi,PAi_da_xu]=sort(r2,'descend');
N_da=[];
for a_da=1:length(PAi_da_xu) 
    N_da1=tichu_da(1,PAi_da_xu(1,a_da));
    N_da=[N_da,N_da1];
end
N_da;

 

%去除预先处理的数据，剩余的第三类型数据排序
%第三类型的对象位置
hang_weizhi=1:1:a1;
chu=[N_xiao N_da];
sheng_weizhi=setdiff(hang_weizhi,chu);
%第三类型的对象属性值
RTR([tichu_xiao tichu_da],:)=[];


gui_fan_ju_zhen=RTR;  %第三类型的矩阵数据
[a,b]=size(gui_fan_ju_zhen);

%-----------------------------------------聚类结果
%[chushimu,idx,C]=k_mean1(gui_fan_ju_zhen,k_lei);
%[idx,C] = kmeans(gui_fan_ju_zhen,k_lei,'start',[gui_fan_ju_zhen(1,:);gui_fan_ju_zhen(2,:);gui_fan_ju_zhen(3,:)]);
[oldcentroid,idx,C]=max_kmeans(gui_fan_ju_zhen,k_lei);

 
% %%----------------------------------- 计算条件概率（模糊条件下的概率计算公式）
gai_lv=[];
for i_ju=1:a
    CC=C(idx(i_ju,1),:);
    CP1=sum(CC.*mu_biao)./(sum(CC));
    gai_lv=[gai_lv,CP1];
end
gai_lv;


%----------------------------------- 计算损失函数 

L_j1=[];
for j_1=1:b
    L_i1=[];
for i_1=1:a
    %Ld_1=(gui_fan_ju_zhen(i_1,j_1)-mu_biao(1,j_1)+1)/2;
    Ld_1=(gui_fan_ju_zhen(i_1,j_1)-mu_biao(1,j_1)+1)^2/4;
    L_i1=[L_i1;Ld_1];
end
L_j1=[L_j1,L_i1];
end
L_j1;%每个准则上的欧几里得距离
SIM_j1=L_j1;

SIM=SIM_j1*W';
[SIM_shu,SIM_wei]=sort(SIM,'descend');


SPP=zeros(1,a);
%SNNP1=(SIM_j1-min(SIM_j1))*W'; 
SNNP1=SIM_j1*W'-min(SIM_j1*W'); 
SNP1=SNNP1';
% SNP1=[];
% for i=1:a
% if (gui_fan_ju_zhen(i,:)<mu_biao(1,:))==ones(1,b)
%         G1=0;
%     else 
%         G1=SNNP1(i,1);
% end
% SNP1=[SNP1,G1];
% end
SNP=SNP1;
SBP=rho*SNP;

%SPNN1=(max(SIM_j1)-SIM_j1)*W'; 
SPNN1=max(SIM_j1*W')-SIM_j1*W';
SPN1=SPNN1';
% SPN1=[];
% for i=1:a
% if (gui_fan_ju_zhen(i,:)>=mu_biao(1,:))==ones(1,b)
%         G2=0;
%     else 
%         G2=SPNN1(i,1);
% end
% SPN1=[SPN1,G2];
% end
SPN=SPN1;
SBN=rho*SPN;
SNN=zeros(1,a);
 

%%%-------------------------------------------- 计算阈值
alpha=(SPN-SBN)./((SPN-SBN)+(SBP-SPP));   %%%%%阿尔法
gamma=(SPN-SNN)./((SPN-SNN)+(SNP-SPP));   %%%%%伽玛
beta=(SBN-SNN)./((SBN-SNN)+(SNP-SBP));   %%%%%贝塔
T1=alpha;
T2=gamma;
T3=beta;
% %%%--------------------------------. 求三个域和决策规则（模糊决策理论粗糙集）
DOM1=[];  %正域
DOM2=[];  %边界域
DOM3=[];  %负域
for a12=1:a
    if gai_lv(1,a12)>=T1(1,a12)
        pos=1;
    else
       pos=0;
    end
    DOM1=[DOM1,pos];
end
for a13=1:a
    if T3(1,a13)<gai_lv(1,a13) && gai_lv(1,a13)<T1(1,a13)
        bnd=1;
    else
        bnd=0;
    end
   DOM2=[DOM2,bnd];
end
for a14=1:a
    if gai_lv(1,a14)<=T3(1,a14)
        neg=1;
    else
        neg=0;
    end
    DOM3=[DOM3,neg];
end

bu_gai_lv=1-gai_lv;  %%%补概率（坏状态的概率）
RP=(SPP.*gai_lv+SPN.*bu_gai_lv).*DOM1;   %%%正域相关损失
RB=(SBP.*gai_lv+SBN.*bu_gai_lv).*DOM2;   %%%边界域相关损失
RN=(SNP.*gai_lv+SNN.*bu_gai_lv).*DOM3;  %%%负域相关损失
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%正域排序
% 
total=RP+RB+RN;
%  [shu,Rank]=sort(total)
 

 
P_O1=find(DOM1==1);  %%%%%%%%%%%%%%%%%%%%%%%%%%分类到正域中的对象的位置
P_O2=RP(:,P_O1);   % 提取正域中的对象，所对应的相关损失
[P_O3,P_O4]=sort(P_O2);
P_X1=[];
for a_P=1:length(P_O4) 
    P_x1=P_O1(1,P_O4(1,a_P));
    P_X1=[P_X1,P_x1];
end
P_X1;

B_O1=find(DOM2==1);  %%%%%%%%%%%%%%%%%%%%%%%%%%分类到边界域中的对象的位置
B_O2=RB(:,B_O1);   % 提取边界域中的对象，所对应的相关损失
[B_O3,B_O4]=sort(B_O2);
B_X1=[];
for a_B=1:length(B_O4) 
    B_x1=B_O1(1,B_O4(1,a_B));
    B_X1=[B_X1,B_x1];
end
B_X1;




N_O1=find(DOM3==1);  %%%%%%%%%%%%%%%%%%%%%%%%%%分类到负域中的对象的位置
N_O2=RN(:,N_O1);   % 提取负域中的对象，所对应的相关损失
[N_O3,N_O4]=sort(N_O2,'descend');
N_X1=[];
for a_N=1:length(N_O4) 
    N_x1=N_O1(1,N_O4(1,a_N));
    N_X1=[N_X1,N_x1];
end
N_X1;

%第三类型位置排序
% PX1=[P_X1 B_X1 N_X1];
% N_P1=[];
% for a_p=1:length(PX1) 
%     N_p1=sheng_weizhi(1,PX1(1,a_p));
%     N_P1=[N_P1,N_p1];
% end
% sheng_yu_xu=N_P1;

P_1=[]; 
for a_P=1:length(P_X1) 
    P_2=sheng_weizhi(1,P_X1(1,a_P));
    P_1=[P_1,P_2];
end
 B_1=[]; 
for a_B=1:length(B_X1) 
    B_2=sheng_weizhi(1,B_X1(1,a_B));
    B_1=[B_1,B_2];
end
 N_1=[]; 
for a_N=1:length(N_X1) 
    N_2=sheng_weizhi(1,N_X1(1,a_N));
    N_1=[N_1,N_2];
end
 
sheng_yu_xu=[P_1 B_1 N_1];
 

man_zu_ju_zhen_xiao   %小于准则模糊概念的对象的数据
N_xiao    %小于准则模糊概念的对象的排序
man_zu_ju_zhen_da   %大于等于准则模糊概念的对象的数据
N_da    %大于等于准则模糊概念的对象的排序
sheng_weizhi   %第三类型的对象位置
gui_fan_ju_zhen   %第三类型的矩阵数据

SIM_j1 %第三类型的准则距离成本
SIM  %第三类型的全局距离成本
SIM_shu   %第三类型的全局距离的数值
SIM_wei %第三类型的全局距离的序数




AN_SUNSHI=[SPP',SBP',SNP',SPN',SBN',SNN'] %第三类型的风险损失
P_1 %第三类型正域
P_11=unique(P_1)
B_1 %第三类型边界域
B_11=unique(B_1)
N_1 %第三类型负域
N_11=unique(N_1)
RP
RB
RN
gai_lv  %第三类型概率 
AN_yuzhi=[alpha;beta;gamma]   %三个阈值

sheng_yu_xu %第三类型的对象排序
POS=[N_da P_11] 
BND=B_11
NEG=[N_11 N_xiao] 


PX=[N_da sheng_yu_xu N_xiao]        %%%%%%%%%%%%%%%%总排序
end
