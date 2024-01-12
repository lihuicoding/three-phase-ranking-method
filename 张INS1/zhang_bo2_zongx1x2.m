clc
clear all
close all
%zhuchnegxu_7_2    对应的数据结果
T_7_2=dan_x1_7_2();%x1,阈值越大越好
TT_7_2=dan_x2_7_2();%x2，阈值越小越好
TZ_7_2=T_7_2./(T_7_2+TT_7_2);
[n1_7_2,m1_7_2]=sort(TZ_7_2(1,:),'descend');%%%%%阿尔法
m1_7_2;
[n2_7_2,m2_7_2]=sort(TZ_7_2(2,:),'descend');%%%%%伽玛
m2_7_2;
[n3_7_2,m3_7_2]=sort(TZ_7_2(3,:),'descend'); %%%%%贝塔
m3_7_2;


%zhuchnegxu_7_3    对应的数据结果
T_7_3=dan_x1_7_3();%x1,阈值越大越好
TT_7_3=dan_x2_7_3();%x2，阈值越小越好
TZ_7_3=T_7_3./(T_7_3+TT_7_3);
[n1_7_3,m1_7_3]=sort(TZ_7_3(1,:),'descend');%%%%%阿尔法
m1_7_3;
[n2_7_3,m2_7_3]=sort(TZ_7_3(2,:),'descend');%%%%%伽玛
m2_7_3;
[n3_7_3,m3_7_3]=sort(TZ_7_3(3,:),'descend'); %%%%%贝塔
m3_7_3;

%zhuchnegxu_7_4    对应的数据结果
T_7_4=dan_x1_7_4();%x1,阈值越大越好
TT_7_4=dan_x2_7_4();%x2，阈值越小越好
TZ_7_4=T_7_4./(T_7_4+TT_7_4);
[n1_7_4,m1_7_4]=sort(TZ_7_4(1,:),'descend');%%%%%阿尔法
m1_7_4;
[n2_7_4,m2_7_4]=sort(TZ_7_4(2,:),'descend');%%%%%伽玛
m2_7_4;
[n3_7_4,m3_7_4]=sort(TZ_7_4(3,:),'descend'); %%%%%贝塔
m3_7_4;

%zhuchnegxu_7_5    对应的数据结果
T_7_5=dan_x1_7_5();%x1,阈值越大越好
TT_7_5=dan_x2_7_5();%x2，阈值越小越好
TZ_7_5=T_7_5./(T_7_5+TT_7_5);
[n1_7_5,m1_7_5]=sort(TZ_7_5(1,:),'descend');%%%%%阿尔法
m1_7_5;
[n2_7_5,m2_7_5]=sort(TZ_7_5(2,:),'descend');%%%%%伽玛
m2_7_5;
[n3_7_5,m3_7_5]=sort(TZ_7_5(3,:),'descend'); %%%%%贝塔
m3_7_5;


%zhuchnegxu_7_6   对应的数据结果
T_7_6=dan_x1_7_6();%x1,阈值越大越好
TT_7_6=dan_x2_7_6();%x2，阈值越小越好
TZ_7_6=T_7_6./(T_7_6+TT_7_6);
[n1_7_6,m1_7_6]=sort(TZ_7_6(1,:),'descend');%%%%%阿尔法
m1_7_6;
[n2_7_6,m2_7_6]=sort(TZ_7_6(2,:),'descend');%%%%%伽玛
m2_7_6;
[n3_7_6,m3_7_6]=sort(TZ_7_6(3,:),'descend'); %%%%%贝塔
m3_7_6;

%zhuchnegxu_7_7    对应的数据结果
T_7_7=dan_x1_7_7();%x1,阈值越大越好
TT_7_7=dan_x2_7_7();%x2，阈值越小越好
TZ_7_7=T_7_7./(T_7_7+TT_7_7);
[n1_7_7,m1_7_7]=sort(TZ_7_7(1,:),'descend');%%%%%阿尔法
m1_7_7;
[n2_7_7,m2_7_7]=sort(TZ_7_7(2,:),'descend');%%%%%伽玛
m2_7_7;
[n3_7_7,m3_7_7]=sort(TZ_7_7(3,:),'descend'); %%%%%贝塔
m3_7_7;


