%% GENERAR COEFICIENTES DE DERIVADA CENTRADA AUTOMATICAMENTE

clear
clc

%% Orden del stencil
m = 3;   % m=1 -> orden 2
         % m=2 -> orden 4
         % m=3 -> orden 6

k = -m:m;        % posiciones del stencil
n = length(k);

%% Construccion del sistema de Taylor
A = zeros(n);
b = zeros(n,1);

for i = 1:n
    A(i,:) = k.^(i-1);
end

b(2) = 1;   % queremos aproximar f'(x)

%% Resolver sistema
a = A\b;

disp('Coeficientes del stencil:')
disp(a')

disp('Posiciones del stencil:')
disp(k)