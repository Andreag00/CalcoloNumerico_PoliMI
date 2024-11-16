function [] = plot_zero(f,x,num,name)
% [] = plot_zero(f,x) Effettua il plot di una funziona evidenziando la linea dello zero
%
% f: funzione da plottare
% x: linspace su cui plottare
% num: indicare numeri diversi per generare plot diversi per ogni funzione
% name: nome della funzione da plottare

if nargin == 3
    name = 'f(x)';
elseif nargin == 2
    name = 'f(x)';
    num = 1;
end

figure(num)
plot(x,f(x));
title (name)
xlabel 'x'
ylabel (name)
legend (name)

n = size(x,2);
y0 = zeros(n,1);
hold on
plot(x,y0);
grid on

end

