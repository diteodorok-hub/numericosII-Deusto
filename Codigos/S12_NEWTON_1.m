%=========================================
% INTERPOLACIÓN DE NEWTON - EJEMPLO BÁSICO
%=========================================

clear; close all; clc

% Función
f = @(x) exp(x);

% Nodos
x = [0 0.4 0.7 1.0];
y = f(x);

n = length(x);

% Tabla de diferencias divididas
DD = zeros(n,n);
DD(:,1) = y(:);

for j = 2:n
    for i = 1:n-j+1
        DD(i,j) = (DD(i+1,j-1) - DD(i,j-1)) / (x(i+j-1) - x(i));
    end
end

% Coeficientes de Newton
a = DD(1,:);

% Evaluación del polinomio
xx = linspace(0,1,400);
p = a(1)*ones(size(xx));
prod = ones(size(xx));

for k = 2:n
    prod = prod .* (xx - x(k-1));
    p = p + a(k)*prod;
end

% Función exacta
ff = f(xx);

% Gráfica
figure
plot(xx, ff, 'k--', 'LineWidth', 2)
hold on
plot(xx, p, 'b-', 'LineWidth', 2)
plot(x, y, 'ro', 'MarkerSize', 8, 'LineWidth', 2)
grid on
legend('f(x)=e^x', 'Newton', 'Nodos', 'Location', 'Best')
title('Interpolación de Newton de e^x')
xlabel('x')
ylabel('y')
