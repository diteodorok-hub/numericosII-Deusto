%% DERIVADAS NUMERICAS
% Forward, Backward y Centered differences
% Tabla de resultados y graficas

clear
clc
close all

%% Funcion de prueba
f = @(x) sin(x);
df_exact = @(x) cos(x);

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

%% Forward difference
for i = 1:n-1
    df_forward(i) = (y(i+1)-y(i))/h;
end

%% Backward difference
for i = 2:n
    df_backward(i) = (y(i)-y(i-1))/h;
end

%% Centered difference
for i = 2:n-1
    df_center(i) = (y(i+1)-y(i-1))/(2*h);
end

%% Derivada exacta
df_real = df_exact(x);

%% Error absoluto
error_forward  = abs(df_forward-df_real);
error_backward = abs(df_backward-df_real);
error_center   = abs(df_center-df_real);

%% Tabla de resultados
T = table(x',y',...
          df_forward',df_backward',df_center',df_real',...
          error_forward',error_backward',error_center',...
          'VariableNames',...
          {'x','f(x)','Forward','Backward','Centered','Exacta',...
           'ErrorForward','ErrorBackward','ErrorCentered'});

disp('TABLA DE RESULTADOS')
disp(T)

%% =========================
%% FIGURA 1: DERIVADAS
%% =========================

figure(1)

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


%% =========================
%% FIGURA 2: ERRORES
%% =========================

figure(2)

plot(x,error_forward,'r','LineWidth',1.5)
hold on

plot(x,error_backward,'b','LineWidth',1.5)
plot(x,error_center,'g','LineWidth',1.5)

legend('Error Forward',...
       'Error Backward',...
       'Error Centered')

xlabel('x')
ylabel('Error absoluto')
title('Error de las aproximaciones')
grid on