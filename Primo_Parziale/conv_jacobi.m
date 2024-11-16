function [bool, rho] = conv_jacobi(A)
% [bool, rho] = conv_jacobi(A): Determina se il metodo di Jacobi converge o meno
% bool assume i seguenti valori:
% 0 se il metodo di Jacobi non converge
% 1 se il metodo di jacobi converge
% rho è il raggio spettrale della matrice B_j


[n,m] = size(A);
if n ~= m
    error 'La matrice non è quadrata'
end

D = diag(diag(A));
B_j = eye(n) - D \ A;
rho = max(abs(eig(B_j)));

if rho < 1
    disp 'Il metodo di Jacobi converge'
    bool = 1;
else
    disp 'Il metodo di Jacobi non converge'
    bool = 0;
end

end

