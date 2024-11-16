function [bool] = domdiagstrrig(A)
% [bool] = domdiagstrrig(A): Verifica se una matrice è a dominanza diagonale stretta per righe
%  A = matrice da verificare
%  bool assume i seguenti valori:
%  0 se la matrice non è a dominanzia diagonale stretta per righe
%  1 se la matrice è a dominanza diagonale stretta per righe

dA = diag(A);
nA = size(A,1);
for j = 1:nA
   r(j) = abs(dA(j)) - sum(abs(A(j, [1:j-1,j+1:nA])));
end

if (r > 0)
    disp('La matrice è a dominanza diagonale stretta per righe')
    bool = 1;
else
    disp('La matrice non è a dominanza diagonale stretta per righe')
    bool = 0;
end

end

