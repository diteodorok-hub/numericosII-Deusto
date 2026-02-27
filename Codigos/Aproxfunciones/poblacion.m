% =====================================
% MODELO LOGÍSTICO (POBLACIÓN)
% =====================================

t = [0;1;2;3;4;5];
P = [10;15;22;35;52;70];

K = 100;  % Capacidad de carga (supuesto conocida)

% Linealización
Y = log(K./P - 1);

% Modelo lineal: Y = a + b t
A = [ones(size(t)) t];

c = (A'*A)\(A'*Y);

a = c(1);
b = c(2);

r = -b;
A_param = exp(a);

fprintf('r = %.4f\n',r)
fprintf('A = %.4f\n',A_param)

% Reconstrucción del modelo no lineal
tt = linspace(min(t),max(t),100)';
P_model = K ./ (1 + A_param*exp(-r*tt));

figure
plot(t,P,'o','MarkerSize',8)
hold on
plot(tt,P_model,'r','LineWidth',2)
title('Ajuste Modelo Logístico')
legend('Datos','Modelo logístico')
grid on