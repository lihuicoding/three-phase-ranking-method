function [Jia_px1,Jia_px2,Jia_px3]=Jia(TA,W,Q)
[a,b]=size(TA);
[m,n]=size(TA);
A1=TA;
MAX=ones(1,n);   %%%%%%根据准则调整
MIN=zeros(1,n);  %%%%%%根据准则调整
QQ=ones(1,n)*Q;
%(for b2=1:b;
    %m1=max(A1(:,b2));
    %m2=min(A1(:,b2));
    %MAX=[MAX,m1];
    %MIN=[MIN,m2];
%end)
T1=[];
T2=[];
T3=[];
for a1=1:a;
t1=(sum(W.*(1-QQ).*(MAX-A1(a1,:))))./(sum(W.*(1-QQ).*(MAX-A1(a1,:)))+sum(W.*QQ.*(A1(a1,:)-MIN)));
t2=(sum(W.*QQ.*(MAX-A1(a1,:))))./(sum(W.*QQ.*(MAX-A1(a1,:)))+sum(W.*(1-QQ).*(A1(a1,:)-MIN)));
t3=(sum(W.*(MAX-A1(a1,:))))./(sum(W.*(MAX-MIN)));
T1=[T1,t1];
T2=[T2,t2];
T3=[T3,t3];
end
[v1,px1]=sort(T1);
[v2,px2]=sort(T2);
[v3,px3]=sort(T3);

Jia_px1=px1;
Jia_px2=px2;
Jia_px3=px3;
end