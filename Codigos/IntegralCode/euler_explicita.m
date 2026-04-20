function [t, y] = euler_explicita(f, t0, tf, y0, n)

    h = (tf - t0)/n;

    t = linspace(t0, tf, n+1);
    y = zeros(length(y0), n+1);  

    y(:,1) = y0;

    for i = 1:n
        y(:,i+1) = y(:,i) + h * f(t(i), y(:,i));
    end

end