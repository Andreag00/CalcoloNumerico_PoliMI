function [x_vect,k] = ptofis(x0,phi,nmax,toll,a,b)
% [x_vect,it] = ptofis(x0,phi,nmax,toll,a,b]) Metodo delle iterazioni di punto fisso, succ è spostato di uno in avanti x(2) = prima iterazione 
%
% --------Parametri di ingresso:
% x0      Punto di partenza
% phi     Funzione di punto fisso (definita inline o anonimous)
% nmax    Numero massimo di iterazioni
% toll    Tolleranza sul test d'arresto
% a b     Estremi dell'intervallo di esplorazione, SOLO PER OUTPUT GRAFICO
%
% --------Parametri di uscita:
% x_vect  Vett. contenente tutte le iterate calcolate
%         (l'ultima componente e' la soluzione)
% k       Iterazioni effettuate

if nargin == 6
    x = linspace(a,b,1000);
    plot(x,x,'g',x,phi(x),'b',x,zeros(size(x)),'k')
    hold on
end

x_vect = [];
x = x0;
x = phi(x);
x_vect = [x_vect; x];
err = toll + 1; 
k = 1;

if nargin == 6
    plot([x0 x0],[0 x],'r')
    plot([x0 x],[x x],'r')
end

if nargin == 6
    while (err >= toll && k < nmax)
        xold = x;
        x = phi(x);
        x_vect = [x_vect; x];
        plot([xold xold], [xold x], 'r')
        plot([xold x], [x x], 'r')
        err = abs(x - xold);
        k = k + 1;
    end
else
    while (err >= toll && k < nmax)
        xold = x;
        x = phi(x);
        x_vect = [x_vect; x];
        err = abs(x - xold);
        k = k + 1;
    end
end
if nargin == 6
    hold off
    axis([a,b,a,b])
end

if k < nmax %ovvero ho convergenza
    fprintf('\n Numero di Iterazioni : %d \n', k);
    fprintf(' Radice calcolata : %12.8f \n\n',x_vect(k+1));
else
    fprintf('\n Numero massimo di iterazioni raggiunto \n\n');
end

