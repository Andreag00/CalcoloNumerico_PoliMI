function [I] = pmedcomp(a,b,n,f)
% [I] = pmedcomp(a,b,n,f): Implementa la formula di quadratura del punto medio composita su intervalli equispaziati. Per n = 1 formula di integrazione semplice
%
% a,b: estremi dell'integrale
% n: numero di sottointervalli
% f: funzione da integrare
%
% I: valore dell'integrale

h = (b - a) / n;

x = a + h / 2:h:b - h / 2;

I = h * sum(f(x));

end

