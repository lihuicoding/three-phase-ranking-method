function D=Dist(W,H1,H2)
D=sqrt(sum(W.*(H1-H2).^2));
end