function [I] = gausscomp(a,b,n,f)
% [I] = gausscomp(a,b,n,f): Implementa la formula di Gauss composita a due nodi
%
% a,b: estremi di integrazione
% n: numero di sottointervalli

h = (b - a) / n;

x = a:h:b;
x_m = a + h/2:h:b;

x_1 = x_m - h / (2 * sqrt(3));
y_1 = f(x_1);

I = h / 2 * sum(y_1);

x_2 = xm + h / (2 * sqrt(3));
y_2 = f(x_2);

I = I + h / 2 * sum(y_2);

end

