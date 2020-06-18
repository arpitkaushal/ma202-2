clear all;              % clear all variables
clc;                    % clear command window
close all;              % close open windows

% constants
R = 200                 % resistance in ohms
L = 5                   % inductance in Henry
C = 10^(-4)             % capacitance in Faraday

n = 11;                 % num of steps 
t = zeros(n,1);         % Time in seconds
I = zeros(n,1);         % Current in Ampere
q = zeros(n,1);         % Charge in Coloumb

% initial conditions
t(1) = 0;
I(1) = 0;
q(1) = 1;

dt = 0.01;              % size of time step in sec

% Iterative solution derived from Euler's Method
for i = 2:n
    t(i) = t(i-1) + dt;
    q(i) = q(i-1) + I(i-1)*dt;
    I(i) = I(i-1) + ( - (I(i-1)*R)/L - q(i-1)/(L*C) )*dt;
end

% Plots
figure;
plot(t, I, '-b','LineWidth', 3);
title('Current vs Time');
xlabel('Time (in sec)');
ylabel('Current (in Amperes)')

plot(t, q, '-r', 'LineWidth', 2);
title('Charge on Capacitor vs Time');
xlabel('Time (in sec)');
ylabel('Charge (in Coloumbs)')



% for i = 1:n-1
%     t(i+1) = t(i) + dt;
%     q(i+1) = q(i) + I(i)*dt; 
%     q_1(i) = (q(i+1) - q(i))/dt;
%     q_2(i) = q(i+1) - q()

% end