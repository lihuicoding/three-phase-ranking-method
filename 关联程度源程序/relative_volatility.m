clc
clear all
close all
A=[ 6     8     3     1     5     7     4     2   %we
    6     8     3     1     5     7     4     2   %top
    6     8     3     1     5     7     4     2  % Zhang
    6     8     3     1     7     5     4     2  %jia
    6     8     3     1     2     5     4     7   %ye
    6     7     3     8     1     4     2     5    %we,juedui
    6     8     3     7     1     4     5     2];    %we,xiangdui 
[a,b]=size(A);
c=b*(b-1)/2;  %����Ե�����
%x=[6     8     3     1     5     7     4     2];  %����1������
%y=[2,3,1];  %����2������
%c=length(x)*(length(x)-1)/2;  %��Ե�����
%ff=abs(ni_xu(x)-ni_xu(y))/c  %��س̶�

%��������֮�����س̶�
P=[];
for a1=1:a;
    P1=[];
    for a2=1:a;
    pi=abs(ni_xu(A(a1,:))-ni_xu(A(a2,:)))/c;
    P1=[P1;pi];
    end
    P=[P,P1];
end
P=1.-P
