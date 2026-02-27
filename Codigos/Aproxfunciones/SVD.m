% =====================================
% DESCOMPOSICIÓN SVD
% =====================================

A = [1 1;
     1 2;
     1 3;
     1 4];

[U,S,V] = svd(A,0);

disp('Matriz U:')
disp(U)

disp('Matriz S (valores singulares):')
disp(S)

disp('Matriz V:')
disp(V)

% Verificación: A = U*S*V'
disp('Error ||A - U*S*V''||:')
disp(norm(A - U*S*V'))