clc; clear; close all;

% Definicion del problema
%f = @(x,y) y;
%f = @(x,y) x^2 + y;
f = @(x,y) 0.3.*y;

x0 = 0;
y0 = 1;
h = 0.1;
N = 20;

% RK4
[x, y_aprox] = rk4(f, x0, y0, h, N);

% Solucion exacta
y_exacta = exp(0.3.*x);

% Error
%error = abs(y_exacta - y_aprox);

% Grafica solucion
figure;
plot(x, y_exacta, 'b-', 'LineWidth', 2); hold on;
plot(x, y_aprox, 'ro--', 'LineWidth', 1.5);
%legend('Exacta', 'RK4');
%title('Comparacion solucion exacta vs RK4');
%xlabel('x'); ylabel('y');
grid on;


%