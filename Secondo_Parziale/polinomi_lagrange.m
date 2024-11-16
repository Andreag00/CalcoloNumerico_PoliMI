function [PP_dis,err_dis,err_max] = polinomi_lagrange(n,a,b,f)
% [PP_dis,err_dis,err_max] = polinomi_lagrange(n,a,b,f): Calcola polinomi di Lagrange per estremi dati e funzione data
%
% n: vettore contenente i gradi dei polinomi di Lagrange da calcolare
% a, b: estremi
% f: funzione da approssimare
%
% PP_dis:
% err_dis: errore di interpolazione per ogni nodo
% err_max: norma infinito dell'errore
PP_dis = [];
err_dis = [];
err_max = [];
x = linspace(a,b,1000);
f_dis = f(x);

for i = n
    h = (b - a) / i;
    x_nod = [a:h:b];
    f_nod = f(x_nod);

    P = polyfit(x_nod, f_nod, i);
    P_dis = polyval(P, x);
    
    PP_dis = [PP_dis; P_dis];
    
    err_dis = [err_dis; abs(P_dis - f_dis)];
    err_max = [err_max; max(abs(P_dis - f_dis))];
end