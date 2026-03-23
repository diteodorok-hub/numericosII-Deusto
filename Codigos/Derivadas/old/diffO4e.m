%% DERIVADA NUMERICA CENTRADA O(h^4)

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

%% Inicializar vector
df_center4 = NaN(size(x));

%% Diferencia centrada O(h^4)
for i = 3:n-2
    df_center4(i) = (-y(i+2) + 8*y(i+1) - 8*y(i-1) + y(i-2))/(12*h);
end

%% Derivada exacta
df_real = df_exact(x);

%% Error absoluto
error_center4 = abs(df_center4 - df_real);

%% Tabla de resultados
T = table(x',y',df_center4',df_real',error_center4',...
    'VariableNames',...
    {'x','f(x)','DerivadaCentradaO4','Exacta','Error'});

disp('TABLA DE RESULTADOS')
disp(T)

%% =========================
%% FIGURA 1: DERIVADAS
%% =========================

figure(1)

plot(x,df_real,'k','LineWidth',2)
hold on
plot(x,df_center4,'ro--','LineWidth',1.5)

legend('Derivada exacta','Centrada O(h^4)')

xlabel('x')
ylabel('f''(x)')
title('Derivada centrada de orden O(h^4)')
grid on


%% =========================
%% FIGURA 2: ERROR
%% =========================

figure(2)

plot(x,error_center4,'b','LineWidth',1.5)

xlabel('x')
ylabel('Error absoluto')
title('Error de la derivada centrada O(h^4)')
grid on