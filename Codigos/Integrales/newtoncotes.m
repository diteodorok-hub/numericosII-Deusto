clc; clear; close all;

%% Funcion
f = @(x) x.^2;

%% Intervalo
a = 0;
b = 1;

%% Integral exacta
syms x
f_sym = x^2;
I_exacta = double(int(f_sym, x, a, b));
disp(['Integral exacta = ', num2str(I_exacta)])

%% Newton-Cotes 5 puntos (n = 4 subintervalos)
n = 4;
x_vals = linspace(a,b,n+1);
y_vals = f(x_vals);

%% Construir polinomio interpolador de Lagrange
syms t
P = 0;

for i = 1:n+1
    L = 1;
    for j = 1:n+1
        if j ~= i
            L = L * (t - x_vals(j))/(x_vals(i) - x_vals(j));
        end
    end
    P = P + y_vals(i)*L;
end

P = expand(P); % polinomio interpolador
disp('Polinomio interpolador:')
disp(P)

%% Integral numerica (integral del polinomio)
I_num = double(int(P, t, a, b));
disp(['Integral numerica = ', num2str(I_num)])

%% Error
error = abs(I_exacta - I_num);
disp(['Error = ', num2str(error)])

%% Graficar funcion y polinomio
xx = linspace(a,b,200);
P_fun = matlabFunction(P);

figure;
plot(xx, f(xx), 'b', 'LineWidth', 2); hold on;
plot(xx, P_fun(xx), 'r--', 'LineWidth', 2);
legend('f(x)', 'Polinomio interpolador');
title('Interpolacion Newton-Cotes 5 puntos');
xlabel('x'); ylabel('y');
grid on;

%% Graficar area bajo el polinomio (integral numerica)
figure;
plot(xx, P_fun(xx), 'r', 'LineWidth', 2); hold on;

X_fill = [xx fliplr(xx)];
Y_fill = [P_fun(xx) zeros(size(xx))];
fill(X_fill, Y_fill, 'r', 'FaceAlpha', 0.3);

title('Area bajo el polinomio interpolador (Integral numerica)');
xlabel('x'); ylabel('y');
grid on;