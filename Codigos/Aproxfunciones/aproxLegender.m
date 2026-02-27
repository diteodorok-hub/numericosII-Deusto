f = @(x) exp(x);

P0 = @(x) 1;
P1 = @(x) x;
P2 = @(x) 0.5*(3*x.^2-1);

a=-1; b=1;

c0 = integral(@(x) f(x).*P0(x),a,b)/2;
c1 = integral(@(x) f(x).*P1(x),a,b)/2;
c2 = integral(@(x) f(x).*P2(x),a,b)/(2/5);

xx = linspace(-1,1,200);
approx = c0 + c1*xx + c2*0.5*(3*xx.^2-1);

plot(xx,f(xx),'k')
hold on
plot(xx,approx,'r')
legend('f','Aprox Legendre')