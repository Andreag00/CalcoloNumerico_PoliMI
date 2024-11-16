function [K] = sdpcond_eig(A)
% [K] = sdpcond_eig(A): Calcola il numero di condizionamento K(A) usando il comando eig di MATLAB, per massima precisione
% 
% A: matrice di cui calcolare K
%
% K: numero di condizionamento spettrale

[n,m] = size(A);

if n ~= m
    error 'La matrice non è simmetrica';
end

e = eig(A);

K = max(abs(e)) / min(abs(e));

end

