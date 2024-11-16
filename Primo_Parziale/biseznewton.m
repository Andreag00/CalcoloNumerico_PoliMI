function [x_vect,k] = biseznewton(a,b,nmax_b,nmax_n,toll,f,df)
% [x_vect,k] = biseznewton(a,b,nmax_b,nmax_n,toll,f,df) Ricerca dello zero di f(x) nell'intervallo [a,b], utilizzando il metodo di bisezione per l'avvicinamento allo zero e successivamente il metodo di Newton
%
% Parametri di ingresso:
% a, b       Estremi intervallo di partenza
% nmax_b     Numero di iterazioni per il metodo di Bisezione
% nmax_n     Numero massimo di iterazioni per il metodo di Newton
% toll_n     Tolleranza sul test d'arresto il metodo di Newton
% f df   Macro contenenti la funzione e la sua derivata
%
% Parametri di uscita:
% x_vect      Vettore contenente tutte le iterate calcolate
%            (l'ultima componente e' la soluzione)
% k          Iterazioni totali (bisezione + Newton) effettuate

% Metodo di bisezione

toll_b = (b - a) / (2^(nmax_b + 1));
[x_vect_b, k_b] = bisez(a,b,toll_b,f);
x_vect = x_vect_b;

% Metodo di Newton
xv = x_vect(end);
[x_vect_n,k_n] = newton(xv,nmax_n,toll,f,df);
k = k_b + k_n;
x_vect = [x_vect; x_vect_n(2:end)];

end

