function [N] = stima_it_richstaz(A,toll,P)
% [N] = stima_it_richstaz(A,toll,P): Stima il numero minimo di iterazioni necessarie per ridurre l'errore di un fattore dato col metodo di Richardson stazionario o del gradiente
% 
% A: matrice del sistema
% toll = 1/fatt_abb: tolleranza, inverso del fattore di abbattimento dell'errore
% P: precondizionatore, se non viene passato si assume metodo non precondizionato
%
% N: iterazioni minime richieste

if nargin == 2
    e = eig(A);
else
    e = eig(P \ A);
end

K = max(abs(e)) / min(abs(e));
d = (K-1) / (K+1);
syms k;
N = eval(solve(d^k == toll,k));

end

