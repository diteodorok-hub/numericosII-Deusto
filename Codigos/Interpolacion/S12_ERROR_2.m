%=========================================
% SENSIBILIDAD: COMPARACIÓN VISUAL CLARA
%=========================================

clear; close all; clc

% Función de referencia
f = @(x) sin(x);

% Intervalo
a = 0;
b = pi;

% Nodos
x = linspace(a, b, 8);
y = f(x);

% Interpolación original
n = length(x) - 1;
p = polyfit(x, y, n);

% Perturbación pequeña en un dato
%delta = 1e-4;
delta = 1e-3;
y_pert = y;
y_pert(4) = y_pert(4) + delta;

% Nueva interpolación
p_pert = polyfit(x, y_pert, n);

% Malla fina
xx = linspace(a, b, 800);
pp = polyval(p, xx);
pp_pert = polyval(p_pert, xx);

% Diferencia
diff_interp = abs(pp - pp_pert);

%================ FIGURA COMPARATIVA =================

figure

% ---- 1) Interpolaciones superpuestas ----
subplot(2,1,1)
plot(xx, pp, 'b-', 'LineWidth', 2)
hold on
plot(xx, pp_pert, 'r--', 'LineWidth', 2)
plot(x, y, 'ko', 'MarkerSize', 6, 'LineWidth', 2)
grid on
legend('Interpolación original', ...
       'Interpolación perturbada', ...
       'Nodos', 'Location', 'Best')
title('Sensibilidad: comparación de interpolaciones')
ylabel('y')

% ---- 2) Diferencia amplificada ----
subplot(2,1,2)
plot(xx, diff_interp, 'm-', 'LineWidth', 2)
grid on
xlabel('x')
ylabel('|p(x)-\tilde{p}(x)|')
title('Diferencia entre interpolaciones')

%================ RESULTADOS NUMÉRICOS =================

disp(['Perturbación introducida en los datos = ', num2str(delta)])
disp(['Máxima diferencia entre interpolaciones = ', ...
      num2str(max(diff_interp))])
