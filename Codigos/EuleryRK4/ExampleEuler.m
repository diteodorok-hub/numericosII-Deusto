clc; clear; close all;

f = @(t,y) y;
t0 = 0;
tf = 1;
y0 = 1;
n = 50; %Define el paso, valor a dividir

%[t, y] = euler_explicito(f, t0, tf, y0, n);
%[t, y] = heun(f, t0, tf, y0, n);
[t, y] = euler_midpoint(f, t0, tf, y0, n);

% solución exacta
t_exact = linspace(t0, tf, 100);
y_exact = exp(t_exact);

% error final
error = abs(exp(tf) - y(end));

%% Graficar
figure;
plot(t, y, '-o','LineWidth',2); hold on;
plot(t_exact, y_exact, 'r','LineWidth',2);

legend('Euler','Exacta');
title('Metodo de Euler');
xlabel('t');
ylabel('y');
grid on;

%% Mostrar error
disp('Valor final Euler:')
disp(y(end))

disp('Valor exacto:')
disp(exp(tf))

disp('Error:')
disp(error)