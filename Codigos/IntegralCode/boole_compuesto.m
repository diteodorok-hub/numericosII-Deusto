function I = boole_compuesto(f, a, b, n)
% BOOLE_COMPUESTO Aproxima la integral con la regla de Boole
%
% Requiere n múltiplo de 4

    % Ajuste automático
    r = mod(n,4);
    if r ~= 0
        n = n + (4 - r);
    end

    h = (b - a)/n;
    x = a:h:b;
    y = f(x);

    I = 0;

    % Aplicar Boole por bloques de 4 subintervalos
    for i = 1:4:n
        I = I + (2*h/45) * ( ...
            7*y(i) + ...
            32*y(i+1) + ...
            12*y(i+2) + ...
            32*y(i+3) + ...
            7*y(i+4) );
    end

end