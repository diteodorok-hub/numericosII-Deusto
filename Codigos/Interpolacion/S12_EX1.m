%=========================================
% INTERPOLACIÓN POLINÓMICA BÁSICA
%=========================================

clear; close all; clc

% Datos conocidos
%x = [0 1 2];
%y = [1 2 0];
x = [0 1 2 3];
y = [1 2 0 4];

% Polinomio interpolante de grado 2
p = polyfit(x, y, 3);

% Evaluación en una malla fina
xx = linspace(0, 3, 200);
yy = polyval(p, xx);

% Gráfica
figure
plot(x, y, 'ro', 'MarkerSize', 8, 'LineWidth', 2)
hold on
plot(xx, yy, 'b-', 'LineWidth', 2)
grid on
legend('Datos', 'Polinomio interpolante', 'Location', 'Best')
title('Interpolación polinómica básica')
xlabel('x')
ylabel('y')
