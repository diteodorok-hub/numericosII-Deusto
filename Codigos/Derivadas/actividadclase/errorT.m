%% ERROR DE TRUNCAMIENTO
clc; clear;

% Funcion real (para comparar)
f = @(t) -4.9*t.^2 + 5*t + 1.86;   % parabola
df = @(t) -9.8*t + 5;              % derivada real

t0 = 1.5;

h_vals = [0.5 0.25 0.125 0.0625 0.03125];
error2 = [];
error4 = [];
error6 = [];

for h = h_vals
    
    t = t0-3*h : h : t0+3*h;
    y = f(t);
    
    i = 4; % punto central
    
    % Orden 2
    v2 = (y(i+1) - y(i-1))/(2*h);
    
    % Orden 4
    v4 = (-y(i+2) + 8*y(i+1) - 8*y(i-1) + y(i-2))/(12*h);
    
    % Orden 6
    v6 = (-y(i+3) + 9*y(i+2) - 45*y(i+1) + 45*y(i-1) - 9*y(i-2) + y(i-3))/(60*h);
    
    v_real = df(t0);
    
    error2 = [error2 abs(v_real - v2)];
    error4 = [error4 abs(v_real - v4)];
    error6 = [error6 abs(v_real - v6)];
end

figure
loglog(h_vals,error2,'o-','LineWidth',2)
hold on
loglog(h_vals,error4,'s-','LineWidth',2)
loglog(h_vals,error6,'d-','LineWidth',2)
grid on
legend('Orden 2','Orden 4','Orden 6')
xlabel('h')
ylabel('Error')
title('Error de truncamiento')