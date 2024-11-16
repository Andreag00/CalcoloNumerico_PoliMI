function [f_abb] = fatt_abb_grad(A,k,P)
% [f_abb] = fatt_abb_grad(A,k,P): Calcola il fattore di abbattimento dell'errore del metodo del gradiente precondizionato
% 
% A: matrice del sistema
% P: precondizionatore, se non viene passato si assume gradiente non precondizionato
% k: passo a cui calcolare 
% 
% f_abb: fattore di abbattimento dell'errore calcolato

[n,m] = size(A);

if nargin == 2
    e = eig(A);
    P = eye(n);
else
    e = eig(P \ A);
end

[p,q] = size(P);

if n ~= m
    error 'La matrice A non è quadrata'
elseif p ~= q
    error 'Il precondizionatore non è quadrato'
end

Ksp = max(abs(e)) / min(abs(e));

f_abb = ((Ksp - 1) / (Ksp + 1)) ^ k;
end
