%% DERIVADA CENTRADA DE ORDEN O(h^6)

clear
clc
close all

%% Funcion de prueba
f = @(x) sin(x);
df_exact = @(x) cos(x);

%% Dominio
a = 0;
b = 2*pi;
n = 40;

x = linspace(a,b,n);
h = x(2)-x(1);

y = f(x);

%% Inicializar derivada
df_center6 = NaN(size(x));

%% Diferencia centrada O(h^6)
for i = 4:n-3
    df_center6(i) = (-y(i-3) + 9*y(i-2) - 45*y(i-1) ...
                    +45*y(i+1) - 9*y(i+2) + y(i+3))/(60*h);
end

%% Derivada exacta
df_real = df_exact(x);

%% Error absoluto
error_center6 = abs(df_center6 - df_real);

%% Tabla de resultados
T = table(x',y',df_center6',df_real',error_center6',...
          'VariableNames',...
          {'x','f(x)','DerivadaO6','Exacta','Error'});

disp('TABLA DE RESULTADOS')
disp(T)

%% =========================
%% FIGURA 1: DERIVADAS
%% =========================

figure(1)

plot(x,df_real,'k','LineWidth',2)
hold on
plot(x,df_center6,'ro--','LineWidth',1.5)

legend('Derivada exacta','Centrada O(h^6)')

xlabel('x')
ylabel('f''(x)')
title('Derivada centrada de orden O(h^6)')
grid on

%% =========================
%% FIGURA 2: ERROR
%% =========================

figure(2)

plot(x,error_center6,'b','LineWidth',1.5)

xlabel('x')
ylabel('Error absoluto')
title('Error de la derivada centrada O(h^6)')
grid on