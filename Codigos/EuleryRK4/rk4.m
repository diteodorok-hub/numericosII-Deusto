function [x, y] = rk4(f, x0, y0, h, N)
% RK4 - Metodo de Runge-Kutta de orden 4
%
% Entrada:
%   f  : funcion @(x,y)
%   x0 : valor inicial
%   y0 : condicion inicial
%   h  : paso
%   N  : numero de pasos
%
% Salida:
%   x  : vector de nodos
%   y  : solucion aproximada

%function [x, y] = rk4(f, x0, y0, h, N)

x = zeros(1, N+1);
y = zeros(1, N+1);

x(1) = x0;
y(1) = y0;

for n = 1:N
    k1 = f(x(n), y(n));
    k2 = f(x(n) + h/2, y(n) + h*k1/2);
    k3 = f(x(n) + h/2, y(n) + h*k2/2);
    k4 = f(x(n) + h, y(n) + h*k3);

    y(n+1) = y(n) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
    x(n+1) = x(n) + h;
end

end