clc
clear all
close all
%zhuchnegxu_7_2    ��Ӧ�����ݽ��
T_7_2=dan_x1_7_2();%x1,��ֵԽ��Խ��
TT_7_2=dan_x2_7_2();%x2����ֵԽСԽ��
TZ_7_2=T_7_2./(T_7_2+TT_7_2);
[n1_7_2,m1_7_2]=sort(TZ_7_2(1,:),'descend');%%%%%������
m1_7_2;
[n2_7_2,m2_7_2]=sort(TZ_7_2(2,:),'descend');%%%%%٤��
m2_7_2;
[n3_7_2,m3_7_2]=sort(TZ_7_2(3,:),'descend'); %%%%%����
m3_7_2;


%zhuchnegxu_7_3    ��Ӧ�����ݽ��
T_7_3=dan_x1_7_3();%x1,��ֵԽ��Խ��
TT_7_3=dan_x2_7_3();%x2����ֵԽСԽ��
TZ_7_3=T_7_3./(T_7_3+TT_7_3);
[n1_7_3,m1_7_3]=sort(TZ_7_3(1,:),'descend');%%%%%������
m1_7_3;
[n2_7_3,m2_7_3]=sort(TZ_7_3(2,:),'descend');%%%%%٤��
m2_7_3;
[n3_7_3,m3_7_3]=sort(TZ_7_3(3,:),'descend'); %%%%%����
m3_7_3;

%zhuchnegxu_7_4    ��Ӧ�����ݽ��
T_7_4=dan_x1_7_4();%x1,��ֵԽ��Խ��
TT_7_4=dan_x2_7_4();%x2����ֵԽСԽ��
TZ_7_4=T_7_4./(T_7_4+TT_7_4);
[n1_7_4,m1_7_4]=sort(TZ_7_4(1,:),'descend');%%%%%������
m1_7_4;
[n2_7_4,m2_7_4]=sort(TZ_7_4(2,:),'descend');%%%%%٤��
m2_7_4;
[n3_7_4,m3_7_4]=sort(TZ_7_4(3,:),'descend'); %%%%%����
m3_7_4;

%zhuchnegxu_7_5    ��Ӧ�����ݽ��
T_7_5=dan_x1_7_5();%x1,��ֵԽ��Խ��
TT_7_5=dan_x2_7_5();%x2����ֵԽСԽ��
TZ_7_5=T_7_5./(T_7_5+TT_7_5);
[n1_7_5,m1_7_5]=sort(TZ_7_5(1,:),'descend');%%%%%������
m1_7_5;
[n2_7_5,m2_7_5]=sort(TZ_7_5(2,:),'descend');%%%%%٤��
m2_7_5;
[n3_7_5,m3_7_5]=sort(TZ_7_5(3,:),'descend'); %%%%%����
m3_7_5;


%zhuchnegxu_7_6   ��Ӧ�����ݽ��
T_7_6=dan_x1_7_6();%x1,��ֵԽ��Խ��
TT_7_6=dan_x2_7_6();%x2����ֵԽСԽ��
TZ_7_6=T_7_6./(T_7_6+TT_7_6);
[n1_7_6,m1_7_6]=sort(TZ_7_6(1,:),'descend');%%%%%������
m1_7_6;
[n2_7_6,m2_7_6]=sort(TZ_7_6(2,:),'descend');%%%%%٤��
m2_7_6;
[n3_7_6,m3_7_6]=sort(TZ_7_6(3,:),'descend'); %%%%%����
m3_7_6;

%zhuchnegxu_7_7    ��Ӧ�����ݽ��
T_7_7=dan_x1_7_7();%x1,��ֵԽ��Խ��
TT_7_7=dan_x2_7_7();%x2����ֵԽСԽ��
TZ_7_7=T_7_7./(T_7_7+TT_7_7);
[n1_7_7,m1_7_7]=sort(TZ_7_7(1,:),'descend');%%%%%������
m1_7_7;
[n2_7_7,m2_7_7]=sort(TZ_7_7(2,:),'descend');%%%%%٤��
m2_7_7;
[n3_7_7,m3_7_7]=sort(TZ_7_7(3,:),'descend'); %%%%%����
m3_7_7;


