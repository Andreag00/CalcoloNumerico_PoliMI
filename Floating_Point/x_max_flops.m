function [x] = x_max_flops(beta,t,U)
% [x] = x_max_flops(beta,t,U): Calcola x_min di un insieme di numeri floating point
%
% beta: base
% t: numero cifre significative
% U: valore massimo esponente
% 
% x: x_max

x = (beta ^ U) * (1 - beta ^ (-t));

end

