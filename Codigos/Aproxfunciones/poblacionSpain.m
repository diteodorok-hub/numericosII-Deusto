% ==========================================
% MODELO LOGÍSTICO – POBLACIÓN REAL (ESPAÑA)
% Datos aproximados en millones (INE históricos)
% ==========================================

clear; clc;

% Años reales
year = [1950; 1960; 1970; 1980; 1990; 2000; 2010; 2020];

% Población aproximada (millones)
P = [28.0; 30.5; 33.8; 37.7; 39.3; 40.5; 46.5; 47.3];

% Reescalamos el tiempo (mejor condición numérica)
t = year - year(1);

% Capacidad de carga (supuesto razonable)
K = 55;   % millones

% -----------------------------
% LINEALIZACIÓN
% -----------------------------
Y = log(K./P - 1);

% Sistema lineal Y = a + b t
A = [ones(size(t)) t];

c = (A'*A)\(A'*Y);

a = c(1);
b = c(2);

r = -b;
A_param = exp(a);

fprintf('\n--- PARÁMETROS ESTIMADOS ---\n')
fprintf('r = %.4f\n',r)
fprintf('A = %.4f\n',A_param)

% -----------------------------
% RECONSTRUCCIÓN DEL MODELO
% -----------------------------
tt = linspace(min(t),max(t),200)';
P_model = K ./ (1 + A_param*exp(-r*tt));

% -----------------------------
% ERROR CUADRÁTICO
% -----------------------------
P_est = K ./ (1 + A_param*exp(-r*t));
error = norm(P - P_est);

fprintf('Error L2 = %.4f\n',error)

% -----------------------------
% GRÁFICA
% -----------------------------
figure
plot(year,P,'ko','MarkerSize',8,'LineWidth',1.5)
hold on
plot(year(1)+tt,P_model,'r','LineWidth',2)
xlabel('Año')
ylabel('Población (millones)')
title('Modelo Logístico - Población de España')
legend('Datos reales','Modelo logístico','Location','NorthWest')
grid on