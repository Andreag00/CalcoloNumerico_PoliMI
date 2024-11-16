function [x_vect,k] = sol_sist_nonlin(F,x0,nmax)
% [x_vect,k] = sol_sist_nonlin(F,x0,nmax,toll): Risolve sistemi di equazioni non lineari a bestemmie
%
% F: vettore colonna con le funzioni
% x0: vettore colonna guess iniziale
% nmax: numero massimo di iterazioni
%
% x_vect: vettore che contiene le soluzioni per ogni iterazione
% k: numero di iterazioni effettuate

k = 0;
s = size(F,1);
syms x [1 s]
x_vect = [];

J = jacobian(F(1:s),x(1:s));
x = subs(x0); x1 = x(1); x2 = x(2);

while k < nmax
    delta = subs(J \ -F);
    x(1:s) = x(1:s) + delta(1:s);
    x1 = x(1); x2 = x(2);
    k = k + 1;
    x_vect = [x_vect eval(x)];
end

end

