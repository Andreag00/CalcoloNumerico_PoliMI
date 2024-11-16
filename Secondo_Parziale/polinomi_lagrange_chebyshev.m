function [PP_dis,err_dis,err_max] = polinomi_lagrange_chebyshev(n,a,b,f)
% [PP_dis,err_dis,err_max] = polinomi_lagrange_chebyshev(n,a,b,f): Polinomi di Lagrange con nodi di Chebyshev
%
% n: vettore gradi
% a,b: estremi
% f: funzione
%
% PP_dis: coefficienti polinomi (?)
% err_dis: errore tra funzione e polinomi
% err_max: norma infinito errore


x = linspace(a,b,1000);
f_dis = f(x);

PP_dis = [];
err_max = [];
err_dis = [];

for i = n
    k = 0:i;
    t = -cos(pi * k / i);
    x_nod = (b - a) / 2 * t + (a + b) / 2;
    f_nod = f(x_nod);
    
    P = polyfit(x_nod,f_nod,i);
    poly_dis = polyval(P,x);
    
    PP_dis = [PP_dis; poly_dis];
    
    err_dis = [err_dis; abs(poly_dis - f_dis)];
    err_max = [err_max; max(abs(poly_dis - f_dis))];
end

end

