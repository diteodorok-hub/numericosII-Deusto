clc; clear; close all;

%% Funcion
f = @(x) sin(x.^2);

%% Intervalo
a = 0;
b = pi;

%% Integral exacta (simbolica)
syms x
f_sym = sin(x.^2);
I_exacta = double(int(f_sym, x, a, b));
disp(['Integral exacta = ', num2str(I_exacta)])

%% Elegir metodo: '1/3' o '3/8'
metodo = '3/8';

%% Numero de subintervalos
N = [4 8 16 32 64];
error = zeros(size(N));
I_simp = zeros(size(N));
h_vals = zeros(size(N));

for k = 1:length(N)
    n = N(k);
    
    if metodo == "1/3"
        if mod(n,2) ~= 0
            n = n + 1; % Simpson 1/3 necesita n par
        end
    end
    
    if metodo == "3/8"
        if mod(n,3) ~= 0
            n = n + (3 - mod(n,3)); % Simpson 3/8 necesita multiplo de 3
        end
    end
    
    h = (b-a)/n;
    x_vals = a:h:b;
    y = f(x_vals);
    
    %% Simpson 1/3
    if metodo == "1/3"
        I = y(1) + y(end);
        for i = 2:2:n
            I = I + 4*y(i);
        end
        for i = 3:2:n-1
            I = I + 2*y(i);
        end
        I = (h/3)*I;
    end
    
    %% Simpson 3/8
    if metodo == "3/8"
        I = y(1) + y(end);
        for i = 2:n
            if mod(i-1,3) == 0
                I = I + 2*y(i);
            else
                I = I + 3*y(i);
            end
        end
        I = (3*h/8)*I;
    end
    
    I_simp(k) = I;
    error(k) = abs(I_exacta - I);
    h_vals(k) = h;
    disp(['error = ', num2str(error(k))])
end

%% Grafica Integral
figure;
plot(N, I_simp, '-o', 'LineWidth', 2); hold on;
yline(I_exacta, 'r', 'LineWidth', 2);
title(['Simpson ', metodo, ' vs Integral exacta']);
xlabel('Numero de subintervalos');
ylabel('Integral');
legend('Integral numerica','Integral exacta');
grid on;

%% Grafica Error
figure;
plot(N, error, '-o', 'LineWidth', 2);
title(['Error Simpson ', metodo]);
xlabel('Numero de subintervalos');
ylabel('Error');
grid on;
