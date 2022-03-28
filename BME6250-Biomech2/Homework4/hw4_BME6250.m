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

artery_data = readtable('.\hw4prb2a_CircumRadialStress_Data.csv');

figure();
hold on;
plot(artery_data.x_pos, artery_data.y_stress, '-o', 'LineWidth', 2)
plot(artery_data.x_pos, artery_data.x_stress, '-o', 'LineWidth', 2)
xlabel('Radial Position (X-Position, mm)');
ylabel('Stress (kPa)');
grid on;
set(gcf,'position',[200, 200, 1000, 500])
legend('Circumferential Stress (Y-Stress)', 'Radial Stress (X-Stress)');
hold off;

%% Problem 2b & 2c
clc; clear; close all;

artery_data = readtable('.\hw4prb2c_CircumRadialResStress_Data.csv');

figure();
hold on;
plot(artery_data.x_pos1, artery_data.y_stress1, '-o', 'LineWidth', 2)
plot(artery_data.x_pos1, artery_data.x_stress1, '-o', 'LineWidth', 2)
xlabel('Radial Position (X-Position, mm)');
ylabel('Stress (kPa)');
grid on;
set(gcf,'position',[200, 200, 1000, 500])
title('Unloaded Configuration (after applying pre-strain)');
legend('Circumferential Stress (Y-Stress)', 'Radial Stress (X-Stress)', 'Location', 'northwest');
hold off;

figure();
hold on;
plot(artery_data.x_pos2, artery_data.y_stress2, '-o', 'LineWidth', 2)
plot(artery_data.x_pos2, artery_data.x_stress2, '-o', 'LineWidth', 2)
xlabel('Radial Position (X-Position, mm)');
ylabel('Stress (kPa)');
grid on;
set(gcf,'position',[200, 200, 1000, 500])
title('Loaded Configuration (after applying luminal pressure)');
legend('Circumferential Stress (Y-Stress)', 'Radial Stress (X-Stress)');
hold off;

%% Problem 3a
clc; clear; close all;

fl_data = readtable('.\Hill_Tutorial\hw4prb3a_HillModelFL_Data.csv');

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

fv_data = readtable('.\Hill_Tutorial\hw4prb3b_HillModelFV_Data.csv');

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

apex_data = readtable('.\Cardiac Mechanics Benchmark Problems\hw4prb4_Apex_Z-PosData.csv');

figure();
hold on;
plot(apex_data.time, apex_data.apex, '-o', 'LineWidth', 2)
xlabel('Time (s)');
ylabel('Z-Position (mm)');
grid on;
set(gcf,'position',[200, 200, 1000, 500])
hold off;

