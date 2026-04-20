function [t, y] = euler_explicito(f, t0, tf, y0, n)
% EULER_EXPLICITO Resuelve y' = f(t,y) con Euler
%
% Entrada:
%   f  : @(t,y)
%   t0 : tiempo inicial
%   tf : tiempo final
%   y0 : condición inicial
%   n  : número de pasos
%
% Salida:
%   t  : vector de tiempos
%   y  : solución aproximada

    h = (tf - t0)/n;

    t = linspace(t0, tf, n+1);
    y = zeros(1, n+1);

    y(1) = y0;

    for i = 1:n
        y(i+1) = y(i) + h * f(t(i), y(i));
    end

end