function [bool] = simmpos(A)
% [bool] = simmpos(A): Controlla se una matrice è simmetrica positiva
%  A = matrice da controllare
%  BOOL assume i seguenti valori:
%  0 se la matrice non è simmetrica né definita positiva
%  1 se la matrice è simmetrica definita positiva
%  2 se la matrice è simmetrica non definita positiva

if (A == A')
    disp('La matrice è simmetrica')
    na = size(A, 1);
    for i = 1:na
        if (det(A(1:i,1:i))>0)
            if (i == na) 
                disp('La matrice è definita positiva')
                bool = 1;
            end
        else
            error('La matrice non è definita positiva')
            bool = 2;
        end   
    end
else
    disp('La matrice non è simmetrica')
    bool = 0;
end
end

