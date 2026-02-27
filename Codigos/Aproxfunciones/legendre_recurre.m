% =====================================
% POLINOMIOS DE LEGENDRE POR RECURRENCIA
% =====================================

clear; clc;

N = 5;

x = linspace(-1,1,400);
P = zeros(N+1,length(x));

% Coeficientes Legendre
alpha = zeros(N,1);
beta  = zeros(N,1);

for n = 1:N
    beta(n) = n^2 / (4*n^2 - 1);
end

% Condiciones iniciales
P(1,:) = 1;   % P0
P(2,:) = x;   % P1

for n = 2:N
    P(n+1,:) = x .* P(n,:) ...
               - beta(n) .* P(n-1,:);
end

figure
plot(x,P,'LineWidth',1.5)
legend('P0','P1','P2','P3','P4','P5')
title('Polinomios de Legendre (Recurrencia)')
grid on