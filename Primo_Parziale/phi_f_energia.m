function [phi] = phi_f_energia(A,y,b,P)
% [phi] = phi_f_energia(A,y,P): Funzione energia
%
% A: matrice
% y: vettore
% b: vettore
% P: Precondizionatore
%
% phi: funzione energia

if nargin == 3
    phi = 0.5 * y' * A * y - y' * b;
else
    phi = 0.5 * y' * (P \ A) * y - y' * (P \ A);
end

end

