function [alpha] = alpha_opt_richstaz(A,P)
% [alpha] = alpha_opt_richstaz(A,P): Calcola l'alpha ottimale per il metodo di Richardson stazionario
% A: matrice del sistema
% P: precondizionatore, se non viene passato si assume metodo non
% precondizionato
%
% alpha: alpha ottimale

if nargin == 1
    e = eig(A);
else
    e = eig(P \ A);
end

alpha = 2 / (max(abs(e)) + min(abs(e)));

end

