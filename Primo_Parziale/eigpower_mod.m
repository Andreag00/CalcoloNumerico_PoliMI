function [lambda,x,k,lambda_vect] = eigpower_mod(A,P,toll,nmax,x0)
%   [lambda,x,k] = eigpower(A,P,toll,nmax,x0): Approssima l'autovalore di modulo massimo di una matrice precondizionata.
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

if nargin == 2
   toll = 1.e-06;   x0 = ones(n,1);   nmax = 100;
end


k = 0;
y = x0 / norm(x0);
lambda = (y' * A * y) / (y' * P * y);
err = toll * abs(lambda) + 1;
lambda_vect = [lambda];

while err > toll && k < nmax && abs(lambda) ~= 0
    k = k + 1;
    x = P \ A * y;
    y = x / norm(x);
    lambda_new = (y' * A * y) / ( y' * P * y);
    err = abs(lambda_new - lambda) / abs(lambda_new);
    lambda = lambda_new;
    lambda_vect = [lambda_vect lambda];
end

if (err <= toll * abs(lambda))
     fprintf('Il metodo delle potenze precondizionato converge in %d iterazioni \n', k);
else
     fprintf('Il metodo delle potenze precondizionato non converge in %d iterazioni. \n', k)
end

end
