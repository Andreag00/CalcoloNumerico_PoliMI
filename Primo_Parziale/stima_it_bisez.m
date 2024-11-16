function [N] = stima_it_bisez(diff,toll)
% [N] = stima_it_bisez(diff,toll): Stima il numero minimo di iterazioni del metodo di bisezione. N è l'intero arrotondato per eccesso, se cifra intera aggiungere 1
%
% diff: b - a
% toll: tolleranza
%
% N: numero di iterazioni stimate


N_min = log2(diff / toll) - 1;
if floor(N_min) == N_min
    N = N_min + 1;
else
    N = ceil(N_min);
end

end

