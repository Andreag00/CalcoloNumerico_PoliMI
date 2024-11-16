function [A] = pentadiag(n, dinf2,dinf1,dprinc,dsup1,dsup2)
% [A] = pentadiag(n, dinf2,dinf1,dprinc,dsup1,dsup2): Genera una matrice quadrata pentadiagonale
% 
% INPUT
% n: dimensioni della matrice
% dinf2: valore da inserire nella seconda sottodiagonale
% dinf1: valore da inserire nella prima sottodiagonale
% dprinc: valore da inserire nella diagonale principale
% dsup1: valore da inserire nella prima sovradiagonale
% dsup2: valore da inserire nella seconda sovradiagonale
% 
% OUTPUT:
% A: matrice quadrata pentadiagonale

if n < 3
    error 'La dimensione richiesta è troppo piccola'
end

A = diag(dinf2 * ones(n-2,1), -2) + diag(dinf1 * ones(n-1,1), -1) ...
    + diag(dprinc * ones(n,1)) + diag(dsup1 * ones(n-1,1), 1) ...
    + diag(dsup2 * ones(n-2,1), 2);
end

