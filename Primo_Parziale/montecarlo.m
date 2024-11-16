function [res] = montecarlo(n)
% [res] = montecarlo(n): Implementa il metodo di Monte Carlo per il calcolo approssimato di pi
%   res = pi approssimato
%   n = iterazioni
m = 0;
for i = 1:n
    v = [rand(1),rand(1)];
    if norm(v)<=1
        m = m + 1;
    end
end

res = 4*m/n;
end

