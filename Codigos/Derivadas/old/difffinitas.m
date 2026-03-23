%% DERIVADA NUMERICA POR DIFERENCIAS FINITAS (CENTRADA O(h^2))
% Este script aproxima la derivada de una funcion usando diferencias finitas

clear
clc
close all

%% 1. Definir la funcion y su derivada exacta (para comparar)
f  = @(x) sin(x);     % funcion
df = @(x) cos(x);     % derivada exacta

%% 2. Definir el intervalo de estudio
a = 0;                % inicio del intervalo
b = 2*pi;             % fin del intervalo
n = 40;               % numero de puntos de la malla

x = linspace(a,b,n);  % generar malla uniforme
h = x(2)-x(1);        % tamaño del paso

%% 3. Evaluar la funcion en la malla
y = f(x);

%% 4. Inicializar vector para la derivada numerica
df_num = NaN(size(x));

%% 5. Aplicar la formula de diferencia centrada
% f'(x_i) ≈ (f(x_{i+1}) - f(x_{i-1})) / (2h)

for i = 2:n-1
    df_num(i) = (y(i+1) - y(i-1))/(2*h);
end

%% 6. Calcular la derivada exacta
df_exact = df(x);

%% 7. Calcular el error absoluto
error = abs(df_num - df_exact);

%% 8. Mostrar resultados en una tabla
T = table(x',y',df_num',df_exact',error',...
          'VariableNames',{'x','f(x)','DerivadaNumerica','DerivadaExacta','Error'});

disp('Resultados:')
disp(T)

%% 9. Graficar derivada exacta y aproximada
figure(1)

plot(x,df_exact,'k','LineWidth',2)
hold on
plot(x,df_num,'ro--','LineWidth',1.5)

legend('Derivada exacta','Derivada numerica')
xlabel('x')
ylabel('f''(x)')
title('Aproximacion por diferencias finitas centradas')
grid on

%% 10. Graficar el error
figure(2)

plot(x,error,'b','LineWidth',1.5)

xlabel('x')
ylabel('Error absoluto')
title('Error de la aproximacion')
grid on