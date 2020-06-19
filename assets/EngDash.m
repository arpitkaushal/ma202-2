function y = EngDash(d)
    
    k1 = 50000;     % in g/s^(2)
    k2 = 40;        % in g/s^(2)m^(1/2)
    m = 90;         % in g
    g  = 9.81;      % in m/s^2
    
    y = k2*d^(3/2) + k1*d - m*g;

end