clc
clear all
close all
PAI_7_2=xlsread('C:\Users\张凯凯\Desktop\张bo7程序\paixu_7_2','A2:L188');
PPPP1_7_2=Spearman(PAI_7_2');
PPPP2_7_2=relative_volatility(PAI_7_2');
writematrix(PPPP1_7_2,'Spearman_7_2.xls','Range','A1:L12')
writematrix(PPPP2_7_2,'relative_volatility_7_2.xls','Range','A1:L12')

PAI_7_3=xlsread('C:\Users\张凯凯\Desktop\张bo7程序\paixu_7_3','A2:L1600');
PPPP1_7_3=Spearman(PAI_7_3');
PPPP2_7_3=relative_volatility(PAI_7_3');
writematrix(PPPP1_7_3,'Spearman_7_3.xls','Range','A1:L12')
writematrix(PPPP2_7_3,'relative_volatility_7_3.xls','Range','A1:L12')

PAI_7_4=xlsread('C:\Users\张凯凯\Desktop\张bo7程序\paixu_7_4','A2:L4899');
PPPP1_7_4=Spearman(PAI_7_4');
PPPP2_7_4=relative_volatility(PAI_7_4');
writematrix(PPPP1_7_4,'Spearman_7_4.xls','Range','A1:L12')
writematrix(PPPP2_7_4,'relative_volatility_7_4.xls','Range','A1:L12')




PAI_7_5=xlsread('C:\Users\张凯凯\Desktop\张bo7程序\paixu_7_5','A2:L144');
PPPP1_7_5=Spearman(PAI_7_5');
PPPP2_7_5=relative_volatility(PAI_7_5');
writematrix(PPPP1_7_5,'Spearman_7_5.xls','Range','A1:L12')
writematrix(PPPP2_7_5,'relative_volatility_7_5.xls','Range','A1:L12')



PAI_7_6=xlsread('C:\Users\张凯凯\Desktop\张bo7程序\paixu_7_6','A2:L981');
PPPP1_7_6=Spearman(PAI_7_6');
PPPP2_7_6=relative_volatility(PAI_7_6');
writematrix(PPPP1_7_6,'Spearman_7_6.xls','Range','A1:L12')
writematrix(PPPP2_7_6,'relative_volatility_7_6.xls','Range','A1:L12')



PAI_7_7=xlsread('C:\Users\张凯凯\Desktop\张bo7程序\paixu_7_7','A2:N245');
PPPP1_7_7=Spearman(PAI_7_7');
PPPP2_7_7=relative_volatility(PAI_7_7');
writematrix(PPPP1_7_7,'Spearman_7_7.xls','Range','A1:N14')
writematrix(PPPP2_7_7,'relative_volatility_7_7.xls','Range','A1:N14')













