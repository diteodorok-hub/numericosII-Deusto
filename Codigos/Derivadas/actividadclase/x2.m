clc; clear; close all;

% discutir:
% No se puede usar en el primer punto
%No se puede usar en el último punto
%Las fórmulas centradas no se pueden usar en los extremos de la malla. 
% Solucion en para adelante y para atras 
%% Diferencias finitas completas
%df_num = zeros(1,n); % Adelante df_num(1) = (y(2) - y(1))/h; % Atras df_num(n) = (y(n) - y(n-1))/h;

%% Funcion
f = @(x) x.^2;
df = @(x) 2*x;

%% Malla
h = 0.25;
x = 0:h:1;
y = f(x);

%% Diferencia finita centrada
n = length(x);
df_num = zeros(1,n);

for i = 2:n-1
    df_num(i) = (y(i+1) - y(i-1))/(2*h);
end

%% Derivada exacta
df_exact = df(x);

%% Error
error = abs(df_exact - df_num);

%% Mostrar tabla
T = table(x', y', df_exact', df_num', error', ...
    'VariableNames', {'x','f(x)','df_exacta','df_numerica','error'});
disp(T)

%% Grafica
figure
plot(x,df_exact,'o-','LineWidth',2)
hold on
plot(x,df_num,'s-','LineWidth',2)
legend('Derivada exacta','Derivada numerica')
title('Diferencia finita centrada')
grid on

%% Error
figure
plot(x,error,'o-','LineWidth',2)
title('Error')
xlabel('x')
ylabel('Error')
grid on