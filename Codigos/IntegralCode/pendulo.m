clc; clear; close all;

g = 9.81;
L = 1;


%y1′​=y2​
% %y2′​=−\frac{g}{L} ​sin(y1​)​

% sistema
f = @(t,y) [ ...
    y(2); 
   -(g/L)*sin(y(1)) 
];

% condiciones iniciales
theta0 = pi/4;   % ángulo inicial
omega0 = 0;      % velocidad inicial

y0 = [theta0; omega0];

t0 = 0;
tf = 10;
n = 500;

[t, y] = euler_explicita(f, t0, tf, y0, n);

theta = y(1,:);
omega = y(2,:);

%% Graficas
figure;
plot(t, theta, 'LineWidth',2);
xlabel('t');
ylabel('\theta');
title('Pendulo simple - Euler');
grid on;

figure;
plot(theta, omega, 'LineWidth',2);
xlabel('\theta');
ylabel('\omega');
title('Espacio de fases');
grid on;