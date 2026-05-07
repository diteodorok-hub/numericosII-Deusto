%main_rk4_simulink.m
clc; clear; close all;


%% ===== DEFINICION DEL PROBLEMA =====
% Puedes cambiar esta ecuacion libremente
f = @(t,y) y;   % ejemplo: y' = y
% f = @(t,y) t^2 + y;

t0 = 0;         % tiempo inicial
y0 = 1;         % condicion inicial
h  =  0.1 
%0.05 %0.1;       % paso
N  = 50 
%100; %50;        % numero de pasos

%% ===== TIEMPO TOTAL =====
tf = t0 + N*h;

%% ===== PARAMETROS PARA SIMULINK =====
% Guardamos en workspace (Simulink los lee de aqui)
assignin('base','f',f);
assignin('base','t0',t0);
assignin('base','y0',y0);
assignin('base','h',h);
assignin('base','N',N);
assignin('base','tf',tf);

%% ===== EJECUTAR SIMULINK =====
modelo = 'modelo_rk4'; % nombre
%modelo = 'facilRkk4_simul'; % nombre
simOut = sim(modelo);

%% ===== RECUPERAR RESULTADOS =====
t = simOut.tout;
y = simOut.yout.signals.values;

%% ===== SOLUCION EXACTA =====
y_exacta = exp(t);

%% ===== GRAFICAS =====
figure;
plot(t, y, 'r-o', 'LineWidth', 1.5); hold on;
plot(t, y_exacta, 'b-', 'LineWidth', 2);
legend('RK4 Simulink', 'Exacta');
title('Solucion RK4 desde Simulink');
xlabel('t'); ylabel('y');
grid on;

%% ===== ERROR =====
error = abs(y - y_exacta);

figure;
semilogy(t, error, 'k-o', 'LineWidth', 1.5);
title('Error (escala log)');
xlabel('t'); ylabel('Error');
grid on;

%MATLAB → dinámico (puedes pasar funciones)
%Simulink → estático (necesita saber todo antes)