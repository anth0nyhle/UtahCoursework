% Created by: Anthony H. Le
% Last updated: 2022-01-26

% BME 6250 - Biomechanics II
% Homework 1
% Due date: 2022-01-27, 09:00 MST

%% Problem 1
close all;
clear;

% initialize symbolic variables
syms lambda1 lambda2 lambda3 alpha E 

% define the deformation gradient
F = [lambda1 0 alpha;
    0 lambda2 0;
    0 0 lambda3];

% solve for the determinant of the deformation gradient
det(F);

% calculate the Green-Lagrange strain tensor
E = (1/2) * (transpose(F) * F - 1); 

%% Problem 2
close all;
clear;

% define the deformation gradient
F = [1.2287 0.8604 0;
    -0.8604 1.2287 0;
    0 0 0.4444];

% right deformation tensor
C = transpose(F) * F; % multiply transpose F by F

% right stretch tensor
U = sqrtm(C); % calculate stretch tensor by taking the square root of C

% right polar dicomposition, F = RU
R = F * inv(U); % multiply F by inverse of stretch tensor

% calculate the degrees of rotation
theta = -asind(R(1, 2)); % solve for theta in -sin(theta) = 0.5736
theta2 = asind(R(2, 1)); % solve for theta in sin(theta) = -0.5736, confirms clockwise rotation

%% Problem 3
close all;
clear;

% initialize symbolic variables
syms gamma lambda E

% define the rotation matrix, R
R = [cos(gamma) 0 sin(gamma);
    0 1 0;
    -sin(gamma) 0 cos(gamma)];

% define the stretch matrix, U
U = [1 0 0;
    0 lambda 0;
    0 0 lambda];

% Green-Lagrange strain tensor
% E = (1/2) * ((transpose(U) * transpose(R) * R * U) - 1);

% since R is orthogonal and U is symmetric
% Green-Lagrange strain tensor does not depend on R
E = (1/2) * ((U * U) - 1);

%% Problem 4a
close all;
clear;

% define the four markers of the element, El_0
P1_0 = [0 0 0];
P2_0 = [0 1 0];
P3_0 = [2 1 0];
P4_0 = [2 0 0];

% calculate the vectors between nodes
P12_0 = P2_0 - P1_0;
P23_0 = P3_0 - P2_0;
P34_0 = P3_0 - P4_0;
P14_0 = P4_0 - P1_0;
P13_0 = P3_0 - P1_0;
P24_0 = P2_0 - P4_0;

% define the four markers of element, El_x
P1_x = [0 0 0];
P2_x = [0.3 1.3 0];
P3_x = [1.8 1.4 0];
P4_x = [1.7 0.2 0];

% calculate the vectors between nodes
P12_x = P2_x - P1_x;
P23_x = P3_x - P2_x;
P34_x = P3_x - P4_x;
P14_x = P4_x - P1_x;
P13_x = P3_x - P1_x;
P24_x = P2_x - P4_x;

% define reference vectors of El, 6x3 matrix
dX = [P12_0; P23_0; P34_0; P14_0; P13_0; P24_0];

% define deformed vectors of El, 6x3 matrix
dx = [P12_x; P23_x; P34_x; P14_x; P13_x; P24_x];

% calculate the reference lengths of dX
dS = vecnorm(dX, 2, 2); % 6x1 vector

% or calculate the squared lengths of dX
dS2 = dot(dX, dX, 2); % 6x1 vector

% calculate the deformed lengths of dx
ds = vecnorm(dx, 2, 2); % 6x1 vector

% or calculate the squared lengths of dx
ds2 = dot(dx, dx, 2); % 6x1 vector

% calculate b, 6x1 vector
% b = ds.^2 - dS.^2;
b = ds2 - dS2; 

% calculate A, 6x3 matrix
A = 2 .* [dX(:, 1).^2 dX(:, 2).^2 2.*dX(:, 1).*dX(:, 2)];

% solve the system of equations to find the Green-Lagrange strain elements
% of El_x, E_11, E_22, and E_12, as the least-squares solution
E = A \ b; % 3x1 vector

%% Problem 5
close all;
clear;

% import data exported from FEBio
% variables: time, relative volumne (relVol), Cauchy stress (xStress),
%            stretch ratios (xInfStrain, yInfStrain, zInfStrain)
data = readtable('.\data\hw1prb5_data.xlsx'); % read as table data type

% determine the stretch ratio from data
lambda1 = 1 + data.xInfStrain;
lambda2 = 1 + data.yInfStrain;
lambda3 = 1 + data.zInfStrain;

% compose the defomration gradient
% F = [lambda1 0 0; 0 lambda2 0; 0 0 lambda3];

% extract Cauchy stress from data
T_11 = data.xStress;

% extract Jacobain (volume ratio or relative volume) from data
J = data.relVol;

% initialize matrices
P_11 = zeros(length(T_11), 1);
S_11 = zeros(length(T_11), 1);

for i = 1:length(T_11)
    % compose the defomration gradient
    F = [lambda1(i, 1) 0 0; 0 lambda2(i, 1) 0; 0 0 lambda3(i, 1)];

    % Cauchy stress
    T = [T_11(i, 1) 0 0; 0 0 0; 0 0 0];

    % calculate 1st P-K stress
    P = data.relVol(i, 1) .* (T * transpose(inv(F)));
    P_11(i, 1) = P(1, 1);
    
    % calculate 2nd P-K stress
    S = F \ P;
    S_11(i, 1) = S(1, 1);
end

% plot time vs. Cauchy stress, 1st P-K stress, and 2nd P-K stress
figure();
hold on;
plot(data.time, T_11, '-o', 'LineWidth', 1.2);
plot(data.time, P_11, '-d', 'LineWidth', 1.2);
plot(data.time, S_11, '-*', 'LineWidth', 1.2);
xlabel('Time (s)');
ylabel('Stress (psi)');
legend('Cauchy Stress', '1st P-K Stress', '2nd P-K Stress', 'Location', 'northwest');
hold off;
