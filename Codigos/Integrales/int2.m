clc; clear; close all;

%% Funcion
f = @(x) x.^2;

%% Intervalo
a = 0;
b = 1;

%% Integral exacta (simbolica)
syms x
f_sym = x^2;
I_exacta = double(int(f_sym, x, a, b));

disp(['Integral exacta = ', num2str(I_exacta)])

%% Numero de subintervalos
N = [4 8 16 32 64 128];
error = zeros(size(N));
h_vals = zeros(size(N));
I_trap = zeros(size(N));

for k = 1:length(N)
    n = N(k);
    h = (b-a)/n;
    x_vals = a:h:b;
    y = f(x_vals);
    
    % Trapecio compuesto
    I = h*( sum(y) - 0.5*(y(1)+y(end)) );
    
    I_trap(k) = I;
    error(k) = abs(I_exacta - I);
    h_vals(k) = h;
end
disp(['Integral numerica ', num2str(I_trap(k))]);
disp(['error ', num2str(error(k))]);
disp(['Paso ', num2str(h_vals(k))]);

%% Grafica 1: Integral numerica vs exacta
figure;
plot(N, I_trap, '-o', 'LineWidth', 2); hold on;
yline(I_exacta, 'r', 'LineWidth', 2);
legend('Integral Trapecio','Integral Exacta');
title('Integral numerica vs exacta');
xlabel('Numero de subintervalos');
ylabel('Valor de la integral');
grid on;

%% Grafica 2: Error
figure;
plot(N, error, '-o', 'LineWidth', 2);
title('Error del metodo del trapecio');
xlabel('Numero de subintervalos');
ylabel('Error');
grid on;

%% Grafica 3: Precision (orden del metodo)
figure;
loglog(h_vals, error, '-o', 'LineWidth', 2);
title('Precision del metodo del trapecio (log-log)');
xlabel('h');
ylabel('Error');
grid on;

%% Calculo del orden
p = polyfit(log(h_vals), log(error), 1);
orden = p(1);
disp(['Orden aproximado del metodo: ', num2str(orden)]);

%% Grafica 4: Interpretacion geometrica (trapecios)
figure;

N_plot = [4 8 16 32]; % valores para visualizar trapecios

for k = 1:length(N_plot)
    n = N_plot(k);
    h = (b-a)/n;
    x_vals = a:h:b;
    y = f(x_vals);
    
    subplot(2,2,k)
    xx = linspace(a,b,200);
    plot(xx, f(xx), 'b', 'LineWidth', 2); hold on;

    for i = 1:n
        X = [x_vals(i) x_vals(i) x_vals(i+1) x_vals(i+1)];
        Y = [0 y(i) y(i+1) 0];
        fill(X,Y,'r','FaceAlpha',0.3);
    end

    % Calcular integral para mostrarla
    I = h*( sum(y) - 0.5*(y(1)+y(end)) );
    title(['n = ', num2str(n), ', I = ', num2str(I)]);
    
    xlabel('x');
    ylabel('f(x)');
    grid on;
end