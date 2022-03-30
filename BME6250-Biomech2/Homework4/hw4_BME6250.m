% Created by: Anthony H. Le
% Last modified: 2022-03-27

% BME 6250 - Biomechanics II
% Homework 4
% Due date: 2022-03-29, 09:00 MST

%% Problem 1
clc; clear; close all;

stress_data = readtable('.\hw4prb1_CauchyStress_Data.csv');

figure();
hold on;
plot(stress_data.x + 1, stress_data.k_0, '-o', 'LineWidth', 2);
plot(stress_data.x_1 + 1, stress_data.k_0_0667, '-o', 'LineWidth', 2);
plot(stress_data.x_2 + 1, stress_data.k_0_1333, '-o', 'LineWidth', 2);
plot(stress_data.x_3 + 1, stress_data.k_0_2, '-o', 'LineWidth', 2);
plot(stress_data.x_4 + 1, stress_data.k_0_2667, '-o', 'LineWidth', 2);
plot(stress_data.x_5 + 1, stress_data.k_0_3333, '-o', 'LineWidth', 2);
xlabel('\lambda');
ylabel('Cauchy Stress (MPa)');
grid on;
set(gcf,'position',[200, 200, 1000, 500])
legend('\kappa = 0', '\kappa = 1/15', '\kappa = 2/15', '\kappa = 1/5', '\kappa = 4/15', '\kappa = 1/3', 'Location', 'northwest');
hold off;

%% Problem 2a
clc; clear; close all;

loaded_woPS = readtable('.\data\hw4prb2a_CircumRadialStress_Data.csv');

figure();
hold on;
plot(loaded_woPS.x_pos, loaded_woPS.y_stress, '-o', 'LineWidth', 2)
plot(loaded_woPS.x_pos, loaded_woPS.x_stress, '-o', 'LineWidth', 2)
xlabel('Radial Position (X-Position, mm)');
ylabel('Stress (kPa)');
grid on;
set(gcf,'position',[200, 200, 1000, 500])
legend('Circumferential Stress (Y-Stress)', 'Radial Stress (X-Stress)');
hold off;

%% Problem 2b
clc; clear; close all;

loaded_wPS = readtable('.\data\hw4prb2c_CircumResStress_Data1.csv');

figure();
hold on;
plot(loaded_wPS.x, loaded_wPS.y_stress, '-o', 'LineWidth', 2)
xlabel('Radial Position (X-Position, mm)');
ylabel('Circumferential Stress (Y-Stress, kPa)');
grid on;
set(gcf,'position',[200, 200, 1000, 500])
hold off;

%% Problem 2c
clc; clear; close all;

loaded_woPS = readtable('.\data\hw4prb2a_CircumRadialStress_Data.csv');
loaded_wPS = readtable('.\data\hw4prb2c_CircumResStress_Data2.csv');

figure();
hold on;
plot(loaded_woPS.x_pos, loaded_woPS.y_stress, '-o', 'LineWidth', 2)
plot(loaded_wPS.x, loaded_wPS.y_stress, '-o', 'LineWidth', 2)
xlabel('Radial Position (X-Position, mm)');
ylabel('Circumferential Stress (Y-Stress, kPa)');
grid on;
set(gcf,'position',[200, 200, 1000, 500])
legend('Loaded without Pre-Strain', 'Loaded with Pre-Strain');
hold off;

%% Problem 3a
clc; clear; close all;

fl_data = readtable('.\Hill_Tutorial\data\hw4prb3a_HillModelFL_Data.csv');

figure();
hold on;
plot(fl_data.x(2:end, 1), fl_data.a_0(2:end, 1), '-o', 'LineWidth', 2)
plot(fl_data.x(2:end, 1), fl_data.a_25(2:end, 1), '-o', 'LineWidth', 2)
plot(fl_data.x(2:end, 1), fl_data.a_50(2:end, 1), '-o', 'LineWidth', 2)
plot(fl_data.x(2:end, 1), fl_data.a_75(2:end, 1), '-o', 'LineWidth', 2)
plot(fl_data.x(2:end, 1), fl_data.a_100(2:end, 1), '-o', 'LineWidth', 2)
xlabel('Length (X-Displacement, mm)');
ylabel('Force (X-Rigid Force, N)');
grid on;
set(gcf,'position',[200, 200, 1000, 500])
title('Force-Length Curve');
legend('0% Activation', '25% Activation', '50% Activation', '75% Activation', '100% Activation', 'Location', 'southeast');
hold off;

%% Problem 3b
clc; clear; close all;

fv_data = readtable('.\Hill_Tutorial\data\hw4prb3b_HillModelFV_Data.csv');

f = [50, 40, 30, 20, 10, 5, 2]';
v = table2array(fv_data(end, 2:end))';

figure();
hold on;
plot(v, f, '-o', 'LineWidth', 2)
xlabel('Veocity (mm/s)');
ylabel('Force (N)');
grid on;
set(gcf,'position',[200, 200, 1000, 500])
title('Force-Velocity Curve');
hold off;

%% Problem 4
clc; clear; close all;

apex_data = readtable('.\Cardiac Mechanics Benchmark Problems\data\hw4prb4_Apex_Z-PosData.csv');

figure();
hold on;
plot(apex_data.time, apex_data.apex, '-o', 'LineWidth', 2)
xlabel('Time (s)');
ylabel('Z-Position (mm)');
grid on;
set(gcf,'position',[200, 200, 1000, 500])
hold off;

