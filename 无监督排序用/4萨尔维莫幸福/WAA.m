function [A,m,n]=WAA(H,w)
[pp,qq]=size(H);
 A=H*w';
 [m,n]=sort(A','descend');
end
