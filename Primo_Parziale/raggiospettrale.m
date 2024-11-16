function [rho] = raggiospettrale(A)
% [rho] = raggiospettrale(A) Calcola raggio spettrale di una matrice
%
% A = matrice di cui calcolare raggio spettrale
%
% rho = raggio spettrale della matrice
rho = max(abs(eig(A)));
end

