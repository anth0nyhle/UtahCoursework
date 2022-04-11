% Created by: Anthony H. Le
% Last modified: 2022-04-11

% BME 6250 - Biomechanics II
% Homework 5
% Due date: 2022-04-12, 09:00 MST

%% Problem 2a
clc; clear; close all;

fluidPress_data = readtable('.\hw5prb2a_EffectiveFluidPress.csv');

figure();
hold on;
plot(fluidPress_data.x, fluidPress_data.N1, '-o', 'LineWidth', 2);
plot(fluidPress_data.x, fluidPress_data.N4, '-o', 'LineWidth', 2);
plot(fluidPress_data.x, fluidPress_data.N21, '-o', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Effective Fluid Pressure (MPa)');
grid on;
set(gcf,'position',[200, 200, 1000, 500])
legend('Node 1 (Bottom)', 'Node 4 (Middle)', 'Node 21 (Top)');
hold off;

%% Problem 2b
clc; clear; close all;

zStrain_data = readtable('.\hw5prb2b_Z-Strain.csv');

figure();
hold on;
plot(zStrain_data.x, zStrain_data.N1, '-o', 'LineWidth', 2);
plot(zStrain_data.x, zStrain_data.N4, '-o', 'LineWidth', 2);
plot(zStrain_data.x, zStrain_data.N21, '-o', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Z-Strain (mm)');
grid on;
set(gcf,'position',[200, 200, 1000, 500])
legend('Node 1 (Bottom)', 'Node 4 (Middle)', 'Node 21 (Top)');
hold off;

%% Problem 2c
clc; clear; close all;

fluidPress_data = readtable('.\hw5prb2c_EffectiveFluidPress.csv');
zStress_data = readtable('.\hw5prb2c_Z-Stress.csv');

figure();
hold on;
plot(fluidPress_data.x, fluidPress_data.E1_1, '-o', 'LineWidth', 2);
plot(fluidPress_data.x, fluidPress_data.E1_2, '-o', 'LineWidth', 2);
plot(fluidPress_data.x, fluidPress_data.E1_3, '-o', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Effective Fluid Pressure (MPa)');
grid on;
set(gcf,'position',[200, 200, 1000, 500])
legend('Permeability = 0.0003 mm^{4}/Ns', 'Permeability = 0.003 mm^{4}/Ns', 'Permeability = 0.03 mm^{4}/Ns');
hold off;

figure();
hold on;
plot(zStress_data.x, zStress_data.E1_1, '-o', 'LineWidth', 2);
plot(zStress_data.x, zStress_data.E1_2, '-o', 'LineWidth', 2);
plot(zStress_data.x, zStress_data.E1_3, '-o', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Z-Stress (MPa)');
grid on;
set(gcf,'position',[200, 200, 1000, 500])
legend('Permeability = 0.0003 mm^{4}/Ns', 'Permeability = 0.003 mm^{4}/Ns', 'Permeability = 0.03 mm^{4}/Ns');
hold off;