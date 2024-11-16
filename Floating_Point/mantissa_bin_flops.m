function [mantissa,e,t] = mantissa_bin_flops(num)
% [mantissa,e,t] = mantissa_bin_flops(num): Calcola la mantissa in base 2 di un numero decimale
%
% num: numero da convertire
% 
% mantissa: vettore contenente la mantissa
% e: esponente della base
% t: cifre significative

dec_str = dec2bin(floor(num));
dec_num = str2num(dec_str);
decpart = num2str(dec_num) - '0';

num = num - floor(num);
n = -1;
floatpart = [];

while num ~= 0 || num > eps
    if num - 2^n < 0 
        floatpart = [floatpart 0];
    else
        floatpart = [floatpart 1];
        num = num - 2^n;
    end
    n = n - 1;
end

mantissa = [decpart floatpart];
e = size(decpart,2);
t = e + size(floatpart,2);

end

