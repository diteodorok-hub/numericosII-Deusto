t=[0 1 2 3 4 5]';
P=[10 15 22 35 52 70]';
K=100;

Y=log(K./P -1);
A=[ones(size(t)) t];
c=(A'*A)\(A'*Y);

r=-c(2)
A0=exp(c(1));