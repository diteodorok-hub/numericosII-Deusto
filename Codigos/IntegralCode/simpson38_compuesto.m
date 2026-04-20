function I = simpson38_compuesto(f, a, b, n)
% SIMPSON38_COMPUESTO Aproxima la integral con Simpson 3/8 compuesto
%
% Requiere n múltiplo de 3

    % Ajuste automático (opcional)
    r = mod(n,3);
    if r ~= 0
        n = n + (3 - r);
    end

    h = (b - a)/n;
    x = a:h:b;
    y = f(x);

    I = y(1) + y(end);

    for i = 2:n
        if mod(i-1,3) == 0
            I = I + 2*y(i);
        else
            I = I + 3*y(i);
        end
    end

    I = (3*h/8)*I;

end