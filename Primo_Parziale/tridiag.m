function [A] = tridiag(n,dinf,dprinc,dsup)
% [A] = tridiag(n, dinf, dprinc, dsup): Crea una matrice tridiagonale
% 
% n: dimensione matrice quadrata
% dinf: valore da porre sulla diagonale sotto la principale (-1)
% dprinc: valore da porre sulla diagonale principale
% dsup: valore da porre sulla diagolane sopra la principale (+1)
%
% A: matrice generata

A = diag(dprinc * ones(n,1)) + diag(dinf * ones(n-1,1), -1) + diag(dsup * ones(n-1,1), 1);

end

