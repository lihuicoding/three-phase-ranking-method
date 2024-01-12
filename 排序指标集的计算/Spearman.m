function P=Spearman(A)
[a,b]=size(A);
B=[];
for c=1:a
    C=A(c,:);
    [D,IX]=sort(C);
    B=[B;IX];
end
B=B;
P=[];
for a1=1:a
    P1=[];
    for a2=1:a
    pi=1-(6.*(sum((B(a1,:)-B(a2,:)).^2)))./(b.*(b.^2-1));
    P1=[P1;pi];
    end
    P=[P,P1];
end
P=P;
end
