function I = simpson13_compuesto(f, a, b, n)
% SIMPSON13_COMPUESTO Aproxima la integral con Simpson 1/3 compuesto
%
% Requiere n par

    % Ajuste automático (opcional)
    if mod(n,2) ~= 0
        n = n + 1;
    end

    h = (b - a)/n;
    x = a:h:b;
    y = f(x);

    I = y(1) + y(end);

    % índices pares → coeficiente 4
    for i = 2:2:n
        I = I + 4*y(i);
    end

    % índices impares → coeficiente 2
    for i = 3:2:n-1
        I = I + 2*y(i);
    end

    I = (h/3)*I;

end