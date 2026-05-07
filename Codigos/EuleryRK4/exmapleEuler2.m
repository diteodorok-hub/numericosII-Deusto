clc; clear; close all;

% Definir la EDO
f = @(t,y) t.^2 - y + sin(t);

% Intervalo y condición inicial
t0 = 0;
tf = 2;
y0 = 1;

% Número de pasos
n = 50;

% Resolver con Euler
[t, y] = euler_explicito(f, t0, tf, y0, n);

%% Graficar solución
figure;
plot(t, y, '-o','LineWidth',2);

xlabel('t');
ylabel('y');
title('Metodo de Euler para una EDO no trivial');
grid on;