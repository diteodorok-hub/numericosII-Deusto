% Función
f = @(x) exp(-x.^2);

% Intervalo
a = 0;
b = 1;

% Número de subintervalos
n = 100;

% Vector de puntos
x = linspace(a,b,n);
y = f(x);

% Integral numérica (trapecios)
I = trapz(x,y);

disp(I)

% ---- DIBUJO ----
figure
plot(x,y,'b','LineWidth',2)
hold on
area(x,y,'FaceAlpha',0.3)
grid on

% Punto donde colocamos el valor (visual)
x_text = 0.6;
y_text = 0.2;

% Círculo
plot(x_text,y_text,'ro','MarkerSize',10,'LineWidth',2)

% Texto con el valor de la integral
text(x_text+0.02, y_text, ...
    ['I \approx ', num2str(I,'%0.4f')], ...
    'FontSize',12,'Color','r')

title(['Integral numérica por trapecios, n = ', num2str(n)])
xlabel('x')
ylabel('f(x)')
