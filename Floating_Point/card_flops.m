function [card] = card_flops(beta,t,L,U)
% [card] = card_flops(beta,t,L,U): Calcola la cardinalità
%
% beta: base
% t: numero cifre significative
% L: valore minimo esponente
% U: valore massimo esponente
%
% card: cardinalità

card = 2 * (beta - 1) * (beta ^ (t - 1)) * (U - L + 1);
end

