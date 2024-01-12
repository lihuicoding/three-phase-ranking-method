function P=relative_volatility(A)
[a,b]=size(A);
c=b*(b-1)/2;  %有序对的数量
%x=[6     8     3     1     5     7     4     2];  %方法1的排序
%y=[2,3,1];  %方法2的排序
%c=length(x)*(length(x)-1)/2;  %序对的数量
%ff=abs(ni_xu(x)-ni_xu(y))/c  %相关程度

%计算两两之间的相关程度
P=[];
for a1=1:a;
    P1=[];
    for a2=1:a;
    pi=abs(ni_xu(A(a1,:))-ni_xu(A(a2,:)))/c;
    P1=[P1;pi];
    end
    P=[P,P1];
end
P=1.-P;
end
