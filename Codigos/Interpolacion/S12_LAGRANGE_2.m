%=========================================
% INTERPOLACIÓN DE LAGRANGE DE sin(x)
%=========================================

clear; close all; clc

% Función
f = @(x) sin(x);

% Intervalo y nodos
a = 0;
b = pi;
x = linspace(a, b, 5);
y = f(x);

% Malla fina
xx = linspace(a, b, 400);
yy = zeros(size(xx));

% Polinomio de Lagrange
n = length(x);

for i = 1:n
    Li = ones(size(xx));
    for j = 1:n
        if j ~= i
            Li = Li .* (xx - x(j)) / (x(i) - x(j));
        end
    end
    yy = yy + y(i) * Li;
end

% Función exacta
ff = f(xx);

% Gráfica
figure
plot(xx, ff, 'k--', 'LineWidth', 2)
hold on
plot(xx, yy, 'b-', 'LineWidth', 2)
plot(x, y, 'ro', 'MarkerSize', 8, 'LineWidth', 2)
grid on
legend('f(x)=sin(x)', 'Lagrange', 'Nodos', 'Location', 'Best')
title('Interpolación de Lagrange de sin(x)')
xlabel('x')
ylabel('y')
