%=========================================
% INTERPOLACIÓN POLINÓMICA Y ERROR
%=========================================

clear; close all; clc

% Función "real" (solo para análisis del error)
f = @(x) sin(x);

% Intervalo
a = 0;
b = pi;

% Nodos de interpolación
x = linspace(a, b, 6);   % datos conocidos
y = f(x);

% Grado del polinomio interpolante
n = length(x) - 1;

% Polinomio interpolante
p = polyfit(x, y, n);

% Malla fina para evaluar
xx = linspace(a, b, 500);
pp = polyval(p, xx);
ff = f(xx);

% Error punto a punto
error = abs(ff - pp);

% Error máximo (norma infinito)
error_max = max(error);

% Mostrar error en consola
disp(['Error máximo = ', num2str(error_max)])

%================ GRÁFICAS =================

% Función e interpolación
figure
plot(xx, ff, 'k--', 'LineWidth', 2)
hold on
plot(xx, pp, 'b-', 'LineWidth', 2)
plot(x, y, 'ro', 'MarkerSize', 8, 'LineWidth', 2)
grid on
legend('f(x)', 'Interpolación', 'Nodos', 'Location', 'Best')
title('Interpolación polinómica')
xlabel('x')
ylabel('y')

% Error
figure
plot(xx, error, 'r-', 'LineWidth', 2)
grid on
title('Error de interpolación')
xlabel('x')
ylabel('|f(x) - p(x)|')
