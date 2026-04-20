function I = gauss_legendre(f, a, b, n)
% GAUSS_LEGENDRE Cuadratura de Gauss-Legendre en [a,b]
%
% Entrada:
%   f : función
%   a,b : intervalo
%   n : número de nodos
%
% Salida:
%   I : aproximación

    % Obtener nodos y pesos en [-1,1]
    [x, w] = lgwt(n, -1, 1);

    % Cambio de variable a [a,b]
    t = ((b-a)/2)*x + (a+b)/2;

    % Evaluación
    I = (b-a)/2 * sum(w .* f(t));

end