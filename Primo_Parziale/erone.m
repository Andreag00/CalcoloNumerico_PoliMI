function [rad] = erone(n,toll)
% [rad] = erone(n,toll): Calcola il valore approssimato della radice quadrata di n
%
% n: numero di cui calcolare radice quadrata approssimata
% toll: tolleranza sull'errore, se omessa è 1e-6
%
% rad: radice approssimata di n


r(1) = n;

if nargin == 1
    toll = 1e-6;
end

incr = toll + 1;

while incr > toll
    r(end+1) = 0.5 * (r(end) + n / r(end));
    incr = abs(r(end) - r(end-1));
end

rad = r(end);

end
