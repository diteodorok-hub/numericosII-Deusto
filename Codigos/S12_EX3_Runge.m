%=========================================
% FENÓMENO DE RUNGE
%=========================================

clear; close all; clc

% Función de Runge
f = @(x) 1./(1 + 25*x.^2);

% Intervalo
a = -1;
b = 1;

% Grado del polinomio
%n=4;
%n=10;
n = 15;                      

% Nodos equiespaciados
x = linspace(a, b, n+1);
y = f(x);

% Polinomio interpolante
p = polyfit(x, y, n);

% Malla fina
xx = linspace(a, b, 1000);
yy = polyval(p, xx);

% Función exacta
ff = f(xx);

% Gráfica
figure
plot(xx, ff, 'k--', 'LineWidth', 2)
hold on
plot(xx, yy, 'b-', 'LineWidth', 2)
plot(x, y, 'ro', 'MarkerSize', 6, 'LineWidth', 2)
grid on
legend('f(x)', 'Interpolación', 'Nodos', 'Location', 'Best')
title(['Fenómeno de Runge (grado n = ', num2str(n), ')'])
xlabel('x')
ylabel('y')
