%=========================================
% RUNGE: COMPARACIÓN CON EL TÉRMINO ANALÍTICO
%=========================================

clear; close all; clc

% Función de Runge
f = @(x) 1./(1 + 25*x.^2);

% Intervalo
a = -1;
b = 1;

% Grado
n = 15;

% Nodos equiespaciados
x = linspace(a, b, n+1);
y = f(x);

% Polinomio interpolante
p = polyfit(x, y, n);

% Malla fina
xx = linspace(a, b, 1000);
pp = polyval(p, xx);
ff = f(xx);

% Error real
err = abs(ff - pp);

% ----- TÉRMINO ANALÍTICO (FORMA DEL ERROR) -----
omega = ones(size(xx));
for k = 1:length(x)
    omega = omega .* abs(xx - x(k));
end

% Normalizamos para comparar formas
omega = omega / max(omega);

%================ FIGURA =================

figure

% Arriba: interpolación
subplot(2,1,1)
plot(xx, ff, 'k--', 'LineWidth', 2)
hold on
plot(xx, pp, 'b-', 'LineWidth', 2)
plot(x, y, 'ro', 'MarkerSize', 6, 'LineWidth', 2)
grid on
title(['Fenómeno de Runge (n = ', num2str(n), ')'])
legend('f(x)', 'Interpolación', 'Nodos')

% Abajo: comparación analítica
subplot(2,1,2)
plot(xx, err/max(err), 'r-', 'LineWidth', 2)
hold on
plot(xx, omega, 'k--', 'LineWidth', 2)
grid on
legend('Error real (normalizado)', ...
       '|\omega_{n+1}(x)| normalizado')
xlabel('x')
title('Comparación con el término analítico del error')
