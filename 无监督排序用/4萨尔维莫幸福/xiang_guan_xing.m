clc
clear all
close all
%这个主要用于分析数据之间的相关性。条件属性和决策属性之间的正负相关性。都遵循属性值越大，属性意义越强。
X1=xlsread('C:\Users\Administrator\Desktop\工作 安大写文章\工作第2篇- 准则偏好下的三支多准则决策方法\程序\本身\实验分析\实验—有序分类—萨尔维莫幸福\Somerville','B2:G144'); 
X2=xlsread('C:\Users\Administrator\Desktop\工作 安大写文章\工作第2篇- 准则偏好下的三支多准则决策方法\程序\本身\实验分析\实验—有序分类—萨尔维莫幸福\Somerville','A2:A144');
X=[X1,X2];
corr(X)

%计算的结果是 fixed acidity （正相关）	residual sugar（正相关）	chlorides（负相关）	total sulfur dioxide（负相关）	free sulfur dioxide（负相关） volatile acidity（负相关）	citric acid（正相关）	density（负相关）	pH（负相关）	sulphates（正相关）	alcohol（正相关）
