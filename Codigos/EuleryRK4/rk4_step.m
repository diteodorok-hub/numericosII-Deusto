function y_next = rk4_step(u)

t = u(1);
y = u(2);
h = u(3);

f = evalin('base','f');   % ← clave

k1 = f(t, y);
k2 = f(t + h/2, y + h*k1/2);
k3 = f(t + h/2, y + h*k2/2);
k4 = f(t + h, y + h*k3);

y_next = y + (h/6)*(k1 + 2*k2 + 2*k3 + k4);

end