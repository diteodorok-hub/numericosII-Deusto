% =====================================
% MÍNIMOS CUADRADOS
% =====================================

x = [0;1;2;3;4];
y = [1;2;1;3;7];

A = [ones(size(x)) x];

% --- Método 1: Ecuaciones normales ---
c_normal = (A'*A)\(A'*y);

% --- Método 2: QR ---
[Q,R] = qr(A,0);
c_qr = R \ (Q'*y);

% --- Método 3: SVD ---
[U,S,V] = svd(A,0);
c_svd = V * (S \ (U'*y));

disp('Solución ecuaciones normales:')
disp(c_normal)

disp('Solución QR:')
disp(c_qr)

disp('Solución SVD:')
disp(c_svd)

% Gráfica
xx = linspace(0,4,100)';
yy = c_qr(1) + c_qr(2)*xx;

figure
plot(x,y,'o','MarkerSize',8)
hold on
plot(xx,yy,'r','LineWidth',2)
legend('Datos','Ajuste')
title('Ajuste por mínimos cuadrados')