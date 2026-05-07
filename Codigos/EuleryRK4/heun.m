function [t, y] = heun(f, t0, tf, y0, n)
% HEUN Método de Euler mejorado (orden 2)
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
        % Pendiente inicial
        f1 = f(t(k), y(:,k));
        
        % Predicción (Euler)
        y_pred = y(:,k) + h * f1;
        
        % Pendiente corregida
        f2 = f(t(k+1), y_pred);
        
        % Corrección (promedio)
        y(:,k+1) = y(:,k) + (h/2)*(f1 + f2);
    end
end