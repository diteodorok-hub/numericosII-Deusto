x = [0 1 2];
y = [1 2 0];

xx = linspace(0,2,100);
yy = interp1(x,y,xx,'pchip'); % interpolación suave

plot(x,y,'ro','MarkerSize',8,'LineWidth',2)
hold on
plot(xx,yy,'b','LineWidth',2)
grid on

legend('Datos','Interpolación')
title('Interpolación a partir de datos discretos')
