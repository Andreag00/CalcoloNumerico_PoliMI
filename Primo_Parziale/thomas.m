function [L,U,x] = thomas(A,b)
% [L, U, x] = thomas (A, b): Calcola la fattorizzazione di Thomas della matrice A e risolve il sistema Ax = b
% 
% Parametri in ingresso:
%   - A: matrice tridiagonale quadrata
%   - b: vettore dei termini noti
% 
% Parametri in uscita:
%   - L: la matrice triangolare inferiore della fattorizzazione LU di A
%   - U: la matrice triangolare superiore della fattorizzazione LU di A
%   - x: la soluzione del sistema Ax = b

n = size(A,1);

a = diag(A);
c = diag(A,1);
e = diag(A,-1);

alpha = zeros(n,1);
delta = zeros(n-1,1);

alpha(1) = a(1);

for i = 2:n
    delta(i-1) = e(i-1) / alpha(i-1);
    alpha(i) = a(i) - delta(i-1) * c(i-1);    
end

L = diag(ones(n,1)) + diag(delta,-1);
U = diag(alpha) + diag(c,1);

y = zeros(n,1);
y(1) = b(1);

for i = 2:n
    y(i) = b(i) - delta(i-1) * y(i-1);
end

x = zeros(n,1);
x(end) = y(end) / alpha(end);

for i = n-1:-1:1
    x(i) = (y(i) - c(i) * x(i+1)) / alpha(i);
end

end

