function [D,k,err] = qrbasic_shift(A,toll,nmax)
%  [D,k,err] = qrbasic(A,toll,nmax): Calcola gli autovalori di una matrice con il metodo delle iterazioni QR 
%  tutti gli autovalori della matrice A a meno di una tolleranza TOL ed 
%  in un numero massimo di iterazioni NMAX. La convergenza di questo metodo
%  non e' in generale garantita.

[n,m] = size(A);
if n ~= m
    error 'La matrice deve essere quadrata'
end

k = 0;
T = A;
mu = 0
err = max(max(abs(tril(T,-1))));

while k < nmax && err > toll
    k = k + 1;
    [Q,R] = qr(T-mu*eye(n));
    T = R * Q + mu *eye(n);
    mu = A(n,n);
    err = max(max(abs(tril(T,-1))));
end

if k > nmax
    fprintf('Il metodo delle iterazioni QR non converge nel massimo numero di iterazioni permesse')
else
    fprintf('Il metodo delle iterazioni QR converge in %d interazioni\n',k)
end

D = diag(T);

end



