function [bool] = domdiagstrcol(A)
% [bool] = domdiagstrcol(A): Verifica se una matrice è a dominanza diagonale stretta per colonne
%  A = matrice da verificare
%  bool assume i seguenti valori:
%  0 se la matrice non è a dominanzia diagonale stretta per colonne
%  1 se la matrice è a dominanza diagonale stretta per colonne

dA = diag(A);
nA = size(A,1);
for j = 1:nA
   r(j) = abs(dA(j)) - sum(abs(A([1:j-1,j+1:nA], j)));
end
if (r > 0)
    disp('La matrice è a dominanza diagonale stretta per colonne')
    bool = 1;
else
    disp('La matrice non è a dominanza diagonale stretta per colonne')
    bool = 0;
end
end

