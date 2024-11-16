function [x_vect] = metodo_corde(f,a,b,x0,nmax)
% [x_vect] = metodo_corde(f,a,b,x0,nmax)
%
% f: funzione
% a: estremo 1
% b: estremo 2
% x0: guess iniziale
% nmax: numero massimo iterazioni
%
% x_vect: vettore soluzioni

k = 1;
x = x0;
qc = (f(b) - f(a)) / (b - a);
x_vect = [];

while k < nmax  
    x = x - f(x) / qc;
    x_vect = [x_vect x];
    k = k + 1;
    err = abs(x - x_vect(end));
end

end