data_7_2= [m1_7_2',m2_7_2',m3_7_2'];                           % �������鼯��data
[m_data_7_2, n_data_7_2] = size(data_7_2);            
data_7_2_cell = mat2cell(data_7_2, ones(m_data_7_2,1), ones(n_data_7_2,1)); % ��data�и��m_data*n_data��cell����
title_7_2 = {'������_7_2', '٤��_7_2', '����_7_2'};  % ��ӱ�������
result_7_2 = [title_7_2; data_7_2_cell];   % ���������ƺ���ֵ�鼯��result
s_7_2=xlswrite('paixu_7_2z.xls', result_7_2);    % ��resultд�뵽paixu.xls�ļ���

data_7_3= [m1_7_3',m2_7_3',m3_7_3'];                           % �������鼯��data
[m_data_7_3, n_data_7_3] = size(data_7_3);            
data_7_3_cell = mat2cell(data_7_3, ones(m_data_7_3,1), ones(n_data_7_3,1)); % ��data�и��m_data*n_data��cell����
title_7_3 = {'������_7_3', '٤��_7_3', '����_7_3'};  % ��ӱ�������
result_7_3 = [title_7_3; data_7_3_cell];   % ���������ƺ���ֵ�鼯��result
s_7_3=xlswrite('paixu_7_3z.xls', result_7_3);    % ��resultд�뵽paixu.xls�ļ���

data_7_4= [m1_7_4',m2_7_4',m3_7_4'];                           % �������鼯��data
[m_data_7_4, n_data_7_4] = size(data_7_4);            
data_7_4_cell = mat2cell(data_7_4, ones(m_data_7_4,1), ones(n_data_7_4,1)); % ��data�и��m_data*n_data��cell����
title_7_4 = {'������_7_4', '٤��_7_4', '����_7_4'};  % ��ӱ�������
result_7_4 = [title_7_4; data_7_4_cell];   % ���������ƺ���ֵ�鼯��result
s_7_4=xlswrite('paixu_7_4z.xls', result_7_4);   % ��resultд�뵽paixu.xls�ļ���


data_7_5= [m1_7_5',m2_7_5',m3_7_5'];                           % �������鼯��data
[m_data_7_5, n_data_7_5] = size(data_7_5);            
data_7_5_cell = mat2cell(data_7_5, ones(m_data_7_5,1), ones(n_data_7_5,1)); % ��data�и��m_data*n_data��cell����
title_7_5 = {'������_7_5', '٤��_7_5', '����_7_5'};  % ��ӱ�������
result_7_5 = [title_7_5; data_7_5_cell];   % ���������ƺ���ֵ�鼯��result
s_7_5=xlswrite('paixu_7_5z.xls', result_7_5);    % ��resultд�뵽paixu.xls�ļ���

data_7_6= [m1_7_6',m2_7_6',m3_7_6'];                           % �������鼯��data
[m_data_7_6, n_data_7_6] = size(data_7_6);            
data_7_6_cell = mat2cell(data_7_6, ones(m_data_7_6,1), ones(n_data_7_6,1)); % ��data�и��m_data*n_data��cell����
title_7_6 = {'������_7_6', '٤��_7_6', '����_7_6'};  % ��ӱ�������
result_7_6 = [title_7_6; data_7_6_cell];   % ���������ƺ���ֵ�鼯��result
s_7_6=xlswrite('paixu_7_6z.xls', result_7_6);    % ��resultд�뵽paixu6.xls�ļ���



data_7_7= [m1_7_7',m2_7_7',m3_7_7'];                           % �������鼯��data
[m_data_7_7, n_data_7_7] = size(data_7_7);            
data_7_7_cell = mat2cell(data_7_7, ones(m_data_7_7,1), ones(n_data_7_7,1)); % ��data�и��m_data*n_data��cell����
title_7_7 = {'������_7_7', '٤��_7_7', '����_7_7'};  % ��ӱ�������
result_7_7 = [title_7_7; data_7_7_cell];   % ���������ƺ���ֵ�鼯��result
s_7_7=xlswrite('paixu_7_7z.xls', result_7_7);    % ��resultд�뵽paixu.xls�ļ���
