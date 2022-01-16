% Created by: Anthony H. Le
% Last updated: 2022-01-16

% BME 6250 - Biomechanics II
% Homework 1
% Due date: 2022-01-27, 09:00 MST

%% Problem 2
% deformation gradient
F = [1.2287 0.8604 0;
    -0.8604 1.2287 0;
    0 0 0.4444];

% right deformation tensor
C = transpose(F) * F; % multiply transpose F by F

% right stretch tensor
U = sqrtm(C); % calculate stretch tensor by taking the square root of C

% right polar dicomposition, F = RU
R = F * inv(U); % multiply F by inverse of stretch tensor

% degrees of rotation
theta = -asind(R(1, 2)); % solve for theta in -sin(theta) = 0.5736
theta2 = asind(R(2, 1)); % solve for theta in sin(theta) = -0.5736, confirms clockwise rotation

%%