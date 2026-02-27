% =====================================
% AJUSTE LINEAL (MODELO SIMPLE)
% y ≈ c0 + c1 x
% =====================================

x = [0;1;2;3;4;5];
y = [1;2;1;3;7;8];

m = length(x);

% Construcción manual del sistema normal
Sx  = sum(x);
Sy  = sum(y);
Sxx = sum(x.^2);
Sxy = sum(x.*y);

A = [m   Sx;
     Sx  Sxx];

b = [Sy;
     Sxy];

c = A\b;

c0 = c(1);
c1 = c(2);

fprintf('c0 = %.4f\n',c0)
fprintf('c1 = %.4f\n',c1)

% Gráfica
xx = linspace(min(x),max(x),100)';
yy = c0 + c1*xx;

figure
plot(x,y,'o','MarkerSize',8)
hold on
plot(xx,yy,'r','LineWidth',2)
title('Ajuste Lineal por Mínimos Cuadrados')
legend('Datos','Modelo')
grid on