data_7_2= [m1_7_2',m2_7_2',m3_7_2'];                           % 将数据组集到data
[m_data_7_2, n_data_7_2] = size(data_7_2);            
data_7_2_cell = mat2cell(data_7_2, ones(m_data_7_2,1), ones(n_data_7_2,1)); % 将data切割成m_data*n_data的cell矩阵
title_7_2 = {'阿尔法_7_2', '伽玛_7_2', '贝塔_7_2'};  % 添加变量名称
result_7_2 = [title_7_2; data_7_2_cell];   % 将变量名称和数值组集到result
s_7_2=xlswrite('paixu_7_2z.xls', result_7_2);    % 将result写入到paixu.xls文件中

data_7_3= [m1_7_3',m2_7_3',m3_7_3'];                           % 将数据组集到data
[m_data_7_3, n_data_7_3] = size(data_7_3);            
data_7_3_cell = mat2cell(data_7_3, ones(m_data_7_3,1), ones(n_data_7_3,1)); % 将data切割成m_data*n_data的cell矩阵
title_7_3 = {'阿尔法_7_3', '伽玛_7_3', '贝塔_7_3'};  % 添加变量名称
result_7_3 = [title_7_3; data_7_3_cell];   % 将变量名称和数值组集到result
s_7_3=xlswrite('paixu_7_3z.xls', result_7_3);    % 将result写入到paixu.xls文件中

data_7_4= [m1_7_4',m2_7_4',m3_7_4'];                           % 将数据组集到data
[m_data_7_4, n_data_7_4] = size(data_7_4);            
data_7_4_cell = mat2cell(data_7_4, ones(m_data_7_4,1), ones(n_data_7_4,1)); % 将data切割成m_data*n_data的cell矩阵
title_7_4 = {'阿尔法_7_4', '伽玛_7_4', '贝塔_7_4'};  % 添加变量名称
result_7_4 = [title_7_4; data_7_4_cell];   % 将变量名称和数值组集到result
s_7_4=xlswrite('paixu_7_4z.xls', result_7_4);   % 将result写入到paixu.xls文件中


data_7_5= [m1_7_5',m2_7_5',m3_7_5'];                           % 将数据组集到data
[m_data_7_5, n_data_7_5] = size(data_7_5);            
data_7_5_cell = mat2cell(data_7_5, ones(m_data_7_5,1), ones(n_data_7_5,1)); % 将data切割成m_data*n_data的cell矩阵
title_7_5 = {'阿尔法_7_5', '伽玛_7_5', '贝塔_7_5'};  % 添加变量名称
result_7_5 = [title_7_5; data_7_5_cell];   % 将变量名称和数值组集到result
s_7_5=xlswrite('paixu_7_5z.xls', result_7_5);    % 将result写入到paixu.xls文件中

data_7_6= [m1_7_6',m2_7_6',m3_7_6'];                           % 将数据组集到data
[m_data_7_6, n_data_7_6] = size(data_7_6);            
data_7_6_cell = mat2cell(data_7_6, ones(m_data_7_6,1), ones(n_data_7_6,1)); % 将data切割成m_data*n_data的cell矩阵
title_7_6 = {'阿尔法_7_6', '伽玛_7_6', '贝塔_7_6'};  % 添加变量名称
result_7_6 = [title_7_6; data_7_6_cell];   % 将变量名称和数值组集到result
s_7_6=xlswrite('paixu_7_6z.xls', result_7_6);    % 将result写入到paixu6.xls文件中



data_7_7= [m1_7_7',m2_7_7',m3_7_7'];                           % 将数据组集到data
[m_data_7_7, n_data_7_7] = size(data_7_7);            
data_7_7_cell = mat2cell(data_7_7, ones(m_data_7_7,1), ones(n_data_7_7,1)); % 将data切割成m_data*n_data的cell矩阵
title_7_7 = {'阿尔法_7_7', '伽玛_7_7', '贝塔_7_7'};  % 添加变量名称
result_7_7 = [title_7_7; data_7_7_cell];   % 将变量名称和数值组集到result
s_7_7=xlswrite('paixu_7_7z.xls', result_7_7);    % 将result写入到paixu.xls文件中
