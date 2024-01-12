function [Rank,f_POS,f_BND,f_NEG]=lunwen7(TA,W,H)
[m,n] = size(TA);
%W=[0.15,0.2,0.1,0.25,0.1,0.2];
%H=[ 0.33    0.67    0.55     0.83    0.41     0.35];%����׼���ģ������H��h_j
%H=[ 0.73    0.17    0.15     0.83    0.11     0.25    0.95     0.98];%����׼���ģ������H��h_j
X1=ones(1,n);    %ÿ��׼���ϵľ����������ֵ��ϵ�ģ�������ƾ������ģ����
X0=zeros(1,n);   %ÿ��׼���ϵľ�����С����ֵ��ϵ�ģ�������ƾ�����Сģ����
d_01=Dist(W,H,X0);   %����׼���ģ������H�;�����Сģ����֮��ļ�Ȩ����
d_11=Dist(W,H,X1);   %����׼���ģ������H�;������ģ����֮��ļ�Ȩ����

DD1=[];
DD2=[];
for i=1:m
    dd1=Dist(W,X0,TA(i,:));
    dd2=Dist(W,X1,TA(i,:));
    DD1=[DD1,dd1];
    DD2=[DD2,dd2];
end
DD1; %����ģ�����Ϻ;�����Сģ����֮��ļ�Ȩ����
DD2; %����ģ�����Ϻ;������ģ����֮��ļ�Ȩ����

%����POS
POS=[];
for i=1:m
    if Dist(W,X0,TA(i,:))>=d_01 && Dist(W,X1,TA(i,:))<=d_11   
        p1=1;
    else
        p1=0;
    end
        POS=[POS,p1];  
end
POS;   %���ൽ�����еĶ���

f_POS=find(POS==1);  %%%%%%%%%%%%%%%%%%%%%%%%%%���ൽ�����еĶ����λ��
TA_POS=TA(f_POS,:);   % ��ȡ�����еĶ�������Ӧ��ԭʼ����
I_POS=topsis(TA_POS,W); %ʹ��TOPSIS������õģ������ڵĶ��������
%�����Զ���˳�����⣬�µľ������ݵ������±���Ҫ��Ӧԭʼ���󼯺ϵ��±�
P_POS=[]; 
for j=1:length(I_POS)
    p_POS=f_POS(1,I_POS(1,j));
    P_POS=[P_POS,p_POS];
end
P_POS;  %���յ������е�����

%�߽���BND
BND=[];
for i=1:m
    if (Dist(W,X0,TA(i,:))>d_01 && Dist(W,X1,TA(i,:))>d_11) || (Dist(W,X0,TA(i,:))<d_01 && Dist(W,X1,TA(i,:))<d_11)  
        p2=1;
    else
        p2=0;
    end
        BND=[BND,p2];  
end
BND;  %���ൽ�߽����еĶ���


f_BND=find(BND==1);   %%%%%%%%%%%%%%%%%%%%%%%%%%���ൽ�߽����еĶ����λ��
TA_BND=TA(f_BND,:);   % ��ȡ�߽����еĶ�������Ӧ��ԭʼ����
I_BND=topsis(TA_BND,W); %ʹ��TOPSIS������õģ��߽����ڵĶ��������
%�����Զ���˳�����⣬�µľ������ݵ������±���Ҫ��Ӧԭʼ���󼯺ϵ��±�
P_BND=[]; 
for j=1:length(I_BND)
    p_BND=f_BND(1,I_BND(1,j));
    P_BND=[P_BND,p_BND];
end
P_BND;  %���յı߽����е�����

%����BND
NEG=[];
for i=1:m
    if (Dist(W,X0,TA(i,:))<=d_01 && Dist(W,X1,TA(i,:))>=d_11) && (~(Dist(W,X0,TA(i,:))==d_01 && Dist(W,X1,TA(i,:))==d_11))  
        p3=1;
    else
        p3=0;
    end
        NEG=[NEG,p3];  
end
NEG;  %���ൽ�����еĶ���

f_NEG=find(NEG==1);    %%%%%%%%%%%%%%%%%%%%%%%%%%���ൽ�����еĶ����λ��
TA_NEG=TA(f_NEG,:);   % ��ȡ�����еĶ�������Ӧ��ԭʼ����
I_NEG=topsis(TA_NEG,W); %ʹ��TOPSIS������õģ������ڵĶ��������
%�����Զ���˳�����⣬�µľ������ݵ������±���Ҫ��Ӧԭʼ���󼯺ϵ��±�
P_NEG=[]; 
for j=1:length(I_NEG)
    p_NEG=f_NEG(1,I_NEG(1,j));
    P_NEG=[P_NEG,p_NEG];
end
P_NEG;  %���յĸ����е�����

Rank=[P_POS P_BND P_NEG];  %��������
end






