%% SPLINE CÚBICO NATURAL - EJEMPLO CON 5 PUNTOS
clear; clc; close all;

% ==========================
% 1. Datos (al menos 5 puntos)
% ==========================
x = [-2 -1 0 1 2];
y = [4 1 0 1 4];   % Datos tipo parabólicos

% ==========================
% 2. Malla fina para graficar
% ==========================
xx = linspace(min(x), max(x), 400);

% ==========================
% 3. Interpolación spline cúbico
% ==========================
yy_spline = spline(x, y, xx);

% ==========================
% 4. Polinomio global (grado 4)
% ==========================
p = polyfit(x, y, 4);
yy_poly = polyval(p, xx);

% ==========================
% 5. Gráfica
% ==========================
figure
plot(x, y, 'ro', 'MarkerSize', 8, 'LineWidth', 2); hold on
plot(xx, yy_spline, 'b-', 'LineWidth', 2)
plot(xx, yy_poly, 'k--', 'LineWidth', 2)

legend('Datos', 'Spline cúbico', 'Polinomio grado 4', 'Location', 'best')
title('Interpolación: Spline vs Polinomio Global')
xlabel('x')
ylabel('y')
grid on
