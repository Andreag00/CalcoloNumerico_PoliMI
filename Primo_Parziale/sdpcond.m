function [K] = sdpcond(A,x0,toll,nmax)
% [K] = sdpcond(A,toll,nmax): Calcola il numero di condizionamento K(A) di una matrice simmetrica e definita positiva usando i metodi delle potenze e riporta solo il valore finale di K(A)
%
% Differisce da KA_metodopotenze perché quest'ultima restituisce un vettore
% di tutti i K(A) ottenuti durante l'esecuzione se l'esercizio chiede K(A)
% a una determinata iterazione

[n,m] = size(A);

if n ~= m
    error 'La matrice non è simmetrica';
end

if nargin == 1
    toll = 1e-6;
    nmax = 1000;
    x0 = ones(n,1)
elseif nargin == 2
    toll = 1e-6;
    nmax = 1000;
end

simmpos(A);

lambda_max = eigpower(A,toll,nmax,x0);
lambda_min = invpower(A,toll,nmax,x0);

K = lambda_max / lambda_min;

end

