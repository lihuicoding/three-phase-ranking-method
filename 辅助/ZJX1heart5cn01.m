A1=xlsread('D:\matlab脚本\heart-5cn01-nc\原数据270','A2:G271');
D=xlsread('D:\matlab脚本\heart-5cn01-nc\原数据270','H2:H271');
C=find(D==2),c=find(D==1);  %%%2有心脏病
[a,b]=size(A1);
A=[];   %%%%%%正规化矩阵 
for b11=1:b;
%     na=A1(:,b11)./((sum(A1(:,b11).^2)).^0.5);
   na=(A1(:,b11)-min(A1(:,b11)))./(max(A1(:,b11))-min(A1(:,b11)));%%%%%效益型
A=[A,na]
end
A


B=1.-A;

B1=[];
for i=1:a
    for j=1:a
        C1=[];
        if A(i,1)>A(j,1)                     %%优于则计算距离，不优则为0
            d(i,j)=abs(A(i,1)-A(j,1));
        else d(i,j)=0;
        end
        C1=[C1 d(i,j)];
        B1=[B1 C1];
    end
end
B1=reshape(B1,a,a)';


q=0.1;p=0.5;
N1=[];
for i=1:a
    for j=1:a
         M1=[];                      %%利用优势函数
if B1(i,j)<=q
    H1(i,j)=0;
elseif q<B1(i,j)&B1(i,j)<=p
    H1(i,j)=(B1(i,j)-q)/(p-q);
else H1(i,j)=1;
end
M1=[M1 H1(i,j)];
        N1=[N1;M1];  
    end
end
N1=(reshape(N1,a,a))';

B2=[];
for i=1:a
    for j=1:a
        C2=[];
        if A(i,2)>A(j,2)                     %%优于则计算距离，不优则为0
            d(i,j)=abs(A(i,2)-A(j,2));
        else d(i,j)=0;
        end
        C2=[C2 d(i,j)];
        B2=[B2 C2];
    end
end
B2=reshape(B2,a,a)';


q=0.1;p=0.5;
N2=[];
for i=1:a
    for j=1:a
         M2=[];                      %%利用优势函数
if B2(i,j)<=q
  H2(i,j)=0;
elseif q<B2(i,j)&B2(i,j)<=p
    H2(i,j)=(B2(i,j)-q)/(p-q);
else H2(i,j)=1;
end
M2=[M2 H2(i,j)];
       N2=[N2;M2];  
    end
end
N2=(reshape(N2,a,a))';

B3=[];
for i=1:a
    for j=1:a
        C3=[];
        if A(i,3)>A(j,3)                     %%优于则计算距离，不优则为0
            d(i,j)=abs(A(i,3)-A(j,3));
        else d(i,j)=0;
        end
        C3=[C3 d(i,j)];
        B3=[B3 C3];
    end
end
B3=reshape(B3,a,a)';


q=0.1;p=0.5;
N3=[];
for i=1:a
    for j=1:a
         M3=[];                      %%利用优势函数
if B3(i,j)<=q
    H3(i,j)=0;
elseif q<B3(i,j)&B3(i,j)<=p
    H3(i,j)=(B3(i,j)-q)/(p-q);
else H3(i,j)=1;
end
M3=[M3 H3(i,j)];
        N3=[N3;M3];  
    end
end
N3=(reshape(N3,a,a))';


B4=[];
for i=1:a
    for j=1:a
        C4=[];
        if A(i,4)>A(j,4)                     %%优于则计算距离，不优则为0
            d(i,j)=abs(A(i,4)-A(j,4));
        else d(i,j)=0;
        end
        C4=[C4 d(i,j)];
        B4=[B4 C4];
    end
end
B4=reshape(B4,a,a)';


q=0.1;p=0.5;
N4=[];
for i=1:a
    for j=1:a
         M4=[];                      %%利用优势函数
if B4(i,j)<=q
    H4(i,j)=0;
elseif q<B4(i,j)&B4(i,j)<=p
    H4(i,j)=(B4(i,j)-q)/(p-q);
else H4(i,j)=1;
end
M4=[M4 H4(i,j)];
        N4=[N4;M4];  
    end
end
N4=(reshape(N4,a,a))';

B5=[];
for i=1:a
    for j=1:a
        C5=[];
        if A(i,5)>A(j,5)                     %%优于则计算距离，不优则为0
            d(i,j)=abs(A(i,5)-A(j,5));
        else d(i,j)=0;
        end
        C5=[C5 d(i,j)];
        B5=[B5 C5];
    end
end
B5=reshape(B5,a,a)';


q=0.1;p=0.5;
N5=[];
for i=1:a
    for j=1:a
         M5=[];                      %%利用优势函数
if B5(i,j)<=q
    H5(i,j)=0;
