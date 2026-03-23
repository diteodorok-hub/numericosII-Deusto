clc; clear; close all;

f = @(x) x.^2;
df = @(x) 2*x;

x0 = 0.5;
h_vals = 0.2 ./ (2.^(0:8));

error = [];

for h = h_vals
    df_num = (f(x0+h) - f(x0-h))/(2*h);
    df_real = df(x0);
    error = [error abs(df_real - df_num)];
end

figure
loglog(h_vals,error,'o-','LineWidth',2)
grid on
xlabel('h')
ylabel('Error')
title('Precisión - Diferencia centrada O(h^2)')