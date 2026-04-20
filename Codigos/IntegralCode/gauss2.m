function I = gauss2(f, a, b)
% GAUSS2 Cuadratura de Gauss-Legendre con 2 nodos

    % nodos en [-1,1]
    x1 = -1/sqrt(3);
    x2 =  1/sqrt(3);

    % cambio de variable a [a,b]
    t1 = ((b-a)/2)*x1 + (a+b)/2;
    t2 = ((b-a)/2)*x2 + (a+b)/2;

    % pesos = 1
    I = (b-a)/2 * ( f(t1) + f(t2) );

end