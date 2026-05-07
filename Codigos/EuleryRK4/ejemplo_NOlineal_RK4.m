clc; clear; close all;

% Definicion del problema
f = @(x,y) x^2 + y;

x0 = 0;
y0 = 1;
h = 0.1;
N = 20;

% RK4
[x, y_aprox] = rk4(f, x0, y0, h, N);

% Solucion exacta
y_exacta = 3*exp(x) - x.^2 - 2*x - 2;

% Error
error = abs(y_exacta - y_aprox);

% Grafica solucion
figure;
plot(x, y_exacta, 'b-', 'LineWidth', 2); hold on;
plot(x, y_aprox, 'ro--', 'LineWidth', 1.5);
legend('Exacta', 'RK4');
title('Problema no lineal: exacta vs RK4');
xlabel('x'); ylabel('y');
grid on;

% Grafica error
figure;
plot(x, error, 'k-o', 'LineWidth', 1.5);
title('Error absoluto RK4 (no lineal)');
xlabel('x'); ylabel('Error');
grid on;

% Grafica error en escala logaritmica (semilogy)
figure;
semilogy(x, error, 'r-o', 'LineWidth', 1.5);
title('Error absoluto RK4 (escala log)');
xlabel('x'); ylabel('Error (log)');
grid on;

% Mostrar error maximo
fprintf('Error maximo (no lineal): %e\n', max(error));