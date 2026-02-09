%=========================================
% INTERPOLACIÓN CON SPLINE CÚBICO
%=========================================

clear; close all; clc

f = @(x) sin(x);
x = linspace(0, pi, 8);
y = f(x);

xx = linspace(0, pi, 400);

% Spline cúbico
yy = spline(x, y, xx);

figure
plot(xx, f(xx), 'k--', 'LineWidth', 2)
hold on
plot(xx, yy, 'b-', 'LineWidth', 2)
plot(x, y, 'ro', 'MarkerSize', 7, 'LineWidth', 2)
grid on
legend('f(x)', 'Spline cúbico', 'Nodos', 'Location', 'Best')
title('Interpolación mediante spline cúbico')
