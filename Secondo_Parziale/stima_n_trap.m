function [n] = stima_n_trap(a,b,f,toll)
% [n] = stima_n_pmed(a,b,f,toll): stima il numero di sottointervalli necessari affinchè l'errore rispetti una tolleranza per il metodo del trapezio composito
%
% a,b: estremi di integrazione
% f: funzione da integrare
% toll: tolleranza sull'errore
%
% n: numero di nodi

syms x real;
d2f = derivata(derivata(f));

y = solve( (b - a) / 12 * ((b - a) / x) ^2 * max(abs(d2f(linspace(a,b,1000)))) == toll,x);

n = ceil(eval(y(2)));

end

