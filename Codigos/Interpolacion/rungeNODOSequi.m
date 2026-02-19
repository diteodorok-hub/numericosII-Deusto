clear; clc; close all;

% Funcion de Runge
f = @(x) 1./(1 + 25*x.^2);

% Mallado fino para graficar
xx = linspace(-1,1,2000);
ff = f(xx);

figure;
hold on;
plot(xx, ff, 'k', 'LineWidth', 2);

% Probar distintos grados
for n = [5 10 15 20]
    
    % Nodos equiespaciados
    x_nodes = linspace(-1,1,n+1);
    y_nodes = f(x_nodes);
    
    % Interpolacion polinomica (forma de Lagrange via polyfit)
    p = polyfit(x_nodes, y_nodes, n);
    pp = polyval(p, xx);
    
    plot(xx, pp, 'LineWidth', 1.5);
end

legend('f(x)', 'n=5','n=10','n=15','n=20');
title('Fenomeno de Runge - nodos equiespaciados');
xlabel('x'); ylabel('y');
grid on;

%KEY: 
%Para n pequeño → buena aproximación.

%Para n mayor → oscilaciones violentas en los extremos.

%En el centro se comporta razonablemente bien.

%Cerca de ±1 explota