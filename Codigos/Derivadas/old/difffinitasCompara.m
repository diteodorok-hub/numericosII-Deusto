%% Ejemplo diferencias finitas con grafica y error

clear
clc
close all

%% Paso 1: definir funcion
f = @(x) x.^2;

%% Paso 2: construir malla
x = linspace(0,1,50);
h = x(2)-x(1);

%% Paso 3: evaluar funcion
y = f(x);

%% Paso 4: derivada numerica (centrada)
df_num = NaN(size(x));

for i = 2:length(x)-1
    df_num(i) = (y(i+1) - y(i-1))/(2*h);
end

%% Paso 5: derivada exacta
df_exact = 2*x;

%% Paso 6: error
error = abs(df_num - df_exact);

%% Tabla de resultados
T = table(x',y',df_num',df_exact',error',...
    'VariableNames',{'x','f(x)','DerivadaNumerica','DerivadaExacta','Error'});

disp(T)

%% Figura 1: comparacion derivadas
figure(1)

plot(x,df_exact,'c','LineWidth',2)
hold on
plot(x,df_num,'ro--','LineWidth',1.5)

legend('Derivada exacta','Derivada diferencias finitas')
xlabel('x')
ylabel('f''(x)')
title('Comparacion de derivadas')
grid on

%% Figura 2: error
figure(2)

plot(x,error,'b','LineWidth',1.5)

xlabel('x')
ylabel('Error absoluto')
title('Error de la derivada numerica')
grid on