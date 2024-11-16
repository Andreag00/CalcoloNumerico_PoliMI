function [x_vect,k] = metodo_secanti(f,x0,q0,toll,nmax)
% [x_vect,k] = metodo_secanti(f,x0,q0,toll,nmax) Calcola la coordinata di uno zero usando il metodo delle secanti
%
% f: funzione di cui calcolare lo zero
% x0: guess iniziale
% q0: q iniziale
% toll: tolleranza sull'errore
% nmax: numero massimo di iterazioni
% 
% x_vect: vettore con tutti i valori di x calcolati per ogni iterazione
% k: iterazioni compiute
err = toll + 1;
x_vect = [];
k = 1;
q = q0;
x = x0;

while err > toll && k < nmax
    k = k + 1;
    x_old = x; % salvo valore x(k-1)
    fprintf('x_old = %d \n', x_old)
    fprintf('f(x) = %d', f(x))
    x = x - (f(x) / q); % calcolo x(k)
    fprintf('x_new = %d \n',x)
    q = (f(x) - f(x_old)) / (x - x_old); % aggiorno valore di q da usare in iterazione successiva
    fprintf('q = %d \n',q)
    x_vect = [x_vect x]; % aggiorno vettore soluzioni
    err = abs(x - x_old); % calcolo errore
end

end