elseif q<B5(i,j)&B5(i,j)<=p
    H5(i,j)=(B5(i,j)-q)/(p-q);
else H5(i,j)=1;
end
M5=[M5 H5(i,j)];
        N5=[N5;M5];  
    end
end
N5=(reshape(N5,a,a))';


B6=[];
for i=1:a
    for j=1:a
        C6=[];
        if A(i,6)>A(j,6)                     %%优于则计算距离，不优则为0
            d(i,j)=abs(A(i,6)-A(j,6));
        else d(i,j)=0;
        end
        C6=[C6 d(i,j)];
        B6=[B6 C6];
    end
end
B6=reshape(B6,a,a)';


q=0.1;p=0.5;
N6=[];
for i=1:a
    for j=1:a
         M6=[];                      %%利用优势函数
if B6(i,j)<=q
    H6(i,j)=0;
elseif q<B6(i,j)&B6(i,j)<=p
    H6(i,j)=(B6(i,j)-q)/(p-q);
else H6(i,j)=1;
end
M6=[M6 H6(i,j)];
        N6=[N6;M6];  
    end
end
N6=(reshape(N6,a,a))';

B7=[];
for i=1:a
    for j=1:a
        C7=[];
        if A(i,7)>A(j,7)                     %%优于则计算距离，不优则为0
            d(i,j)=abs(A(i,7)-A(j,7));
        else d(i,j)=0;
        end
        C7=[C7 d(i,j)];
        B7=[B7 C7];
    end
end
B7=reshape(B7,a,a)';


q=0.1;p=0.5;
N7=[];
for i=1:a
    for j=1:a
         M7=[];                      %%利用优势函数
if B7(i,j)<=q
    H7(i,j)=0;
elseif q<B7(i,j)&B7(i,j)<=p
    H7(i,j)=(B7(i,j)-q)/(p-q);
else H7(i,j)=1;
end
M7=[M7 H7(i,j)];
        N7=[N7;M7];  
    end
end
N7=(reshape(N7,a,a))';


w=[ 0.1266    0.1086    0.0742    0.1163    0.1055    0.1829    0.2859]
% %%%%%%%%%%%%%淋巴权重
W=[];
for i=1:a
    for j=1:a                                        %%%%偏好函数的加权平均值
        V=[];
        PI(i,j)=w(1,1).*N1(i,j)+w(1,2).*N2(i,j)+w(1,3).*N3(i,j)+w(1,4).*N4(i,j)+w(1,5).*N5(i,j)+w(1,6).*N6(i,j)+w(1,7).*N7(i,j);
        V=[V PI(i,j)];
W=[W;V];
    end
end
W=(reshape(W,a,a))';
    
       
Sc=sum(W);%列之和流入量-
Sr=sum(W,2)';%行之和流出量+
fa=Sr-Sc;   %%%%计算净流量
[f,ff]=sort(fa,'descend');
F=ff';
for i=1:a
    for j=1:a
     if fa(i)>=fa(j)       %%%%%%%%%%%优序关系     
  e(i,j)=1;
        else e(i,j)=0;
        end
    end
end
e;
% C=find(CC>=3),c=find(CC<=2);  %%%划分状态集

SU=sum(w.*A,2);
  J={};
 for j=1:a
 ysl=find(e(:,j)==1)        
 J{j}=ysl
 end
   JJJ=[];
   for j=1:a
       SSS=0;
       for i=1:length(J{j})
       SSS=SSS+SU(J{j}(i));           %%%%%%%%%%%%%%找出优势类中的对象对应的隶属度之和
       end  
       JJJ(j)=SSS
   end
   JJJ
   
