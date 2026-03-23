%% Ejemplo de diferencias finitas paso a paso

clear
clc

%% Paso 1: Definir la función
f = @(x) x.^2;

%% Paso 2: Construir la malla
x = linspace(0,1,5);      % puntos: 0, 0.25, 0.5, 0.75, 1
h = x(2) - x(1);          % tamaño del paso

%% Paso 3: Evaluar la función
y = f(x);

%% Paso 4: Inicializar el vector de derivadas numéricas
df_num = NaN(size(x));

%% Paso 5: Aplicar diferencia centrada
for i = 2:length(x)-1
    df_num(i) = (y(i+1) - y(i-1)) / (2*h);
end

%% Paso 6: Derivada exacta
df_exact = 2*x;

%% Paso 7: Mostrar resultados en tabla
T = table(x', y', df_num', df_exact', ...
    'VariableNames', {'x','f(x)','DerivadaNumerica','DerivadaExacta'});

disp('Resultados:')
disp(T)