clear; clc;

data = readtable('WPG.csv');

% Mostrar nombres reales
disp(data.Properties.VariableNames)

% Convertir columnas a numéricas (robusto)
year = str2double(string(data{:,1}));
P    = str2double(string(data{:,2}));

% Eliminar posibles NaN
idx = ~isnan(P);
year = year(idx);
P    = P(idx);

% Reescalar tiempo
t = year - year(1);

% Capacidad de carga
K = max(P) * 1.1;

% Linealización
Y = log(K ./ P - 1);

A = [ones(size(t)) t];
c = (A'*A)\(A'*Y);

a = c(1);
b = c(2);

r = -b;
A_param = exp(a);

% Reconstrucción
tt = linspace(min(t),max(t),200)';
P_model = K ./ (1 + A_param*exp(-r*tt));

figure
plot(year,P,'yo','MarkerSize',8,'LineWidth',1.5)
hold on
plot(year(1)+tt,P_model,'r','LineWidth',2)
xlabel('Year')
ylabel('Population')
title('Modelo Logístico - Datos WPG')
legend('Datos','Modelo')
grid on