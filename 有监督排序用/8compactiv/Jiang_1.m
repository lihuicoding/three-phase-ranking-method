function [Jiang1_rank]=Jiang_1(TA,W,p,k)

A=TA;
[a,b]=size(A);
PIS=[];
NIS=[];
for f1=1:b;
    %if f1<4
        FP1=max(A(:,f1));
        FN1=min(A(:,f1));
    %else
      %  FP1=min(A(:,f1));
      %  FN1=max(A(:,f1));
   % end
    PIS=[PIS,FP1];       %%正理想
    NIS=[NIS,FN1];       %%负理想
end
LD=[];
UD=[];
for a8=1:a;
    ud=sqrt(sum((A(a8,:)-PIS(1,:)).^2.*W));
    ld=sqrt(sum((A(a8,:)-NIS(1,:)).^2.*W));
    LD=[LD,ld];
    UD=[UD,ud];
end
X=LD;              %%%加权负距离
Y=UD;              %%%加权正距离

N1=[];
for a1=1:a;
        N2=[];
        for b1=1:b;
            if A(a1,b1)>=p;
                c=b1;
            else
                c=0;
            end
            N2=[N2,c];
        end
        N1=[N1;N2];
end
B=N1;        %%%每行为对象所满足条件的位置
NN=[];
for a2=1:a;
  nnn=[];
    for a3=1:a;
        nn=[];
   for b2=1:b;
       
        if B(a3,b2)>0;
            d=A(a2,b2);
        else
            d=1;
        end
        nn=[nn;d];
   end
   h=min(nn);
    nnn=[nnn;h];
    end
     NN=[NN,nnn];           %%%马丽文模糊覆盖B邻域算子
end       
N=NN;
CN=N';            %%%马丽文补模糊覆盖B邻域算子
[u,v]=size(N);
JN1=[];
for u1=1:u;
    JN2=[];
    for v1=1:v;
        t=min(N(u1,v1),CN(u1,v1));
        JN2=[JN2;t];
    end
    JN1=[JN1,JN2];  %%%邻域与补邻域相交，第三种邻域
end
JN=JN1;
[i,j]=size(JN);
X1=[];
for s=1:i;
   X2=[];
   X3=[];
    for t=1:j;
        if X(1,t)<=k;
            g=JN(s,t);
                q=min(1,1-g+k);
            X2=[X2;q];
            d=min(X2);
        else
            g=JN(s,t);
                q=min(1,1-g+X(1,t));
            X2=[X2;q];
            d=min(X2);
        end
        X3=[X3;d];
    end
     d1=min(X3);
     X1=[X1;d1];
end
LX=X1';         %%%蒋第一篇 X的下近似

X4=[];
for s1=1:i;
   X5=[];
   X6=[];
    for t1=1:j;
        if X(1,t1)<1-k;
            g1=JN(s1,t1);
            q1=max(0,g1+X(1,t1)-1);
            X5=[X5;q1];
            d2=max(X5);
        else
            g1=JN(s1,t1);
            q1=max(0,g1+(1-k)-1);
            X5=[X5;q];
            d2=max(X5);
        end
        X6=[X6;d2];
    end
     d3=max(X6);
     X4=[X4;d3];
end
UX=X4';                  %%%蒋第一篇 X的上近似

Y1=[];
for s3=1:i;
  Y2=[];
  Y3=[];
    for t3=1:j;
        if Y(1,t3)<=k;
            g3=JN(s3,t3);
                q3=min(1,1-g3+k);
            Y2=[Y2;q3];
            d3=min(Y2);
        else
            g3=JN(s3,t3);
                q3=min(1,1-g3+Y(1,t3));
            Y2=[Y2;q3];
            d3=min(Y2);
        end
        Y3=[Y3;d3];
    end
     d4=min(Y3);
     Y1=[Y1;d4];
end
LY=Y1';         %%%蒋第一篇 Y的下近似

Y4=[];
for s4=1:i;
   Y5=[];
   Y6=[];
    for t4=1:j;
        if Y(1,t4)<1-k;
            g4=JN(s4,t4);
            q4=max(0,g4-Y(1,t4)-1);
            Y5=[Y5;q4];
            d5=max(Y5);
        else
            g4=JN(s4,t4);
            q4=max(0,g4+(1-k)-1);
            Y5=[Y5;q4];
            d5=max(Y5);
        end
        Y6=[Y6;d5];
    end
     d6=max(Y6);
    Y4=[Y4;d6];
end
UY=Y4';                  %%%蒋第一篇 Y的上近似

V1=LX+UX-LX.*UX;
V2=LY+UY-LY.*UY;
P=V1./(V1+V2);
[m,n]=sort(P,'descend'); %%%排序

Jiang1_rank=n;
end
