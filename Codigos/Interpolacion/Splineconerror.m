%% ============================================
%   COMPARACIÓN: SPLINE vs POLINOMIO GLOBAL
%   Con gráfica de error
% ============================================

clear; clc; close all;
%rng(1);   % Reproducibilidad
rand(1,5)
% ============================================
% 1. Parámetros
% ============================================
n = 15;          % Cambia a 8, 12, 18 r
a = -1; 
b = 1;

% ============================================
% 2. Nodos (elige UNA opción)
% ============================================

% --- Equiespaciados ---
x = sort(linspace(a,b,n));

% --- Aleatorios ---
% x = sort(a + (b-a)*rand(1,n));

% --- Chebyshev ---
% k = 1:n;
% x = cos((2*k-1)/(2*n)*pi);

% ============================================
% 3. Función tipo Runge
% ============================================
f = @(x) 1./(1 + 25*x.^2);
y = f(x);

% ============================================
% 4. Malla fina
% ============================================
xx = linspace(a,b,1000);
f_exact = f(xx);

% ============================================
% 5. Interpolaciones
% ============================================
yy_spline = spline(x, y, xx);

p = polyfit(x, y, n-1);
yy_poly = polyval(p, xx);

% ============================================
% 6. Errores absolutos
% ============================================
err_spline = abs(f_exact - yy_spline);
err_poly   = abs(f_exact - yy_poly);

% ============================================
% 7. GRÁFICAS
% ============================================
figure

% --------- Arriba: interpolaciones ----------
subplot(2,1,1)
plot(xx, f_exact, 'k', 'LineWidth', 2); hold on
plot(xx, yy_spline, 'b', 'LineWidth', 2)
plot(xx, yy_poly, 'r--', 'LineWidth', 2)
plot(x, y, 'mo', 'MarkerSize', 8, 'MarkerFaceColor', 'm')

legend('Función exacta', 'Spline', 'Polinomio global', 'Datos', ...
       'Location','best')

title(['Interpolación con n = ', num2str(n)])
xlabel('x')
ylabel('y')
grid on

% --------- Abajo: errores ----------
subplot(2,1,2)
plot(xx, err_spline, 'b', 'LineWidth', 2); hold on
plot(xx, err_poly, 'r--', 'LineWidth', 2)

legend('Error spline', 'Error polinomio global', ...
       'Location','best')

title('Error absoluto')
xlabel('x')
ylabel('|error|')
grid on

% ============================================
% 8. Mostrar errores máximos
% ============================================
fprintf('Error máximo spline:     %.4e\n', max(err_spline));
fprintf('Error máximo polinomio:  %.4e\n', max(err_poly));
