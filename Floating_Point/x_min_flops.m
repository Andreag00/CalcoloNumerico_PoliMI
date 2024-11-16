function [x] = x_min_flops(beta,L)
% [x] = x_min_flops(beta,L): Calcola x_min di un insieme di numeri floating point
%
% beta: base
% L: valore minimo esponente
%
% x: x_min

x = beta ^ (L - 1);
end

