function [lambda,x,k] = invpowershift(A,s,toll,nmax,x0)
%   [lambda,x,k] = invpowershift(A,s,toll,nmax,x0): Approssima l'autovalore di una matrice piu' vicino al numero (complesso) s
%   LAMBDA = INVPOWERSHIFT(A,S,TOLL,NMAX,X0) calcola con il metodo delle
%   potenze inverse con shift l'autovalore di una matrice A 
%   piu vicino a s a partire da un dato iniziale pari
%   al vettore unitario.
%   LAMBDA = INVPOWERSHIFT(A,S,TOLL,NMAX,X0) arresta il metodo
%   quando la differenza  fra due iterate consecutive
%   e' minore di TOL (il valore di default e' 1.E-06)
%   o quando il massimo numero di iterazioni NMAX (il
%   valore di default e' 100) e' stato raggiunto.
%   [LAMBDA,X,ITER] = INVPOWERSHIFT(A,S,TOLL,NMAX,X0)
%   restituisce anche l'autovettore unitario X tale
%   che A*X=LAMBDA*X ed il numero di iterazioni
%   effettuate per calcolare X.

[n,m] = size(A);
if n ~= m 
    error 'La matrice non è quadrata'
end

if nargin == 2
    toll = 1e-6; nmax = 100; x0 = ones(n,1);
end

k = 0;
M = A - s * eye(n);
[L,U,P] = lu(M);

y = x0 / norm(x0);
lambda = y' * A * y;
err = toll * abs(lambda) + 1;

while err > toll && k < nmax && abs(lambda) ~= 0
    k = k + 1;
    z = fwsub(L,P*y);
    x = bksub(U,z);
    y = x / norm(x);
    lambda_new = y' * A * y;
    err = abs(lambda_new - lambda) / abs(lambda_new);
    lambda = lambda_new;
end

if (err <= toll * abs(lambda))
     fprintf('Il metodo delle potenze inverse con shift converge in %d iterazioni \n', k);
else
     fprintf('Il metodo delle potenze inverse con shift non converge in %d iterazioni. \n', k)
end

end

