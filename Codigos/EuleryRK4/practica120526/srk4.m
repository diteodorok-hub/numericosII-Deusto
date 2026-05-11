function [t, y] = srk4(f, t0, y0, h, N)

%=========================================================
% RK4 PARA SISTEMAS Y ECUACIONES ESCALARES
%=========================================================

t = zeros(1,N+1);

y = zeros(length(y0),N+1);

t(1) = t0;

y(:,1) = y0;

for n = 1:N

    k1 = f(t(n), y(:,n));

    k2 = f(t(n)+h/2,...
           y(:,n)+h*k1/2);

    k3 = f(t(n)+h/2,...
           y(:,n)+h*k2/2);

    k4 = f(t(n)+h,...
           y(:,n)+h*k3);

    y(:,n+1) = y(:,n) + ...
        (h/6)*(k1 + 2*k2 + 2*k3 + k4);

    t(n+1) = t(n) + h;

end

end