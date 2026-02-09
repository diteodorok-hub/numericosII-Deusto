%=========================================
% INTERPOLACIÓN LINEAL POR TRAMOS
%=========================================

clear; close all; clc

f = @(x) sin(x);
x = linspace(0, pi, 8);
y = f(x);

xx = linspace(0, pi, 400);

% Interpolación lineal por tramos
yy = interp1(x, y, xx, 'linear');

figure
plot(xx, f(xx), 'k--', 'LineWidth', 2)
hold on
plot(xx, yy, 'b-', 'LineWidth', 2)
plot(x, y, 'ro', 'MarkerSize', 7, 'LineWidth', 2)
grid on
legend('f(x)', 'Lineal por tramos', 'Nodos', 'Location', 'Best')
title('Interpolación lineal por tramos')
