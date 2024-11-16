function [I] = trapcomp(a,b,n,f)
% [I] = trapcomp(a,b,n,f): Implementa la formula del trapezio composita. Per n = 1 formula del trapezio semplice
%
% a,b: estremi di integrazione
% n: numero di sottointervalli
% f: funzione da integrare
%
% I: valore integrale
h = (b - a) / n;

x = a:h:b;

y = f(x);

I = h * (0.5 * (y(1) + y(n + 1)) + sum(y(2:n))); 

end

