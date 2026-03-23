clc; clear; close all;

%% Funcion
f = @(x) exp(x);
df = @(x) exp(x);

x0 = 0.5;

%% Valores de h
h_vals = 0.1 ./ (2.^(0:10));

error_forward = [];
error_backward = [];
error_centered = [];

for h = h_vals
    
    % Diferencias finitas
    df_forward  = (f(x0+h) - f(x0))/h;
    df_backward = (f(x0) - f(x0-h))/h;
    df_centered = (f(x0+h) - f(x0-h))/(2*h);
    
    df_real = df(x0);
    
    % Errores
    error_forward  = [error_forward  abs(df_real - df_forward)];
    error_backward = [error_backward abs(df_real - df_backward)];
    error_centered = [error_centered abs(df_real - df_centered)];
end

%% Tabla
T = table(h_vals', error_forward', error_backward', error_centered', ...
    'VariableNames', {'h','Error_Adelante','Error_Atras','Error_Centrada'});
disp(T)

%% Grafica log-log
figure
loglog(h_vals, error_forward,'o-','LineWidth',2)
hold on
loglog(h_vals, error_backward,'s-','LineWidth',2)
loglog(h_vals, error_centered,'d-','LineWidth',2)
grid on
legend('Adelante','Atras','Centrada')
xlabel('log(h)')
ylabel('log(Error)')
title('Error vs h (escala log-log)')

%% Calculo del orden experimental
disp('Orden experimental:')
for i = 1:length(h_vals)-1
    p_f = log(error_forward(i)/error_forward(i+1)) / log(h_vals(i)/h_vals(i+1));
    p_b = log(error_backward(i)/error_backward(i+1)) / log(h_vals(i)/h_vals(i+1));
    p_c = log(error_centered(i)/error_centered(i+1)) / log(h_vals(i)/h_vals(i+1));
    
    fprintf('Entre h=%.5f y h=%.5f -> Adelante: %.2f  Atras: %.2f  Centrada: %.2f\n', ...
        h_vals(i), h_vals(i+1), p_f, p_b, p_c);
end