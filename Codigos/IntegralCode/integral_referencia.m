function I = integral_referencia(f, a, b)
% INTEGRAL_REFERENCIA Calcula una integral de alta precisión

    I = integral(f, a, b, 'RelTol',1e-12, 'AbsTol',1e-14);

end