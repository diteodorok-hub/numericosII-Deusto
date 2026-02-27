% =====================================
% ESTIMACIÓN DE ALPHA EN ECUACIÓN DEL CALOR
% =====================================

% Mallado
Nx = 20;
Nt = 20;
L = 1;
T = 0.1;

x = linspace(0,L,Nx);
t = linspace(0,T,Nt);

dx = x(2)-x(1);
dt = t(2)-t(1);

alpha_real = 0.5;

% Solución exacta ejemplo
[X,Tgrid] = meshgrid(x,t);
u = exp(-pi^2*alpha_real*Tgrid) .* sin(pi*X);

% Derivadas aproximadas
ut  = diff(u,1,1)/dt;              % derivada temporal
uxx = diff(u,2,2)/(dx^2);          % derivada espacial

% Ajustamos tamaños
ut  = ut(:,2:end-1);
uxx = uxx(1:end-1,:);

% Vectorizamos
ut_vec  = ut(:);
uxx_vec = uxx(:);

% Modelo: ut = alpha * uxx
A = uxx_vec;
b = ut_vec;

alpha_est = (A'*A)\(A'*b);

fprintf('Alpha real = %.4f\n',alpha_real)
fprintf('Alpha estimado = %.4f\n',alpha_est)