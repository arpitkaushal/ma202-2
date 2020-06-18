clear all;  % clear all variables
clc;        % clear command window
close all;  % close open windows

% constants
k = 0.017;   % per min
T_a = 21;    % deg Celsius

n = 11;              % num of steps 
t = zeros(n,1);    
Texact = zeros(n,1);   % exact solution
T = zeros(n,1);        % numerical solution

% initial conditions
t(1) = 0;
T(1) = 68; 
Texact(1) = 68;

dt = 1;      % size of time step in min

for i = 2:n
    t(i) = t(i-1) + dt;
    Texact(i) = T_a + (T(1) - T_a)*exp(-k*t(i));
    T(i) = T(i-1) + k*dt*T_a - k*dt*T(i-1);
end

plot(t, Texact, 'og','LineWidth', 3);
title('Temperature of Coffee Cup as a Function of Time');
xlabel('Time (in min)');
ylabel('Temperature of cup (in Celsius)')
hold on;
plot(t, T, '-r', 'LineWidth', 2);
legend('Analytical',"Euler's Method");