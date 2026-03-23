clc; clear; close all;

f = @(x) x.^2;
df = @(x) 2*x;

h = 0.1;
x = 0:h:1;

y = f(x);
ruido = 0.02*randn(size(y));
y_ruido = y + ruido;

n = length(x);
df_num = zeros(1,n);

for i = 2:n-1
    df_num(i) = (y_ruido(i+1) - y_ruido(i-1))/(2*h);
end

df_real = df(x);

figure
plot(x,df_real,'k','LineWidth',2)
hold on
plot(x,df_num,'r--','LineWidth',2)
legend('Exacta','Con ruido')
title('Efecto del ruido en la derivada')
grid on