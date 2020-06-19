function y = Eng(d)
    
    k1 = 50000;     % in g/s^(2)
    k2 = 40;        % in g/s^(2)m^(1/2)
    m = 90;         % in g
    h = 0.45;       % in m
    g  = 9.81;      % in m/s^2

    y = (2*k2/5)*d^(5/2) + (k1/2)*d^2 - m*g*d - m*g*h;

end