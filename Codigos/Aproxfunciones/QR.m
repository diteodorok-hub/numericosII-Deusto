% =====================================
% DESCOMPOSICIÓN QR
% =====================================

A = [1 1;
     1 2;
     1 3;
     1 4];

% Factorización QR reducida
[Q,R] = qr(A,0);

disp('Matriz A:')
disp(A)

disp('Matriz Q:')
disp(Q)

disp('Matriz R:')
disp(R)

% Verificación: A = Q*R
disp('Error ||A - Q*R||:')
disp(norm(A - Q*R))