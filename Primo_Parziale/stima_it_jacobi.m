function [N] = stima_it_jacobi(A,toll)
% [N] = stima_it_jacobi(A,toll) calcola una stima del numero minimo di iterazioni richieste perché il metodo di Jacobi converga
%
% A: Matrice sistema
% toll = 1/fatt_abb: tolleranza, inverso del fattore di abbattimento dell'errore
%
% N: Numero minimo iterazioni

[n,m] = size(A);

if n ~= m
    error 'La matrice non è quadrata'
end

D_inv = diag(1 ./ diag(A));
B_j = eye(n) - D_inv * A;
rho_j = max(abs(eig(B_j)));

N = log(toll) / log(rho_j);

end

