function [K_A] = sdpcond_vect(A,x0,nmax)
% [K_A] = sdpcond_vect(A,x0,nmax): Calcola il numero di condizionamento K(A) di una matrice simmetrica e definita positiva usando i metodi delle potenze e restituisce il vettore dei valori di K(A) per ogni iterata
%
% A: matrice di cui calcolare il numero di cond spettrale
% x0: guess iniziale
% nmax: numero massimo di iterazioni
%
% K_A: vettore dei numeri di condizionamento spettrale di A per ogni iterata

y_max = x0 / norm(x0);
y_min = y_max;
K_A = zeros(1,nmax);

for i = 1:nmax
    x_max = A * y_max;
    y_max = x_max / norm(x_max);
    x_min = A \ y_min;
    y_min = x_min / norm(x_min);
    K_A(i) = (y_max' * A * y_max) / (y_min' * A * y_min);
end

end

