clc; clear; close all;

% Definicion del problema
%f = @(x,y) y;
f = @(x,y) x^2 + y;

x0 = 0;
y0 = 1;
h = 0.1;
N = 20;

% RK4
[x, y_aprox] = rk4(f, x0, y0, h, N);

% Solucion exacta
y_exacta = exp(x);

% Error
error = abs(y_exacta - y_aprox);

% Grafica solucion
figure;
plot(x, y_exacta, 'b-', 'LineWidth', 2); hold on;
plot(x, y_aprox, 'ro--', 'LineWidth', 1.5);
%legend('Exacta', 'RK4');
%title('Comparacion solucion exacta vs RK4');
%xlabel('x'); ylabel('y');
%grid on;

% Grafica error
figure;
plot(x, error, 'k-o', 'LineWidth', 1.5);
%title('Error absoluto RK4');
%xlabel('x'); ylabel('Error');
%grid on;

% Mostrar error maximo
fprintf('Error maximo (lineal): %e\n', max(error));

% Estudio de convergencia
clc; clear;

f = @(x,y) y;
x0 = 0; y0 = 1;
xf = 2;

hs = [0.4, 0.2, 0.1, 0.05, 0.025];
errores = zeros(size(hs));

for i = 1:length(hs)
    h = hs(i);
    N = (xf - x0)/h;

    [x, y_aprox] = rk4(f, x0, y0, h, N);

    y_exacta = exp(x);

    errores(i) = max(abs(y_exacta - y_aprox));
end

% Grafica log-log
figure;
loglog(hs, errores, 'bo-', 'LineWidth', 1.5);
hold on;

% Recta de referencia O(h^4)
C = errores(end)/(hs(end)^4);
loglog(hs, C*hs.^4, 'r--', 'LineWidth', 1.5);

legend('Error RK4', 'O(h^4)');
title('Orden de convergencia RK4');
xlabel('h'); ylabel('Error');
grid on;