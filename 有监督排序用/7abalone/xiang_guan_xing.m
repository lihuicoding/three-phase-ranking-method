clc
clear all
close all
%�����Ҫ���ڷ�������֮�������ԡ��������Ժ;�������֮�����������ԡ�����ѭ����ֵԽ����������Խǿ��
X1=xlsread('C:\Users\Administrator\Desktop\��������ʵ��\ʵ�顪�ع顪abalone\abalone','A14:H4190'); 
X2=xlsread('C:\Users\Administrator\Desktop\��������ʵ��\ʵ�顪�ع顪abalone\abalone','I14:I4190');  %Y1
X11=[X1,X2];
corr(X11)
% X3=xlsread('C:\Users\Administrator\Desktop\���� ����д����\������2ƪ- ׼��ƫ���µ���֧��׼����߷���\����\����\ʵ�����\ʵ�顪�ع顪Energy\Energy_efficiency','J2:J769'); %Y2
% X12=[X1,X3];
% corr(X12)

%����Ľ���� Cement (component 1)(kg in a m^3 mixture)	Blast Furnace Slag (component 2)(kg in a m^3 mixture)	Fly Ash (component 3)(kg in a m^3 mixture)	Water  (component 4)(kg in a m^3 mixture)	Superplasticizer (component 5)(kg in a m^3 mixture)	Coarse Aggregate  (component 6)(kg in a m^3 mixture)	Fine Aggregate (component 7)(kg in a m^3 mixture)	Age (day)

% 2  1 1 1 1 1 1 1
 