x = [0 1 2 3 4]';
y = [1 2 1 3 7]';

A = [ones(size(x)) x];
c = (A'*A)\(A'*y);

xx = linspace(0,4,100);
yy = c(1) + c(2)*xx;

plot(x,y,'o')
hold on
plot(xx,yy,'r')
legend('Datos','Ajuste')