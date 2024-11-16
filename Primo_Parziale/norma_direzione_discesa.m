function [d,norm_d] = norma_direzione_discesa(A,b,y)
% [d,norm_d] = norma_direzione_discesa(A,b,y): Calcola direzione e norma della direazione di discesa della funzione energia
% 
% A: matrice
% b: vettore termini noti
% y: punto di interesse
%
% d: direzione di discesa (vettore)
% norm_d: norma vettore direzione di discesa

d = b - A * y;
norm_d = norm(d);

end

