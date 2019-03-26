clc; clear all; close all;
%%
format long;
load('data.mat');
global Fs;
%% question 1 : Mendonça-Cipolla method
Init_value = [A(1, 1), A(2, 2), A(1, 2), A(1, 3), A(2, 3)];

OPTIONS = optimoptions('lsqnonlin', 'Algorithm','levenberg-marquardt','TolFun', 1e-32,'TolX',1e-32);

mendonca_Cipolla = lsqnonlin(@mendonca_costfunction, Init_value, [], [], OPTIONS)

disp('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
disp('Calculat Intrinsic parameters using Mendonça-Cipolla method');
disp(mendonca_Cipolla)
disp('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$')

%% question 2 : the classical and simplified Kruppa’s

classical_Kruppa = lsqnonlin(@classical_Kruppa_CostFun, Init_value, [], [], OPTIONS)
disp('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
disp('Calculat Intrinsic parameters using Classical_kruppa method');
disp(classical_Kruppa)
disp('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$')
%simplified Kruppa
simplified_Kruppa = lsqnonlin(@simplified_Kruppa_CostFun, Init_value, [], [], OPTIONS)
disp('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
disp('Calculat Intrinsic parameters using Simplified_kruppa method');
disp(simplified_Kruppa)
disp('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$')

 

