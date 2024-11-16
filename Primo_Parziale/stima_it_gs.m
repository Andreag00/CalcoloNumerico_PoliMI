function [N] = stima_it_gs(A,toll)
% [N] = stima_it_gs(A,toll) calcola una stima del numero minimo di iterazioni richieste perché il metodo di Gauss-Seidel converga
%
% A: Matrice sistema
% toll = 1/fatt_abb: tolleranza, inverso del fattore di abbattimento dell'errore
%
% N: Numero minimo iterazioni

[n,m] = size(A);

if n ~= m
    error 'La matrice non è quadrata'
end

T = tril(A);
B_gs = eye(n) - T \ A;
rho_gs = max(abs(eig(B_gs)));

N = log(toll) / log(rho_gs);

end

