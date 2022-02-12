% Created by: Anthony H. Le
% Last updated: 2022-02-09

% BME 6250 - Biomechanics II
% Homework 2
% Due date: 2022-02-15, 09:00 MST

%% Problem 2a
close all; clear;

syms m k I1 I2 I3 C C2 Id
% m: mu
% k: kappa
% I1: invariant 1
% I2: invariant 2
% I3: invariant 3
% Id: identity tensor

W = (m/2) * (I1 - 3)^2 + (k/2) * (log(I3))^2;

dW1 = diff(W, I1); % (m*(2*I1 - 6))/2
dW2 = diff(W, I2); % 0
dW3 = diff(W, I3); % (k*log(I3))/I3

I1 = trace(C);
I2 = (1/2) * ((trace(C))^2 - trace(C^2));
I3 = det(C);

% dI1 = diff(I1, C); % 1
% dI2 = diff(I2, C); % 0
% dI3 = diff(I3, C); % 1

dI1 = Id;
dI2 = I1 * Id - C;
dI3 = I3 \ C;

% S = 2 * dW1 * dI1 + dW2 * dI2 + dW3 * dI3;
S = 2 * ((dW1 + I1 * dW2 + I2 * dW3) * Id - (dW2 + I1 * dW3) * C + dW3 * C^2);

%% Problem 2b
close all; clear;

syms m k I1 I2 I3 C C2 Id
% m: mu
% k: kappa
% I1: invariant 1
% I2: invariant 2
% I3: invariant 3
% Id: identity tensor

F = Id;

C = transpose(F) * F;

W = (m/2) * (I1 - 3)^2 + (k/2) * (log(I3))^2;

% dW1 = diff(W, I1) % (m*(2*I1 - 6))/2
% dW2 = diff(W, I2) % 0
% dW3 = diff(W, I3) % (k*log(I3))/I3

dW1 = 0;
dW2 = 0;
dW3 = 0;

I1 = trace(C);
I2 = (1/2) * ((trace(C))^2 - trace(C^2));
I3 = det(C);

% dI1 = diff(I1, C); % 1
% dI2 = diff(I2, C); % 0
% dI3 = diff(I3, C); % 1

dI1 = Id;
dI2 = I1 * Id - C;
dI3 = I3 \ C;

% S = 2 * dW1 * dI1 + dW2 * dI2 + dW3 * dI3;
S = 2 * ((dW1 + I1 * dW2 + I2 * dW3) * Id - (dW2 + I1 * dW3) * C + dW3 * C^2);

%% Problem 3a
close all; clear;

syms m Jm I1 lambda

W = -(m/2) * Jm * log(1 - ((I1 - 3) / Jm));

dW1 = diff(W, I1);

F = diag([lambda lambda 1/sqrt(lambda)]);


