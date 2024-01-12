clc
clear all
close all
%这个主要用于分析数据之间的相关性。条件属性和决策属性之间的正负相关性。都遵循属性值越大，属性意义越强。
X1=xlsread('C:\Users\Administrator\Desktop\数据增加实验\实验—回归—abalone\abalone','A14:H4190'); 
X2=xlsread('C:\Users\Administrator\Desktop\数据增加实验\实验—回归—abalone\abalone','I14:I4190');  %Y1
X11=[X1,X2];
corr(X11)
% X3=xlsread('C:\Users\Administrator\Desktop\工作 安大写文章\工作第2篇- 准则偏好下的三支多准则决策方法\程序\本身\实验分析\实验—回归—Energy\Energy_efficiency','J2:J769'); %Y2
% X12=[X1,X3];
% corr(X12)

%计算的结果是 Cement (component 1)(kg in a m^3 mixture)	Blast Furnace Slag (component 2)(kg in a m^3 mixture)	Fly Ash (component 3)(kg in a m^3 mixture)	Water  (component 4)(kg in a m^3 mixture)	Superplasticizer (component 5)(kg in a m^3 mixture)	Coarse Aggregate  (component 6)(kg in a m^3 mixture)	Fine Aggregate (component 7)(kg in a m^3 mixture)	Age (day)

% 2  1 1 1 1 1 1 1
 