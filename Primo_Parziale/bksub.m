function [x] = bksub(U,f)
% [x] = bksub(U,f): Algoritmo di sostituzione all'indietro
% 
% U: matrice quadrata triangolare superiore
% f: termine noto
% 
% x: soluzione del sistema Ax=b

n = length(f);
a = size(U,1);
b = size(U,2);

if a ~= n || b ~= n || a ~= b
  error('Dimensioni incompatibili')
elseif ~isequal(U,triu(U))
  error('La matrice non è triangolare superiore')
elseif prod(diag(U))==0
  error('La matrice è singolare')
end

x = zeros(n,1);

x(end) = f(end) / U(n,n);

for i = n-1:-1:1
   x(i) = (f(i) - U(i,i+1:n) * x(i+1:n)) / U(i,i);
end

