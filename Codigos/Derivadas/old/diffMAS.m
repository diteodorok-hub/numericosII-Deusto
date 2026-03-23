clc
clear
close all

%% Funcion de prueba
f  = @(x) sin(x);
df = @(x) cos(x);

%% Punto donde derivamos
x0 = 1;

%% Paso
h = 0.1;

%% Valor exacto
df_exact = df(x0);

%% ===============================
%% DERIVADA ORDEN O(h^2) (3 puntos adelante)
%% f'(x) ≈ (-3f(x)+4f(x+h)-f(x+2h))/(2h)
%% ===============================

df_h2 = (-3*f(x0) + 4*f(x0+h) - f(x0+2*h))/(2*h);

%% ===============================
%% DERIVADA ORDEN O(h^4) (5 puntos adelante)
%% f'(x) ≈ (-25f(x)+48f(x+h)-36f(x+2h)+16f(x+3h)-3f(x+4h))/(12h)
%% ===============================

df_h4 = (-25*f(x0) + 48*f(x0+h) - 36*f(x0+2*h) + ...
          16*f(x0+3*h) - 3*f(x0+4*h))/(12*h);

%% ===============================
%% ERRORES
%% ===============================

error_h2 = abs(df_h2 - df_exact);
error_h4 = abs(df_h4 - df_exact);

%% ===============================
%% TABLA RESUMEN
%% ===============================

tabla = table(x0,h,df_exact,df_h2,error_h2,df_h4,error_h4)

disp(' ')
disp('Tabla resumen')
disp(tabla)

%% ===============================
%% GRAFICA FUNCION
%% ===============================

x = linspace(x0-1,x0+1,200);
y = f(x);

%% ===============================
%% GRAFICA ORDEN 2
%% ===============================

figure

plot(x,y,'LineWidth',2)
hold on

pts = [x0 x0+h x0+2*h];
plot(pts,f(pts),'ro','MarkerSize',8,'LineWidth',2)

title('Derivada numerica Orden O(h^2)')
xlabel('x')
ylabel('f(x)')
grid on

text(x0,f(x0),'  x0')
text(x0+h,f(x0+h),'  x0+h')
text(x0+2*h,f(x0+2*h),'  x0+2h')

legend('f(x)','puntos evaluados')

%% ===============================
%% GRAFICA ORDEN 4
%% ===============================

figure

plot(x,y,'LineWidth',2)
hold on

pts = [x0 x0+h x0+2*h x0+3*h x0+4*h];
plot(pts,f(pts),'ro','MarkerSize',8,'LineWidth',2)

title('Derivada numerica Orden O(h^4)')
xlabel('x')
ylabel('f(x)')
grid on

text(x0,f(x0),'  x0')
text(x0+h,f(x0+h),'  x0+h')
text(x0+2*h,f(x0+2*h),'  x0+2h')
text(x0+3*h,f(x0+3*h),'  x0+3h')
text(x0+4*h,f(x0+4*h),'  x0+4h')

legend('f(x)','puntos evaluados')

%% ===============================
%% MOSTRAR RESULTADOS
%% ===============================

fprintf('\nRESULTADOS\n')
fprintf('---------------------------\n')
fprintf('Derivada exacta     = %.10f\n',df_exact)
fprintf('Orden O(h^2)        = %.10f\n',df_h2)
fprintf('Error O(h^2)        = %.2e\n',error_h2)
fprintf('\n')
fprintf('Orden O(h^4)        = %.10f\n',df_h4)
fprintf('Error O(h^4)        = %.2e\n',error_h4)
fprintf('Paso utilizado h    = %.4f\n',h)