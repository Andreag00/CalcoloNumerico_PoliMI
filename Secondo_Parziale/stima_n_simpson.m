function [n] = stima_n_simpson(a,b,f,toll)
% [n] = stima_n_pmed(a,b,f,toll): stima il numero di sottointervalli necessari affinchè l'errore rispetti una tolleranza per il metodo di Simpson composito
%
% a,b: estremi di integrazione
% f: funzione da integrare
% toll: tolleranza sull'errore
%
% n: numero di nodi

syms x real;
d4f = derivata(derivata(derivata(derivata(f))));

y = solve((b - a) / 2880 * ((b - a) / x) ^ 4 * max(abs(d4f(linspace(a,b,1000)))) == toll,x);

n = ceil(eval(y(2)));

end

