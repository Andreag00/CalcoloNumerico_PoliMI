function [Df] = derivata(f)
% [Df] = derivata(f) Calcola la derivata di f(x)
%
% f: function handle in x
%
% Df: derivata function handle

syms x;
Df = eval(['@(x)' vectorize(char(diff(f(x))))]);

end

