function [x] = fwsub(L,f)
% [x] = fwsub(L,f): Algoritmo di sostituzione in avanti
% 
% L: matrice quadrata triangolare inferiore
% f: termine noto
% 
% x: soluzione del sistema Lx=f

n = length(f);
a = size(L,1);
b = size(L,2);

if a ~= n || b ~= n || a ~= b
  error('ERRORE: dimensioni incompatibili')
elseif ~isequal(L,tril(L))
  error('ERRORE: matrice non triangolare inferiore')
elseif prod(diag(L))==0
  error('ERRORE: matrice singolare')
end

x = zeros(n,1);

x(1) = f(1) / L(1,1);

for i = 2:n
  x(i) = (f(i) - L(i,1:i-1) * x(1:i-1)) / L(i,i);
end


