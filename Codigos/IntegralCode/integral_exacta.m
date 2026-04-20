function I = integral_exacta(f, a, b)
% INTEGRAL_EXACTA Calcula la integral exacta simbólicamente si es posible

    syms x
    
    % convertir f a simbólica
    f_sym = f(x);
    
    % integrar
    I_sym = int(f_sym, x, a, b);
    
    % convertir a número
    I = double(I_sym);

end