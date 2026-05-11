%% =========================================================
% OSCILADOR ARMONICO
%
% x'' + x = 0
%
% Lo escribimos como sistema:
%
% x' = y
% y' = -x
%
% Condiciones iniciales:
%
% x(0) = 1
% y(0) = 0
%% =========================================================

clear
clc
close all

%% =========================================================
% DEFINICION DEL SISTEMA
%% =========================================================

f = @(t,Y) [
    Y(2);
   -Y(1)
];

%% =========================================================
% INTERVALO
%% =========================================================

t0 = 0;
tf = 20;

%% =========================================================
% CONDICIONES INICIALES
%% =========================================================

Y0 = [1;0];

%% =========================================================
% NUMERO DE PASOS
%% =========================================================

n = 400;

h = (tf-t0)/n;

%% =========================================================
% EULER
%% =========================================================

[t_euler, Y_euler] = euler_explicita(f,t0,tf,Y0,n);

%% =========================================================
% RK4
%% =========================================================

[t_rk4, Y_rk4] = srk4(f,t0,Y0,h,n);

%% =========================================================
% SOLUCION EXACTA
%% =========================================================

t_exacta = linspace(t0,tf,2000);

x_exacta = cos(t_exacta);

y_exacta = -sin(t_exacta);

%% =========================================================
% GRAFICA x(t)
%% =========================================================

figure

plot(t_exacta,x_exacta,'k','LineWidth',2)
hold on

plot(t_euler,Y_euler(1,:),'r--','LineWidth',1.5)

plot(t_rk4,Y_rk4(1,:),'b','LineWidth',1.5)

grid on

xlabel('t')
ylabel('x(t)')

title('Oscilador armonico - x(t)')

legend('Exacta','Euler','RK4')

%% =========================================================
% GRAFICA y(t)
%% =========================================================

figure

plot(t_exacta,y_exacta,'k','LineWidth',2)
hold on

plot(t_euler,Y_euler(2,:),'r--','LineWidth',1.5)

plot(t_rk4,Y_rk4(2,:),'b','LineWidth',1.5)

grid on

xlabel('t')
ylabel('y(t)')

title('Oscilador armonico - y(t)')

legend('Exacta','Euler','RK4')

%% =========================================================
% RETRATO DE FASE x^2+y^2=1 x=cos,y=si 
%% =========================================================

figure

plot(x_exacta,y_exacta,'k','LineWidth',2)
hold on

plot(Y_euler(1,:),Y_euler(2,:),'r--','LineWidth',1.5)

plot(Y_rk4(1,:),Y_rk4(2,:),'b','LineWidth',1.5)

grid on
axis equal

xlabel('x')
ylabel('y')

title('Retrato de fase')

legend('Exacta','Euler','RK4')

%% =========================================================
% ERRORES FINALES
%% =========================================================

error_x_euler = abs(cos(tf) - Y_euler(1,end));

error_y_euler = abs(-sin(tf) - Y_euler(2,end));

error_x_rk4 = abs(cos(tf) - Y_rk4(1,end));

error_y_rk4 = abs(-sin(tf) - Y_rk4(2,end));

disp(' ')
disp('==============================')
disp('ERROR EULER')
disp('==============================')

disp('Error en x:')
disp(error_x_euler)

disp('Error en y:')
disp(error_y_euler)

disp(' ')
disp('==============================')
disp('ERROR RK4')
disp('==============================')

disp('Error en x:')
disp(error_x_rk4)

disp('Error en y:')
disp(error_y_rk4)