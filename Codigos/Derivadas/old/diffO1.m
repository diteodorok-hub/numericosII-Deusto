%% DERIVADAS NUMERICAS
% Diferencia hacia adelante, hacia atras y centrada
% Autor: ejemplo docente

clear
clc
close all

%% Funcion de prueba
f = @(x) sin(x);          % funcion
df_exact = @(x) cos(x);   % derivada exacta (solo para comparar)

%% Dominio
a = 0;
b = 2*pi;
n = 20;

x = linspace(a,b,n);
h = x(2)-x(1);

y = f(x);

%% Inicializar vectores
df_forward  = NaN(size(x));
df_backward = NaN(size(x));
df_center   = NaN(size(x));

%% Diferencia hacia adelante
for i = 1:n-1
    df_forward(i) = (y(i+1) - y(i)) / h;
end

%% Diferencia hacia atras
for i = 2:n
    df_backward(i) = (y(i) - y(i-1)) / h;
end

%% Diferencia centrada
for i = 2:n-1
    df_center(i) = (y(i+1) - y(i-1)) / (2*h);
end

%% Derivada exacta
df_real = df_exact(x);

%% Tabla de resultados
T = table(x',y',df_forward',df_backward',df_center',df_real',...
    'VariableNames',...
    {'x','f(x)','Forward','Backward','Centered','Exacta'});

disp('Tabla de derivadas numericas')
disp(T)

%% Graficos

figure

plot(x,df_real,'k','LineWidth',2)
hold on

plot(x,df_forward,'ro--','LineWidth',1)
plot(x,df_backward,'bs--','LineWidth',1)
plot(x,df_center,'g^--','LineWidth',1)

legend('Derivada exacta',...
       'Forward',...
       'Backward',...
       'Centered')

xlabel('x')
ylabel('f''(x)')
title('Comparacion de derivadas numericas')
grid on