function [gui_fan_ju_zhen,oldcentroid,idx,C,gai_lv,AN_SUNSHI,AN_yuzhi,N_xiao,P_11,B_11,N_11,N_da,POS,BND,NEG,sheng_yu_xu,PX]=anda2(RTR,W,mu_biao,k_lei,rho)
[a1,b1]=size(RTR);

% -----------------�ҳ�С��׼��ģ������ģ���ʹ��WAA��������
tichu_xiao=[];
for ko1=1:a1
if (RTR(ko1,:)<mu_biao(1,:))==ones(1,b1)
    tic1=ko1;
else
    tic1=[];
end
tichu_xiao=[tichu_xiao,tic1];
end
man_zu_ju_zhen_xiao=RTR(tichu_xiao,:);% �ҳ�С��׼��ģ������Ķ��������

%С��ģ������Ķ�������
r1=man_zu_ju_zhen_xiao*W';
r1=r1';
[PAi_xiao_zhi,PAi_xiao_xu]=sort(r1,'descend');
N_xiao=[];
for a_xiao=1:length(PAi_xiao_xu) 
    N_xiao1=tichu_xiao(1,PAi_xiao_xu(1,a_xiao));
    N_xiao=[N_xiao,N_xiao1];
end
N_xiao; 

 % �ҳ����ڵ���׼��ģ������ģ���ʹ��WAA��������
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
man_zu_ju_zhen_da=RTR(tichu_da,:);% �ҳ����ڵ���׼��ģ������Ķ��������

%���ڵ���ģ������Ķ�������
r2=man_zu_ju_zhen_da*W';
r2=r2';
[PAi_da_zhi,PAi_da_xu]=sort(r2,'descend');
N_da=[];
for a_da=1:length(PAi_da_xu) 
    N_da1=tichu_da(1,PAi_da_xu(1,a_da));
    N_da=[N_da,N_da1];
end
N_da;

 

%ȥ��Ԥ�ȴ�������ݣ�ʣ��ĵ���������������
%�������͵Ķ���λ��
hang_weizhi=1:1:a1;
chu=[N_xiao N_da];
sheng_weizhi=setdiff(hang_weizhi,chu);
%�������͵Ķ�������ֵ
RTR([tichu_xiao tichu_da],:)=[];


gui_fan_ju_zhen=RTR;  %�������͵ľ�������
[a,b]=size(gui_fan_ju_zhen);

%-----------------------------------------������
%[chushimu,idx,C]=k_mean1(gui_fan_ju_zhen,k_lei);
%[idx,C] = kmeans(gui_fan_ju_zhen,k_lei,'start',[gui_fan_ju_zhen(1,:);gui_fan_ju_zhen(2,:);gui_fan_ju_zhen(3,:)]);
[oldcentroid,idx,C]=max_kmeans(gui_fan_ju_zhen,k_lei);

 
% %%----------------------------------- �����������ʣ�ģ�������µĸ��ʼ��㹫ʽ��
gai_lv=[];
for i_ju=1:a
    CC=C(idx(i_ju,1),:);
    CP1=sum(CC.*mu_biao)./(sum(CC));
    gai_lv=[gai_lv,CP1];
end
gai_lv;


%----------------------------------- ������ʧ���� 

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
L_j1;%ÿ��׼���ϵ�ŷ����þ���
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
 

%%%-------------------------------------------- ������ֵ
alpha=(SPN-SBN)./((SPN-SBN)+(SBP-SPP));   %%%%%������
gamma=(SPN-SNN)./((SPN-SNN)+(SNP-SPP));   %%%%%٤��
beta=(SBN-SNN)./((SBN-SNN)+(SNP-SBP));   %%%%%����
T1=alpha;
T2=gamma;
T3=beta;
% %%%--------------------------------. ��������;��߹���ģ���������۴ֲڼ���
DOM1=[];  %����
DOM2=[];  %�߽���
DOM3=[];  %����
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

bu_gai_lv=1-gai_lv;  %%%�����ʣ���״̬�ĸ��ʣ�
RP=(SPP.*gai_lv+SPN.*bu_gai_lv).*DOM1;   %%%���������ʧ
RB=(SBP.*gai_lv+SBN.*bu_gai_lv).*DOM2;   %%%�߽��������ʧ
RN=(SNP.*gai_lv+SNN.*bu_gai_lv).*DOM3;  %%%���������ʧ
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��������
% 
total=RP+RB+RN;
%  [shu,Rank]=sort(total)
 

 
P_O1=find(DOM1==1);  %%%%%%%%%%%%%%%%%%%%%%%%%%���ൽ�����еĶ����λ��
P_O2=RP(:,P_O1);   % ��ȡ�����еĶ�������Ӧ�������ʧ
[P_O3,P_O4]=sort(P_O2);
P_X1=[];
for a_P=1:length(P_O4) 
    P_x1=P_O1(1,P_O4(1,a_P));
    P_X1=[P_X1,P_x1];
end
P_X1;

B_O1=find(DOM2==1);  %%%%%%%%%%%%%%%%%%%%%%%%%%���ൽ�߽����еĶ����λ��
B_O2=RB(:,B_O1);   % ��ȡ�߽����еĶ�������Ӧ�������ʧ
[B_O3,B_O4]=sort(B_O2);
B_X1=[];
for a_B=1:length(B_O4) 
    B_x1=B_O1(1,B_O4(1,a_B));
    B_X1=[B_X1,B_x1];
end
B_X1;




N_O1=find(DOM3==1);  %%%%%%%%%%%%%%%%%%%%%%%%%%���ൽ�����еĶ����λ��
N_O2=RN(:,N_O1);   % ��ȡ�����еĶ�������Ӧ�������ʧ
[N_O3,N_O4]=sort(N_O2,'descend');
N_X1=[];
for a_N=1:length(N_O4) 
    N_x1=N_O1(1,N_O4(1,a_N));
    N_X1=[N_X1,N_x1];
end
N_X1;

%��������λ������
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
 

man_zu_ju_zhen_xiao   %С��׼��ģ������Ķ��������
N_xiao    %С��׼��ģ������Ķ��������
man_zu_ju_zhen_da   %���ڵ���׼��ģ������Ķ��������
N_da    %���ڵ���׼��ģ������Ķ��������
sheng_weizhi   %�������͵Ķ���λ��
gui_fan_ju_zhen   %�������͵ľ�������

SIM_j1 %�������͵�׼�����ɱ�
SIM  %�������͵�ȫ�־���ɱ�
SIM_shu   %�������͵�ȫ�־������ֵ
SIM_wei %�������͵�ȫ�־��������




AN_SUNSHI=[SPP',SBP',SNP',SPN',SBN',SNN'] %�������͵ķ�����ʧ
P_1 %������������
P_11=unique(P_1)
B_1 %�������ͱ߽���
B_11=unique(B_1)
N_1 %�������͸���
N_11=unique(N_1)
RP
RB
RN
gai_lv  %�������͸��� 
AN_yuzhi=[alpha;beta;gamma]   %������ֵ

sheng_yu_xu %�������͵Ķ�������
POS=[N_da P_11] 
BND=B_11
NEG=[N_11 N_xiao] 


PX=[N_da sheng_yu_xu N_xiao]        %%%%%%%%%%%%%%%%������
end
