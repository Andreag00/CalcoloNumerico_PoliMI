function [xk, k] = conjgrad_it(A, b, x0, nmax, toll)
% [xk, k] = conjgrad_it(A, b, x0, nmax, toll): Implementa il metodo del gradiente coniugato
%
% INPUT:
% A: matrice di sistema
% b: termine noto
% x0: guess iniziale sulla soluzione del sistema
% nmax: numero massimo di iterazioni
% toll: tolleranza richiesta
%
% OUTPUT:
% xk: matrice le cui colonne sono le soluzione di ogni iterazione
% k: numero di iterazioni usate per risolvere il sistema

x = x0;
r = b - A * x;
p = r;
xk = x0;
res_norm = norm(r) / norm(b);
k = 0;

while res_norm > toll && k < nmax
    k = k + 1;
    alpha = (p' * r) / (p' * A * p);
    x = x + alpha * p;
    r = r - alpha * A * p;
    beta = (p' * A * r) / (p' * A * p);
    p = r - beta * p;
    res_norm = norm(r) / norm(b);
    xk = [xk x];
end

end