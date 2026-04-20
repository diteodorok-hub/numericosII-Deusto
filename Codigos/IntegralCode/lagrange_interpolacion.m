function p = lagrange_interpolacion(x_data, y_data, x_eval)
% LAGRANGE_INTERPOLACION Evalúa el polinomio de Lagrange
%
% Entrada:
%   x_data : nodos (vector)
%   y_data : valores (vector)
%   x_eval : puntos donde evaluar
%
% Salida:
%   p : valores del polinomio en x_eval

    n = length(x_data);
    p = zeros(size(x_eval));

    for i = 1:n
        L = ones(size(x_eval));
        
        for j = 1:n
            if j ~= i
                L = L .* (x_eval - x_data(j)) / (x_data(i) - x_data(j));
            end
        end
        
        p = p + y_data(i) * L;
    end

end