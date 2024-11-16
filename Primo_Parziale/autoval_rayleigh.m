function [lambda] = autoval_rayleigh(A,v)
% [lambda] = rayleigh(A,v): data matrice e autovettore calcola autovalore corrispondente usando quoziente di Rayleigh
%
% A: matrice
% v: autovettore
%
% lambda: autovalore corrispondente

lambda = (v' * A * v) / (v' * v);

end

