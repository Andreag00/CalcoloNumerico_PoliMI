function [I] = simpcomp(a,b,n,f)
% [I] = simpcomp(a,b,n,f):Implementa la formula di quadratura di Simpson composita. Per n = 1 formula semplice
%
% a,b: estremi di integrazione
% n: numero di sottointervalli
% f: funzione da integrare
%
% I: valore integrale

h = (b - a) / n;

x = a:h/2:b;

y = f(x);

I = (h / 6) * (y(1) + 2 * sum(y(3:2:2*n-1)) + 4 * sum(y(2:2:2*n)) + y(2*n+1));

end

