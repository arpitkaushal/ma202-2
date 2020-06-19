% Don't forget to extract the files func.m and func1.m in the
% same folder as this (tut2_1.m) file
clear all;  % clear all variables
clc;        % clear command window
close all;  % close open windows

% constants
k1 = 50000;     % in g/s^(2)
k2 = 40;        % in g/s^(2)m^(1/2)
m = 90;         % in g
h = 0.45;       % in m
g  = 9.81;      % in m/s^2


n = 0.5;            % interval
x = 0.01;           % step size
d = [-n:x:n];       % diff values of d
f_of_d = [-n:x:n];  % energy of system at d
y = zeros(size(d)); % for plotting X axis


% GRAPHICAL METHOD      
for i= 1:2*(n/x)+1
    f_of_d(i) = Eng(d(i));
end;

figure;
plot(d,f_of_d, '-r', 'LineWidth', 2);
title('Energy of the System vs d');
xlabel('d (in m)'); ylabel('Energy at Distance d (in mJ)')
grid on; hold on;
plot(d,y); legend('Energy Function','X axis'); 
hold off;

% from plot we find that the function has two roots, 
% one between -0.2 and 0, and another between 0 and 0.2
% but negative value of 'd' doesn't make sense 
% because it is distance (not displacement)
% so limiting search between 0 and 0.2 
format long; 

% BISECTION METHOD
d_l = 0;                % lower bound          
d_u = 0.2;              % upper bound
d_r = (d_l+d_u)/2;      % apparent root        
count_bs = 0;           % count number of iterations

while (abs(Eng(d_r))>1e-3)

    if Eng(d_l)*Eng(d_r)==0
        break;
    end
    if Eng(d_l)*Eng(d_r)<0
        d_u = d_r;
        d_r = (d_l+d_u)/2;
    else
        d_l = d_r;
        d_r = (d_l+d_u)/2;
    end
    count_bs++;

end

fprintf("\n\nBisection Bracekting\n");
d_r 
Energy =  Eng(d_r)
fprintf("Iterations\t%d",count_bs);

% NEWTON RAPHSON METHOD
d_g = 0.2;      % intial 'guess' of the root
count_nr = 0;   % count number of iterations

while (abs(Eng(d_g)>1e-3))
    d_next = d_g - (Eng(d_g)/EngDash(d_g));    
    d_g = d_next;
    count_nr++;
end

fprintf("\n\nNewton Raphson \n"); 
d_g
Energy = Eng(d_g)
fprintf("Iterations\t%d\n",count_nr);