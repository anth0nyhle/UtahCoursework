% Created by: Anthony H. Le
% Last modified: 2022-04-22

% BME 6250 - Biomechanics II
% Homework 6
% Due date: 2022-04-26, 09:00 MST

%% Problem 1b
clc; clear; close all;

indenter_data = readtable('.\hw6prb1_opt_results.csv');

figure();
hold on;
plot(indenter_data.time, indenter_data.indenter_z, '-o', 'LineWidth', 1.5, 'MarkerSize', 10);
plot(indenter_data.time, indenter_data.final_z, '-x', 'LineWidth', 1.5, 'MarkerSize', 10);
plot(indenter_data.time, indenter_data.init_z, '-x', 'LineWidth', 1.5, 'MarkerSize', 10);
xlabel('Time (s)');
ylabel('Z-Force (kPa)');
grid on;
set(gcf,'position',[200, 200, 1000, 600])
legend('Experimental Data', 'Optimized Coefficients', 'Initial Coefficients');
hold off;