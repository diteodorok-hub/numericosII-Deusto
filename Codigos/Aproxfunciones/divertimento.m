% =====================================================
% ANALISIS COMPLETO CON DATOS WPG.csv
% =====================================================

clear; clc; close all;

% -----------------------------------------------------
% 1) CARGAR DATOS
% -----------------------------------------------------
data = readtable('WPG.csv');

% Convertimos a formato numérico seguro
year     = str2double(string(data.Year));
P        = str2double(string(data.Population));
growth   = str2double(string(data.("YearlyGrowth_")));
density  = str2double(string(data.("Density_Pop_km2_")));

% Limpiar posibles NaN
idx = ~isnan(P);
year = year(idx);
P = P(idx);
growth = growth(idx);
density = density(idx);

% Reescalado temporal
t = year - year(1);

% -----------------------------------------------------
% 2) MODELO LOGÍSTICO
% -----------------------------------------------------
K = max(P) * 1.1;

Y = log(K ./ P - 1);
A_log = [ones(size(t)) t];
c_log = (A_log'*A_log)\(A_log'*Y);

a = c_log(1);
b = c_log(2);

r = -b;
A_param = exp(a);

P_log = K ./ (1 + A_param*exp(-r*t));

% -----------------------------------------------------
% 3) MODELO LINEAL
% -----------------------------------------------------
A_lin = [ones(size(t)) t];
c_lin = (A_lin'*A_lin)\(A_lin'*P);
P_lin = A_lin*c_lin;

% -----------------------------------------------------
% 4) PREDICCIÓN 2030
% -----------------------------------------------------
year_future = 2030;
t_future = year_future - year(1);

P_2030_lin = c_lin(1) + c_lin(2)*t_future;
P_2030_log = K / (1 + A_param*exp(-r*t_future));

fprintf('\n--- PREDICCIÓN PARA 2030 ---\n')
fprintf('Lineal:    %.2f\n',P_2030_lin)
fprintf('Logístico: %.2f\n',P_2030_log)

% -----------------------------------------------------
% 5) ERRORES
% -----------------------------------------------------
error_lin = norm(P - P_lin);
error_log = norm(P - P_log);

fprintf('\n--- ERRORES L2 ---\n')
fprintf('Lineal:    %.4f\n',error_lin)
fprintf('Logístico: %.4f\n',error_log)

% -----------------------------------------------------
% 6) GRAFICAS PRINCIPALES
% -----------------------------------------------------
figure('Position',[100 100 1200 800])

% Year vs Population
subplot(2,2,1)
plot(year,P,'ko','LineWidth',1.5)
hold on
tt = linspace(min(t),t_future,200)';
year_plot = year(1)+tt;
plot(year_plot,K./(1+A_param*exp(-r*tt)),'r','LineWidth',2)
plot(year_plot,c_lin(1)+c_lin(2)*tt,'b--','LineWidth',2)
title('Year vs Population')
legend('Datos','Logístico','Lineal')
grid on

% Year vs Yearly Growth %
subplot(2,2,2)
plot(year,growth,'m','LineWidth',2)
title('Year vs Yearly Growth (%)')
grid on

% Year vs Density
subplot(2,2,3)
plot(year,density,'g','LineWidth',2)
title('Year vs Density (Pop/km^2)')
grid on

% Population vs Density
subplot(2,2,4)
plot(P,density,'c','LineWidth',2)
title('Population vs Density')
grid on