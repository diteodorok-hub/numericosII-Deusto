clc; clear; close all;

%% Funcion
f = @(x) sin(x);
df = @(x) cos(x);

x0 = pi/4;   % Punto donde derivar

%% Valores de h
h_vals = 0.2 ./ (2.^(0:6));

D_h = [];
D_h2 = [];
D_R = [];
error_h = [];
error_R = [];

for h = h_vals
    
    % Diferencia centrada con h
    Dh = (f(x0+h) - f(x0-h))/(2*h);
    
    % Diferencia centrada con h/2
    h2 = h/2;
    Dh2 = (f(x0+h2) - f(x0-h2))/(2*h2);
    
    % Richardson
    DR = (4*Dh2 - Dh)/3;
    
    % Valor exacto
    exact = df(x0);
    
    % Guardar
    D_h = [D_h Dh];
    D_h2 = [D_h2 Dh2];
    D_R = [D_R DR];
    
    error_h = [error_h abs(exact - Dh)];
    error_R = [error_R abs(exact - DR)];
end

%% Tabla
T = table(h_vals', D_h', D_R', error_h', error_R', ...
    'VariableNames', {'h','Diferencia_centrada','Richardson','Error_O2','Error_O4'});
disp(T)

%% Grafica error
figure
loglog(h_vals,error_h,'o-','LineWidth',2)
hold on
loglog(h_vals,error_R,'s-','LineWidth',2)
legend('Orden 2','Richardson Orden 4')
xlabel('h')
ylabel('Error')
title('Extrapolación de Richardson')
grid on