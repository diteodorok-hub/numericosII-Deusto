clc; clear; close all;

%% Funcion
f = @(x) exp(x);
df = @(x) exp(x);

%% Malla
h = 0.1;
x = 0:h:1;
y = f(x);
n = length(x);

%% Derivadas numericas
df_forward = zeros(1,n);
df_backward = zeros(1,n);
df_centered = zeros(1,n);

% Adelante
for i = 1:n-1
    df_forward(i) = (y(i+1) - y(i))/h;
end

% Atras
for i = 2:n
    df_backward(i) = (y(i) - y(i-1))/h;
end

% Centrada
for i = 2:n-1
    df_centered(i) = (y(i+1) - y(i-1))/(2*h);
end

% Derivada exacta
df_exact = df(x);

%% Grafica 1: Derivadas
figure
plot(x,df_exact,'k','LineWidth',2)
hold on
plot(x,df_forward,'r--','LineWidth',2)
plot(x,df_backward,'b--','LineWidth',2)
plot(x,df_centered,'g','LineWidth',2)
legend('Exacta','Adelante','Atras','Centrada')
title('Comparación de derivadas')
xlabel('x')
ylabel('df/dx')
grid on

%% Grafica 2: Error vs x
error_forward = abs(df_exact - df_forward);
error_backward = abs(df_exact - df_backward);
error_centered = abs(df_exact - df_centered);

figure
plot(x,error_forward,'r','LineWidth',2)
hold on
plot(x,error_backward,'b','LineWidth',2)
plot(x,error_centered,'g','LineWidth',2)
legend('Error Adelante','Error Atras','Error Centrada')
title('Error en la derivada')
xlabel('x')
ylabel('Error')
grid on

%% Grafica 3: Error vs h (log-log)
x0 = 0.5;
h_vals = 0.1 ./ (2.^(0:10));

error_f = [];
error_b = [];
error_c = [];

for h = h_vals
    df_f = (f(x0+h) - f(x0))/h;
    df_b = (f(x0) - f(x0-h))/h;
    df_c = (f(x0+h) - f(x0-h))/(2*h);
    
    df_real = df(x0);
    
    error_f = [error_f abs(df_real - df_f)];
    error_b = [error_b abs(df_real - df_b)];
    error_c = [error_c abs(df_real - df_c)];
end

figure
loglog(h_vals,error_f,'r','LineWidth',2)
hold on
loglog(h_vals,error_b,'b','LineWidth',2)
loglog(h_vals,error_c,'g','LineWidth',2)
legend('Adelante','Atras','Centrada')
title('Error vs h (log-log)')
xlabel('h')
ylabel('Error')
grid on

%Fig1
%Adelante	Se adelanta
%Atrás	Se retrasa
%Centrada	Coincide mejor

%Fig2
%Zona	Error
%Extremos	Grande
%Centro	Pequeño
%Centrada	Menor error