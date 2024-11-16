function [x_vect,k] = newton(x0,nmax,toll,f,df,mol)
% [x_vect,k] = newton(x0,nmax,toll,f,df,mol) Implementa il metodo di Newton per la ricerca degli zeri della funzione f(x).
%
% x0: Punto di partenza
% nmax: numero massimo di iterazioni
% toll: tolleranza sull'errore
% f: funzione
% df: derivata della funzione
% mol: se presente, si usa il metodo di Newton modificato
%
% x_vect: vettore delle iterate, ultimo componente è la soluzione
% k: iterate necessarie

if nargin == 5
    mol = 1;
end

err = toll + 1;
x_vect = [x0];
xv = x0;
k = 0;

while k < nmax && err > toll
    dfx = df(xv);
    if dfx == 0
        error 'Arresto per azzeramento della derivata'
    else
        xn = xv - mol * f(xv)/dfx;
        err = abs(xn - xv);
        x_vect = [x_vect; xn];
        k = k + 1;
        xv = xn;
    end
end

if k < nmax
    fprintf('Convergenza al passo: %d \n\n',k);
else
    fprintf('È stato raggiunto il numero massimo di passi: %d\n\n',k);
end

fprintf('Radice calcolata:\n   x = %-12.8f \n\n', x_vect(end));

end

