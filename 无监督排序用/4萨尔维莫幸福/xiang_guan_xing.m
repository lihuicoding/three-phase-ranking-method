clc
clear all
close all
%�����Ҫ���ڷ�������֮�������ԡ��������Ժ;�������֮�����������ԡ�����ѭ����ֵԽ����������Խǿ��
X1=xlsread('C:\Users\Administrator\Desktop\���� ����д����\������2ƪ- ׼��ƫ���µ���֧��׼����߷���\����\����\ʵ�����\ʵ�顪������ࡪ����άĪ�Ҹ�\Somerville','B2:G144'); 
X2=xlsread('C:\Users\Administrator\Desktop\���� ����д����\������2ƪ- ׼��ƫ���µ���֧��׼����߷���\����\����\ʵ�����\ʵ�顪������ࡪ����άĪ�Ҹ�\Somerville','A2:A144');
X=[X1,X2];
corr(X)

%����Ľ���� fixed acidity ������أ�	residual sugar������أ�	chlorides������أ�	total sulfur dioxide������أ�	free sulfur dioxide������أ� volatile acidity������أ�	citric acid������أ�	density������أ�	pH������أ�	sulphates������أ�	alcohol������أ�
