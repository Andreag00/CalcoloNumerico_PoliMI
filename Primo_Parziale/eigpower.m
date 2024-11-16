function [lambda,x,k,err] = eigpower(A,toll,nmax,x0)
%   [lambda,x,k] = eigpower(A,toll,nmax,x0): Approssima l'autovalore di modulo massimo di una matrice.
%   LAMBDA = EIGPOWER(A,TOLL,NMAX,X0) calcola con il metodo delle
%   potenze l'autovalore di una matrice A di modulo
%   massimo a partire da un dato iniziale pari al
%   vettore unitario.
%   LAMBDA = EIGPOWER(A,TOL,NMAX,X0) arresta il metodo
%   quando la differenza  fra due iterate consecutive
%   e' minore di TOL (il valore di default e' 1.E-06)
%   o quando il massimo numero di iterazioni NMAX (il
%   valore di default e' 100) e' stato raggiunto.
%   [LAMBDA,X,ITER] = EIGPOWER(A,TOL,NMAX,X0)
%   restituisce anche l'autovettore unitario X tale
%   che A*X=LAMBDA*X ed il numero di iterazioni
%   effettuate per calcolare X.

[n,m] = size(A);

if n ~= m
    error 'La matrice non è quadrata'
end

if nargin == 1
   toll = 1.e-06;   x0 = ones(n,1);   nmax = 100;
end

k = 0;
y = x0 / norm(x0);
lambda = [y' * A * y];
err = [toll * abs(lambda) + 1];

while err(end) > toll && k < nmax && abs(lambda(end)) ~= 0
    k = k + 1;
    x = A * y;
    y = x / norm(x);
    lambda_new = y' * A * y;
    err = [err abs(lambda_new - lambda(end)) / abs(lambda_new)];
    lambda = [lambda lambda_new];
end

if (err(end) <= toll * abs(lambda(end)))
     fprintf('Il metodo delle potenze converge in %d iterazioni \n', k);
else
     fprintf('Il metodo delle potenze non converge in %d iterazioni. \n', k)
end

end

