%% =========================================================
% EJERCICIO 1
% y' = y
% y(0) = 1
%
% Comparacion:
% Euler vs RK4 vs solucion exacta
%% =========================================================

clear
clc
close all

%% DEFINICION DEL PROBLEMA

f = @(t,y) y;

t0 = 0;
tf = 2;

y0 = 1;

n = 20;     % numero de pasos
h = (tf-t0)/n;

%% =========================================================
% EULER
%% =========================================================

[t_euler, y_euler] = euler_explicita(f,t0,tf,y0,n);

%% =========================================================
% RK4
%% =========================================================

[x_rk4, y_rk4] = rk4(f,t0,y0,h,n);

%% =========================================================
% SOLUCION EXACTA
%% =========================================================

t_exacta = linspace(t0,tf,500);
y_exacta = exp(t_exacta);

%% =========================================================
% GRAFICAS
%% =========================================================

figure

plot(t_exacta,y_exacta,'k','LineWidth',2)
hold on

plot(t_euler,y_euler,'ro--','LineWidth',1.5)

plot(x_rk4,y_rk4,'bs--','LineWidth',1.5)

grid on

xlabel('t')
ylabel('y(t)')

title('Comparacion Euler vs RK4')

legend('Solucion exacta','Euler','RK4')

%% =========================================================
% ERROR ABSOLUTO |exacta - aprox|
%% =========================================================

y_exacta_euler = exp(t_euler);

error_euler = abs(y_exacta_euler - y_euler);

y_exacta_rk4 = exp(x_rk4);

error_rk4 = abs(y_exacta_rk4 - y_rk4);

disp('Error Euler = ')
disp(error_euler)

disp('Error RK4 = ')
disp(error_rk4)

%% =========================================================
% ERROR LOGARITMICO
%% =========================================================
% $log(Eh​)=plog(h)+log(C)$. donde $Eh=h^p$

log_error_euler = log10(error_euler);

log_error_rk4 = log10(error_rk4);

figure

plot(t_euler,log_error_euler,'ro--','LineWidth',1.5)
hold on

plot(x_rk4,log_error_rk4,'bs--','LineWidth',1.5)

grid on

xlabel('t')
ylabel('log_{10}(error)')

title('Error logaritmico')

legend('Euler','RK4')

%% =========================================================
% ORDEN EXPERIMENTAL DE EULER (prueba de orden del metodo)
%% =========================================================
%si divides h entre 2,
%el error de Euler se divide aproximadamente entre 2,
%y el error de RK4 se divide aproximadamente entre 2^4=16.
% El orden experimental intenta verificar numéricamente si esto ocurre.
% $p=\frac{log(Eh/Eh2)}{log(2)}$, donde $Eh=ch$ y $Eh2=C\fraq{h}{2}$


n1 = 20;
n2 = 40;

% Euler con n1
[t1,y1] = euler_explicita(f,t0,tf,y0,n1);

% Euler con n2
[t2,y2] = euler_explicita(f,t0,tf,y0,n2);

% errores finales
E1 = abs(exp(tf) - y1(end));

E2 = abs(exp(tf) - y2(end));

p_euler = log(E1/E2)/log(2);

disp('Orden experimental Euler')
disp(p_euler)

%% =========================================================
% ORDEN EXPERIMENTAL RK4
%% =========================================================

h1 = (tf-t0)/n1;
h2 = (tf-t0)/n2;

[x1,y1_rk] = rk4(f,t0,y0,h1,n1);

[x2,y2_rk] = rk4(f,t0,y0,h2,n2);

E1_rk = abs(exp(tf) - y1_rk(end));

E2_rk = abs(exp(tf) - y2_rk(end));

p_rk4 = log(E1_rk/E2_rk)/log(2);

disp('Orden experimental RK4')
disp(p_rk4)