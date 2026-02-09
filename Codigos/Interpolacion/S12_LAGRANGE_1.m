%=========================================
% INTERPOLACIÓN DE LAGRANGE (DATOS DISCRETOS)
%=========================================

clear; close all; clc

% Datos
x = [0 1 2];
y = [1 2 0];

% Malla fina para visualizar
xx = linspace(min(x), max(x), 300);
yy = zeros(size(xx));

% Construcción del polinomio de Lagrange
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

% Gráfica
figure
plot(x, y, 'ro', 'MarkerSize', 8, 'LineWidth', 2)
hold on
plot(xx, yy, 'b-', 'LineWidth', 2)
grid on
legend('Datos', 'Polinomio de Lagrange', 'Location', 'Best')
title('Interpolación de Lagrange (ejemplo básico)')
xlabel('x')
ylabel('y')
