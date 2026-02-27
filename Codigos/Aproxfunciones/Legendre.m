n = 5;
alpha = zeros(n,1);
beta = zeros(n,1);

% Caso Legendre
for k=1:n
    alpha(k)=0;
    beta(k)=k^2/(4*k^2-1);
end

% Construcción por recurrencia
x = linspace(-1,1,200);
P = zeros(n,length(x));

P(1,:) = 1;
P(2,:) = x;

for k=2:n-1
    P(k+1,:) = (x - alpha(k)).*P(k,:) ...
               - beta(k).*P(k-1,:);
end

plot(x,P)
legend('P0','P1','P2','P3','P4')