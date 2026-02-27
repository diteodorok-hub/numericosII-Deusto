% =====================================
% POLINOMIOS ORTOGONALES POR RECURRENCIA
% P_{n+1}(x) = (x - alpha_n) P_n(x)
%               - beta_n P_{n-1}(x)
% =====================================

clear; clc;

N = 5;  % grado máximo

% Coeficientes (ejemplo genérico)
alpha = zeros(N,1);      % alpha_n
beta  = zeros(N,1);      % beta_n

% Dominio para graficar
x = linspace(-1,1,400);

% Matriz para almacenar valores
P = zeros(N+1,length(x));

% Condiciones iniciales
P(1,:) = 1;        % P0(x)
P(2,:) = x;        % P1(x)

% Recurrencia
for n = 2:N
    P(n+1,:) = (x - alpha(n)) .* P(n,:) ...
               - beta(n) .* P(n-1,:);
end

% Graficar
figure
plot(x,P,'LineWidth',1.5)
legend('P0','P1','P2','P3','P4','P5')
title('Polinomios generados por recurrencia')
grid on