function [x_vect,B,k] = broyden(f,x0,B0,toll,nmax)
% [xk,B,it] = broyden(f,x0,B0,toll,nmax): Implementa l'algoritmo di Broyden
%
% f: funzione
% x0: guess iniziale
% B0: matrice B assegnata
% toll: tolleranza
% nmax: numero massimo di iterazioni
%
% x_vect: vettore con le soluzioni
% B: jacobiano approssimato
% k: iterazioni effettuate

err = toll + 1;
k = 0;
x = x0;
B = B0;
x_vect = x;

while(err > toll && k < nmax)
    deltax = B \ (-f(x));
    k = k + 1;
    x = x + deltax;
    x_vect = [x_vect,x];
    err = norm(deltax);
    B = B + 1/dot(deltax,deltax) * (f(x) - f(x - deltax) - B * deltax) * (deltax');
end

end