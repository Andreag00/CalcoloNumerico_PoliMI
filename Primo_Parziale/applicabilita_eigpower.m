function [bool] = applicabilita_eigpower(A)
% [bool] = applicabilita_eigpower(A) Controlla se il metodo delle potenze è applicabile alla matrice data
% 
% A: matrice
%
% bool: 1 se applicabile, 0 se non applicabile

e = sort(eig(A),"descend");

if e(1) ~= e(2) && abs(e(1)) ~= abs(e(2))
    bool = 1;
    disp 'Si può applicare il metodo delle potenze'
else
    bool = 0;
    disp 'NON si può applicare il metodo delle potenze'
end
end

