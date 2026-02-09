%f = @(x) exp(-x.^2);
f = @(x) x.^2;
x = linspace(0,1,100);
y = f(x);

plot(x,y,'b','LineWidth',2)
hold on
area(x,y,'FaceAlpha',0.3)
grid on

title('Integral numérica = área aproximada')
