function [bool, rho] = conv_gs(A)
% [bool, rho] = conv_gs(A): Determina se il metodo di Gauss-Seidel converge o meno
% bool assume i seguenti valori:
% 0 se il metodo di Gauss-Siedel non converge
% 1 se il metodo di Gauss-Siedel converge
% rho è il raggio spettrale della matrice B_gs

[n,m] = size(A);
if n ~= m
    error 'La matrice non è quadrata'
end

T = tril(A);
B_gs = eye(n) - T \ A;
rho = max(abs(eig(B_gs)));

if simmpos(A) == 1 || rho < 1 
    disp 'Il metodo di Gauss-Seidel converge'
    bool = 1;
elseif domdiagstrrig(A) == 1 && rho < 1
    disp 'Il metodo di Gauss-Seidel converge'
    bool = 1;
else
    disp 'Il metodo di Gauss-Seidel non converge'
    bool = 0;
end
end

