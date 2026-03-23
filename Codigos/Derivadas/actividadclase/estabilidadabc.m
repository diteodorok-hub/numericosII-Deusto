clc; clear; close all;
% Orden 2 más suave → más estable, Orden 6 oscila mucho → inestable con ruido
f = @(x) x.^2;
df = @(x) 2*x;

h = 0.1;
x = -0.5:h:1.5;
y = f(x);

% Ruido
ruido = 0.02*randn(size(y));
y_ruido = y + ruido;

n = length(x);

df2 = zeros(1,n);
df6 = zeros(1,n);

for i = 4:n-3
    % Orden 2
    df2(i) = (y_ruido(i+1) - y_ruido(i-1))/(2*h);
    
    % Orden 6
    df6(i) = (-y_ruido(i+3) + 9*y_ruido(i+2) - 45*y_ruido(i+1) ...
              + 45*y_ruido(i-1) - 9*y_ruido(i-2) + y_ruido(i-3))/(60*h);
end

df_real = df(x);

figure
plot(x,df_real,'k','LineWidth',2)
hold on
plot(x,df2,'b--','LineWidth',2)
plot(x,df6,'r--','LineWidth',2)
legend('Exacta','Orden 2','Orden 6')
title('Estabilidad: orden alto amplifica ruido')
grid on