function [norm] = norma_A(A,x)
% norm] = norma_A(A,x): Calcola norma A (energia) di A e x
%
% A: matrice
% x: vettore
%
% norm: norma A del vettore

norm = sqrt(x' * A * x);

end

