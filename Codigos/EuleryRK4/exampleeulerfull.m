clc; clear;

syms y(t)

% Definir la ecuación diferencial
ode = diff(y,t) == t^2 - y + sin(t);

% Condición inicial
cond = y(0) == 1;

% Resolver
y_exact = dsolve(ode, cond);

% Simplificar (opcional)
y_exact = simplify(y_exact);

disp('Solucion exacta:')
disp(y_exact)

% Convertir a función numérica
y_exact_fun = matlabFunction(y_exact);

% Intervalo
t_vals = linspace(0,2,100);
y_vals = y_exact_fun(t_vals);

% Euler
f = @(t,y) t.^2 - y + sin(t);
[t_euler, y_euler] = euler_explicito(f, 0, 2, 1, 50);

% Graficar
figure;
plot(t_vals, y_vals, 'r','LineWidth',2); hold on;
plot(t_euler, y_euler, '-o');

legend('Exacta','Euler');
title('Comparacion Euler vs solucion exacta');
xlabel('t');
ylabel('y');
grid on;

%error = abs(y_exact_fun(t_euler) - y_euler);