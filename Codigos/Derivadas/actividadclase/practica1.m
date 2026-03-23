clc; clear; close all;
% y_ruido = y + 0.02*randn(size(y));
%% =========================================================
%% DATOS LANZAMIENTO
%% =========================================================
t = [0 0.5 1.0 1.5 2.0 2.5 3.0];
y = [1.86 3.20 4.10 4.45 4.20 3.40 2.10];
h = 0.5;

%% =========================================================
%% 1. INTERPOLACIÓN DE NEWTON (DIFERENCIAS DIVIDIDAS)
%% =========================================================
n = length(t);
DD = zeros(n,n);
DD(:,1) = y';

for j = 2:n
    for i = 1:n-j+1
        DD(i,j) = (DD(i+1,j-1) - DD(i,j-1)) / (t(i+j-1) - t(i));
    end
end

disp('Tabla de diferencias divididas:')
disp(DD)

% Polinomio de Newton
syms X
P = DD(1,1);
prod = 1;

for k = 1:n-1
    prod = prod*(X - t(k));
    P = P + DD(1,k+1)*prod;
end

P = expand(P);
disp('Polinomio interpolante:')
disp(P)

%% Verificar que interpola los puntos
disp('Verificación:')
for i = 1:length(t)
    val = double(subs(P,X,t(i)));
    fprintf('P(%.2f) = %.4f   y = %.4f\n', t(i), val, y(i))
end

%% Grafica interpolación
tt = linspace(0,3,200);
yy = double(subs(P,X,tt));

figure
plot(t,y,'ro','LineWidth',2)
hold on
plot(tt,yy,'b','LineWidth',2)
legend('Datos','Polinomio de Newton')
title('Interpolación de Newton')
xlabel('t')
ylabel('y')
grid on

%% =========================================================
%% 2. DERIVADAS NUMÉRICAS EN t = 1.5
%% =========================================================
i = 4; % t(4) = 1.5

% Orden 2
v2 = (y(i+1) - y(i-1))/(2*h);

% Orden 4 
v4 = (-y(i+2) + 8*y(i+1) - 8*y(i-1) + y(i-2))/(12*h);

% Orden 5
v5 = (-2*y(i+3) + 15*y(i+2) - 60*y(i+1) + 20*y(i) + 30*y(i-1) - 3*y(i-2))/(60*h);

% Orden 6
v6 = (y(i-3) - 9*y(i-2) + 45*y(i-1) - 45*y(i+1) + 9*y(i+2) - y(i+3))/(60*h);

% Orden 8 
%v8 = (-3*y(i+4) + 32*y(i+3) - 168*y(i+2) + 672*y(i+1) - 672*y(i-1) + 168*y(i-2) - 32*y(i-3) + 3*y(i-4))/(840*h);

%% =========================================================
%% 3. DERIVADA "REAL" (DEL POLINOMIO)
%% =========================================================
dP = diff(P);
v_real = double(subs(dP, X, 1.5));

%% =========================================================
%% 4. ERRORES
%% =========================================================
error2 = abs(v_real - v2);
error4 = abs(v_real - v4);
error5 = abs(v_real - v5);
error6 = abs(v_real - v6);
%error8 = abs(v_real - v8);

disp(' ')
disp('Velocidades:')
fprintf('Orden 2: %.6f\n', v2)
fprintf('Orden 4: %.6f\n', v4)
fprintf('Orden 5: %.6f\n', v5)
fprintf('Orden 6: %.6f\n', v6)
%fprintf('Orden 8: %.6f\n', v8)
fprintf('Real   : %.6f\n', v_real)

disp(' ')
disp('Errores:')
fprintf('Error orden 2: %.6f\n', error2)
fprintf('Error orden 4: %.6f\n', error4)
fprintf('Error orden 5: %.6f\n', error5)
fprintf('Error orden 6: %.6f\n', error6)
%fprintf('Error orden 8: %.6f\n', error8)

%% =========================================================
%% 5. GRAFICA DE ERRORES
%% =========================================================
figure
errores = [error2 error4 error5 error6];
orden = [2 4 5 6];

plot(orden, errores,'o-','LineWidth',2)
title('Error vs Orden del método')
xlabel('Orden del método')
ylabel('Error')
grid on

%% =========================================================
%% 6. GRAFICA DE LAS DERIVADAS
%% =========================================================
figure
valores = [v2 v4 v5 v6 v_real];
nombres = {'Orden 2','Orden 4','Orden 5','Orden 6','Real'};

bar(valores)
set(gca,'XTickLabel',nombres)
title('Comparación de derivadas en t = 1.5')
ylabel('Velocidad')
grid on

%% =========================================================
%% 1. TABLA DE DIFERENCIAS FINITAS
%% =========================================================
D = zeros(n,n);
D(:,1) = y';

for j = 2:n
    for i = 1:n-j+1
        D(i,j) = D(i+1,j-1) - D(i,j-1);
    end
end

disp('Tabla de diferencias finitas:')
disp(D)

% Grafica de las diferencias
figure
plot(D,'o-')
title('Tabla de diferencias finitas')
xlabel('Índice')
ylabel('Valor')
legend('y','Δy','Δ²y','Δ³y','Δ^4y','Δ^5y','Δ^6y')