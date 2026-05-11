%% =========================================================
% SISTEMA DE ECUACIONES DIFERENCIALES
%% =========================================================

clear
clc
close all

%% DEFINICION DEL SISTEMA

f = @(t,Y) [
    Y(1) + Y(2);
    Y(1) - Y(2)
];

%% INTERVALO

t0 = 0;
tf = 2;

%% CONDICIONES INICIALES

Y0 = [1;0];

%% NUMERO DE PASOS

n = 40;

%% EULER

[t,Y] = euler_explicita(f,t0,tf,Y0,n);

%% SOLUCION EXACTA

t_exacta = linspace(t0,tf,500);

x_exacta = ((sqrt(2)+1)/(2*sqrt(2)))...
    *exp(sqrt(2)*t_exacta)...
    +((sqrt(2)-1)/(2*sqrt(2)))...
    *exp(-sqrt(2)*t_exacta);

y_exacta = (1/(2*sqrt(2)))...
    *exp(sqrt(2)*t_exacta)...
    -(1/(2*sqrt(2)))...
    *exp(-sqrt(2)*t_exacta);

%% GRAFICA DE x(t)

figure

plot(t_exacta,x_exacta,'k','LineWidth',2)
hold on

plot(t,Y(1,:),'ro--','LineWidth',1.5)

grid on

xlabel('t')
ylabel('x(t)')

title('Componente x(t)')

legend('Exacta','Euler')

%% GRAFICA DE y(t)

figure

plot(t_exacta,y_exacta,'k','LineWidth',2)
hold on

plot(t,Y(2,:),'bs--','LineWidth',1.5)

grid on

xlabel('t')
ylabel('y(t)')

title('Componente y(t)')

legend('Exacta','Euler')

%% ERROR FINAL

error_x = abs(x_exacta(end)-Y(1,end));

error_y = abs(y_exacta(end)-Y(2,end));

disp('Error final en x')
disp(error_x)

disp('Error final en y')
disp(error_y)