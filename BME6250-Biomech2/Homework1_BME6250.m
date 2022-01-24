% Created by: Anthony H. Le
% Last updated: 2022-01-24

% BME 6250 - Biomechanics II
% Homework 1
% Due date: 2022-01-27, 09:00 MST

%% Problem 1b
close all;
clear;

% initialize symbolic variables
syms lambda1 lambda2 lambda3 alpha E 

% define the deformation gradient
F = [lambda1 0 alpha;
    0 lambda2 0;
    0 0 lambda3];

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

% define the four nodes of the element, El_0
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

% define the four nodes of element, El_x
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

% define reference coordinate matrix of El
X_0 = [P12_0;
     P23_0;
     P34_0;
     P14_0;
     P13_0;
     P24_0];

% define deformed coordinate matrix of El
x = [P12_x;
     P23_x;
     P34_x;
     P14_x;
     P13_x;
     P24_x];

% calcuate the displacement, u, between points of 
% X (reference) and x (deformed) 
u = x - X_0;

% calculate the deformation gradient
F = 1 + u;

% calculate the Green-Lagrange strain tensor
E = (1/2) * ((transpose(F) * F) - 1);


%% Problem 5

