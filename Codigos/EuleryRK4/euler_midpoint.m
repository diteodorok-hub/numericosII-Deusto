function [t, y] = euler_midpoint(f, t0, tf, y0, n)
% EULER_MIDPOINT Método de Euler modificado (punto medio)
%
% Entrada:
%   f  : función @(t,y)
%   t0 : tiempo inicial
%   tf : tiempo final
%   y0 : condición inicial (puede ser vector)
%   n  : número de pasos
%
% Salida:
%   t : vector de tiempos
%   y : solución aproximada

    h = (tf - t0)/n;
    t = linspace(t0, tf, n+1);

    y = zeros(length(y0), n+1);
    y(:,1) = y0;

    for k = 1:n
        % Pendiente en el punto inicial
        f1 = f(t(k), y(:,k));
        
        % Aproximación al punto medio
        y_mid = y(:,k) + (h/2)*f1;
        
        % Pendiente en el punto medio
        f_mid = f(t(k) + h/2, y_mid);
        
        % Actualización final
        y(:,k+1) = y(:,k) + h * f_mid;
    end
end