%=========================================
% NEWTON: AÑADIR NODOS SIN REHACER TODO
%=========================================

clear; close all; clc

% Función
f = @(x) log(1 + x);

% Nodos iniciales
x = [0 0.3 0.6];
y = f(x);

% Construcción inicial
n = length(x);
DD = zeros(n,n);
DD(:,1) = y(:);

for j = 2:n
    for i = 1:n-j+1
        DD(i,j) = (DD(i+1,j-1) - DD(i,j-1)) / (x(i+j-1) - x(i));
    end
end

a = DD(1,:);

% Evaluación inicial
xx = linspace(0,1,400);
p = a(1)*ones(size(xx));
prod = ones(size(xx));

for k = 2:n
    prod = prod .* (xx - x(k-1));
    p = p + a(k)*prod;
end

% --------- AÑADIMOS UN NUEVO NODO ----------
x_new = 0.9;
y_new = f(x_new);

x = [x x_new];
y = [y y_new];

% Solo ampliamos la tabla
DD(n+1,1) = y_new;

for j = 2:n+1
    DD(1,j) = (DD(2,j-1) - DD(1,j-1)) / (x(j) - x(1));
end

a = [a DD(1,n+1)];

% Evaluación con el nuevo nodo
p_new = a(1)*ones(size(xx));
prod = ones(size(xx));

for k = 2:length(a)
    prod = prod .* (xx - x(k-1));
    p_new = p_new + a(k)*prod;
end

% Función exacta
ff = f(xx);

% Gráfica comparativa
figure
plot(xx, ff, 'k--', 'LineWidth', 2)
hold on
plot(xx, p, 'b-', 'LineWidth', 2)
plot(xx, p_new, 'r-', 'LineWidth', 2)
plot(x, y, 'ko', 'MarkerSize', 7, 'LineWidth', 2)
grid on
legend('f(x)', 'Newton (antes)', 'Newton (con nuevo nodo)', ...
       'Nodos', 'Location', 'Best')
title('Ventaja del método de Newton: añadir nodos')
xlabel('x')
ylabel('y')
