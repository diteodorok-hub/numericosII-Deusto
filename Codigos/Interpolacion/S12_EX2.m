%=========================================
% INTERPOLACIÓN DE sin(x)
%=========================================

clear; close all; clc

% Función original
f = @(x) sin(x);

% Intervalo y nodos
a = 0;
b = pi;
x = linspace(a, b, 5);
y = f(x);

% Polinomio interpolante (grado 4)
p = polyfit(x, y, length(x)-1);

% Malla fina
xx = linspace(a, b, 400);
yy = polyval(p, xx);

% Función exacta
ff = f(xx);

% Gráfica
figure
plot(xx, ff, 'k--', 'LineWidth', 2)
hold on
plot(xx, yy, 'b-', 'LineWidth', 2)
plot(x, y, 'ro', 'MarkerSize', 8, 'LineWidth', 2)
grid on
legend('f(x) = sin(x)', 'Interpolación', 'Nodos', 'Location', 'Best')
title('Interpolación polinómica de sin(x)')
xlabel('x')
ylabel('y')
