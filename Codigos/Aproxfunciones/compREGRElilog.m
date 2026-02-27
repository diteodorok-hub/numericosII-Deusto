% ==========================================
% COMPARACIÓN MODELO LOGÍSTICO vs LINEAL
% World Population Growth Kaggle
% ==========================================

clear; clc;

% ------------------------------------------
% 1) CARGAR DATOS DESDE CSV
% ------------------------------------------
data = readtable('WPG.csv');

year = str2double(string(data{:,1}));
P    = str2double(string(data{:,2}));

% Eliminar posibles NaN
idx = ~isnan(P);
year = year(idx);
P    = P(idx);

% Reescalar tiempo
t = year - year(1);

% ------------------------------------------
% 2) MODELO LOGÍSTICO
% ------------------------------------------
K = max(P) * 1.1;   % capacidad de carga estimada

Y = log(K ./ P - 1);
A_log = [ones(size(t)) t];

c_log = (A_log'*A_log)\(A_log'*Y);

a = c_log(1);
b = c_log(2);

r = -b;
A_param = exp(a);

P_log = K ./ (1 + A_param*exp(-r*t));

% ------------------------------------------
% 3) MODELO LINEAL
% ------------------------------------------
A_lin = [ones(size(t)) t];
c_lin = (A_lin'*A_lin)\(A_lin'*P);

P_lin = A_lin*c_lin;

% ------------------------------------------
% 4) PREDICCIÓN PARA 2030
% ------------------------------------------
year_future = 2030;
t_future = year_future - year(1);

% Predicción lineal
P_2030_lin = c_lin(1) + c_lin(2)*t_future;

% Predicción logística
P_2030_log = K / (1 + A_param*exp(-r*t_future));

fprintf('\n--- PREDICCIÓN PARA 2030 ---\n')
fprintf('Modelo Lineal:    %.2f\n',P_2030_lin)
fprintf('Modelo Logístico: %.2f\n',P_2030_log)

% ------------------------------------------
% 5) ERRORES
% ------------------------------------------
error_lin = norm(P - P_lin);
error_log = norm(P - P_log);

fprintf('\n--- ERRORES L2 ---\n')
fprintf('Error Lineal:    %.4f\n',error_lin)
fprintf('Error Logístico: %.4f\n',error_log)

% ------------------------------------------
% 6) GRAFICAR
% ------------------------------------------
tt = linspace(min(t), (2030-year(1)), 200)';
year_plot = year(1) + tt;

P_log_plot = K ./ (1 + A_param*exp(-r*tt));
P_lin_plot = c_lin(1) + c_lin(2)*tt;

figure
plot(year,P,'co','MarkerSize',8,'LineWidth',1.5)
hold on
plot(year_plot,P_log_plot,'r','LineWidth',2)
plot(year_plot,P_lin_plot,'b--','LineWidth',2)

xlabel('Year')
ylabel('Population')
title('Comparación Modelo Logístico vs Lineal')
legend('Datos','Logístico','Lineal','Location','NorthWest')
grid on