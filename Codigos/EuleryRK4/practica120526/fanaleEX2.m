%% =========================================================
% EJERCICIO 2
%
% y' = sin(y) + t^2
% y(0) = 1
%
% Comparacion:
% Euler vs RK4
%% =========================================================

clear
clc
close all

%% =========================================================
% DEFINICION DEL PROBLEMA
%% =========================================================

f = @(t,y) sin(y) + t.^2;

t0 = 0;
tf = 2;

y0 = 1;

n = 20;

h = (tf-t0)/n;

%% =========================================================
% METODO DE EULER
%% =========================================================

[t_euler, y_euler] = euler_explicita(f,t0,tf,y0,n);

%% =========================================================
% METODO RK4
%% =========================================================

[x_rk4, y_rk4] = rk4(f,t0,y0,h,n);

%% =========================================================
% SOLUCION DE REFERENCIA
%
% Como no conocemos solucion exacta,
% usamos RK4 con paso muy pequeño
%% =========================================================

n_ref = 5000;

h_ref = (tf-t0)/n_ref;

[x_ref, y_ref] = rk4(f,t0,y0,h_ref,n_ref);

%% =========================================================
% GRAFICA DE LAS SOLUCIONES
%% =========================================================

figure

plot(x_ref,y_ref,'k','LineWidth',2)
hold on

plot(t_euler,y_euler,'ro--','LineWidth',1.5)

plot(x_rk4,y_rk4,'bs--','LineWidth',1.5)

grid on

xlabel('t')
ylabel('y(t)')

title('EDO no lineal')

legend('Referencia RK4','Euler','RK4')

%% =========================================================
% ERROR FINAL
%% =========================================================

y_ref_final = y_ref(end);

error_euler = abs(y_euler(end) - y_ref_final);

error_rk4 = abs(y_rk4(end) - y_ref_final);

disp(' ')
disp('==============================')
disp('ERROR FINAL')
disp('==============================')

disp('Error Euler:')
disp(error_euler)

disp('Error RK4:')
disp(error_rk4)

%% =========================================================
% ERROR LOGARITMICO
%% =========================================================

log_error_euler = log10(error_euler);

log_error_rk4 = log10(error_rk4);

disp(' ')
disp('==============================')
disp('ERROR LOGARITMICO')
disp('==============================')

disp('log10(Error Euler):')
disp(log_error_euler)

disp('log10(Error RK4):')
disp(log_error_rk4)

%% =========================================================
% ORDEN EXPERIMENTAL EULER
%% =========================================================

n1 = 20;
n2 = 40;

[t1,y1] = euler_explicita(f,t0,tf,y0,n1);

[t2,y2] = euler_explicita(f,t0,tf,y0,n2);

E1 = abs(y1(end) - y_ref_final);

E2 = abs(y2(end) - y_ref_final);

p_euler = log(E1/E2)/log(2);

disp(' ')
disp('==============================')
disp('ORDEN EXPERIMENTAL EULER')
disp('==============================')

disp(p_euler)

%% =========================================================
% ORDEN EXPERIMENTAL RK4
%% =========================================================

h1 = (tf-t0)/n1;
h2 = (tf-t0)/n2;

[x1,y1_rk] = rk4(f,t0,y0,h1,n1);

[x2,y2_rk] = rk4(f,t0,y0,h2,n2);

E1_rk = abs(y1_rk(end) - y_ref_final);

E2_rk = abs(y2_rk(end) - y_ref_final);

p_rk4 = log(E1_rk/E2_rk)/log(2);

disp(' ')
disp('==============================')
disp('ORDEN EXPERIMENTAL RK4')
disp('==============================')

disp(p_rk4)