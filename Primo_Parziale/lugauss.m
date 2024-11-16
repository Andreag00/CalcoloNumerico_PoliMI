function [L,U] = lugauss(M)
% [L,U] = lugauss(A): calcola la fattorizzazione LU col metodo di Gauss
% 
% M: matrice quadrata da fattorizzare
% 
% L: matrice triangolare inferiore con tutti valori uguali a 1 sulla diagonale
% U: matrice triangolare superiore

n = size(M,1);

if n  ~= size(M,2)
    error 'La matrice non è quadrata'
end

L = eye(n);

for k = 1:n-1
    if M(k,k) == 0
        error 'Un elemento pivot è nullo'
    end
    for i = k+1:n
        L(i,k) = M(i,k) / M(k,k);
        for j = k+1:n
            M(i,j) = M(i,j) - L(i,k) * M(k,j);
        end
    end
end
U = triu(M);

end