clc
clear
 %补足数据后的比较
A=[ 6     8     3     1     5     7     4     2   %top
    6     8     3     1     5     7     4     2  % Zhang
    6     8     3     1     7     5     4     2  %jia
    6     8     3     1     2     5     4     7 %ye
    6     7     3     8     1     4     2     5 %we,juedui
    6     8     3     7     1     4     5     2];    %we,xiangdui   

[a,b]=size(A);
B=[];
for c=1:a;
    C=A(c,:);
    [D,IX]=sort(C);
    B=[B;IX];
end
B=B;
P=[];
for a1=1:a;
    P1=[];
    for a2=1:a;
    pi=1-(6.*(sum((B(a1,:)-B(a2,:)).^2)))./(b.*(b.^2-1));
    P1=[P1;pi];
    end
    P=[P,P1];
end
P=P


%X=[10	5	1	2	8	6	9	4	7	3]';
%Y=[10	4	1	2	9	5	7	8	6	3  ]';
%coeff = corr(X , Y , 'type' , 'Spearman')