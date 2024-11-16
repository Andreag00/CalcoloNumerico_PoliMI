function [x_vect,k,k_max] = bisez(a,b,toll,f)
% [x_vect,k,k_max] = bisez(a,b,toll,f) Implementa il metodo di bisezione per la risoluzione dell'equazione non lineare f(x)=0
%
% a,b: estremi intervallo di ricerca dello zero
% toll: tolleranza errore sul residuo
% f: funzione di cui cercare lo zero
%
% x_vect: vettore delle iterate
% k: numero delle iterazioni usate
% k_max: numero massimo di iterazioni ammissibili

k = -1;
x_vect = [];

err = toll + 1;

k_max = ceil(log2((b - a) / toll) - 1);

fprintf('Massimo numero di iterazioni ammissibili:\n   k_max = %-d \n', k_max);

if f(a) * f(b) > 0
    error 'La funzione deve avere segno diverso nei due estremi';
end

while k <= k_max - 1 && err > toll
    k = k + 1;
    x = (b + a) / 2;
    fc = f(x);

    if fc == 0
        err = 0;
    else
        err = abs(fc);
    end

    x_vect = [x_vect; x];

    if fc * f(a) > 0
        a = x;
    else
        b = x;
    end
end

if k == k_max
    fprintf('Massimo numero di iterazioni raggiunte!\nErrore sul residuo:\n   err = %-6.4e \n', err);
else
    fprintf('x_%-d soddisfa la tolleranza sul residuo \n', k);    
end
fprintf('Radice calcolata:\n   x = %-12.8f \n\n', x_vect(end));



end