Y=[];XX=[];
for j=1:a
        X{j}=[Y (find(e(:,j)==1))'];
        XX=[XX,length(X{j})];                 %%优势集的个数
end

P1=(JJJ./XX)';
P2=(1.-P1); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%遗憾理论
g=0.9  %%%结果矩阵的风险规避系数
   
gg=0.5;


h=repmat(0.3,[a,b]);%%%后悔欣喜系数

zpp=A;zbp=g.*A;znn=B;zbn=g.*B;
 upp=(1.-exp(-gg.*zpp))./gg;
  ubp=(1.-exp(-gg.*zbp))./gg;
  unp=repmat(0,[a,b]); upn=repmat(0,[a,b]);
  unn=(1.-exp(-gg.*znn))./gg;
  ubn=(1.-exp(-gg.*zbn))./gg;
  
  
upp0=[];  ubp0=[]; unn0=[]; ubn0=[];  
for i=1:a
u0=max(upp(i,:));
upp0=[upp0,u0];
ubp0=[ubp0,max(ubp(i,:))];
unn0=[unn0,max(unn(i,:))];
ubn0=[ubn0,max(unn(i,:))];
end


Z=[upp0;ubp0;unn0;ubn0];%%%%%%%%%%
zz=[];
for j=1:a
zz=[zz,max(Z(:,j))];%%%%%%%%%%%%参考点
end
uu=zz';%%%%%%%%%%%最大直接效用

one=repmat(1,[a,b]);
vpp=upp+one-exp((-h).*(upp-uu));
vbp=ubp+one-exp((-h).*(ubp-uu));
vnp=unp+one-exp((-h).*(unp-uu));
vnn=unn+one-exp((-h).*(unn-uu));
vbn=ubn+one-exp((-h).*(ubn-uu));
vpn=upn+one-exp((-h).*(upn-uu)); 

Vpp=sum(w.*vpp,2);
Vbp=sum(w.*vbp,2);
Vnp=sum(w.*vnp,2);
Vnn=sum(w.*vnn,2);
Vbn=sum(w.*vbn,2);
Vpn=sum(w.*vpn,2);



aa=(Vbn-Vpn)./((Vbn-Vpn)+(Vpp-Vbp));
bb=(Vnn-Vbn)./((Vnn-Vbn)+(Vbp-Vnp));         %%%%%%%%%%%%%%%%%%%%%%阈值
rr=(Vnn-Vpn)./((Vnn-Vpn)+(Vpp-Vnp));
[v1,px1]=sort(aa);    %基于α的排序
[v2,px2]=sort(bb);    %基于β的排序
[v3,px3]=sort(rr);    %基于γ的排序
paixujuzheng=reshape([v1 px1 v2 px2 v3 px3],[a,6])   %基于α'β'γ的排序矩阵

% % % % %    
UP=(Vpp.*P1+Vpn.*P2)';
UB=(Vbp.*P1+Vbn.*P2)';
UN=(Vnp.*P1+Vnn.*P2)';
u=[UP' UB' UN'];
UMAX=max(u');


DOM1=[]; %正域
    DOM2=[]; %边界域
    DOM3=[]; %负域
    for a4=1:a;
      if UP(1,a4)>=UB(1,a4) & UP(1,a4)>=UN(1,a4)
          dom1=a4;
      else
          dom1=0;
      end
      if UB(1,a4)>=UP(1,a4) & UB(1,a4)>=UN(1,a4)
          dom2=a4;
      else
          dom2=0;
      end
      if UN(1,a4)>=UP(1,a4) & UN(1,a4)>=UB(1,a4)
          dom3=a4;
      else
          dom3=0; 
      end
      DOM1=[DOM1,dom1];
      DOM2=[DOM2,dom2];
      DOM3=[DOM3,dom3];
    end
    

appp=[];bnnn=[];negg=[];%%%%%%%%正 边界 负域的对象索引
for i=1:a
    if max(max(UP(i), UB(i)), UN(i))==UB(i)
        bnnn=[bnnn,i];
    else if max(max(UP(i),UB(i)), UN(i))==UP(i)
            appp=[appp,i];
        else negg=[negg,i];                 %%%%%%%%%%%%%%%%%%%%%%%%%%%结果排序
        end
    end
end
[v111,px1111]=sort(UP(appp),'descend');
[v222,px2222]=sort(UB(bnnn),'descend');
[v333,px3333]=sort(UN(negg),'descend');
 
Bndrate=(length(intersect(C,bnnn))+length(intersect(c,bnnn)))/(length(C)+length(c))
Qerror=(length(intersect(C,negg))+length(intersect(c,appp)))/(length(negg)+length(appp))    %%%%%%%%%%%容错率分析
Precision=length(intersect(C,appp))./(length(intersect(C,appp))+length(intersect(c,appp)))   %%%%%%%%机器学习
Recall=length(intersect(C,appp))./(length(intersect(C,appp))+length(intersect(C,negg)))
FI=(2*Precision*Recall)/(Precision+Recall)

Precision=(length(intersect(C,appp))+length(intersect(c,negg)))./(length(appp)+length(negg)) %%%%%%%%%%王天行前景
% Recall=(length(appp)+length(negg))./a
Rand=(length(intersect(C,appp))+length(intersect(c,negg)))./((length(intersect(C,appp))+length(intersect(c,negg)))+(length(intersect(c,appp))+length(intersect(C,negg))))
% k=0.6
%  CorrectedQ=k*((length(intersect(C,negg))+length(intersect(c,appp)))/a)+(1-k)*(length(bnnn)/(length(appp)+length(bnnn)))

I=[appp(px1111) bnnn(px2222) negg(px3333)]'
 weizhixu=[];
 for i=1:a
     wei=find( px1==i);
 weizhixu=[weizhixu wei];
 end
 TTT=weizhixu'
 %

