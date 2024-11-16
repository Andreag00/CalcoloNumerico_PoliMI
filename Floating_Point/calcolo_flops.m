function [x] = calcolo_flops(beta,s,e,mantissa)
% [x] = calcolo_flops(beta,s,e,mantissa): Calcola un numero floating point
%
% beta: base
% segno: 0 per pari, 1 per dispari
% e: esponente
% mantissa: vettore contenente 0/1 come nella mantissa

t = size(mantissa,2);
sum = 0;

for i = 1:t
    sum = sum + mantissa(i) * beta ^ (-i);
end

x = (-1)^s * beta^e * sum;

end