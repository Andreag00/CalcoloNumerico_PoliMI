function [s_max,s_min] = shift_finder(A,lambda)
% [s_max,s_min] = shift_finder(A,lambda): Calcola intervallo di shift usabile per usare potenze inverse con shift per matrici con autovalori reali
% 
% A: matrice
% lambda: autovalore di interesse
%
% s_max: valore massimo shift
% s_min: valore minimo shift

e = sort(eig(A),'ascend');
s = size(e,1);
i = 1;
if isreal(e)
    if lambda == e(1)
        s_max = (e(1) + e(2)) / 2;
        s_min = 0;
        fprintf("\nLo shift deve essere minore di %f\n", s_max);
    elseif lambda == e(end)
        s_min = (e(end) + e(end - 1)) / 2;
        s_max = 0;
        fprintf("\nLo shift deve essere maggiore di %f\n",s_min);
    else
        i = find(e == lambda);
        s_max = (e(i) + e(i - 1)) / 2;
        s_min = (e(i) + e(i + 1)) / 2;
        fprintf("\nLo shift deve essere compreso tra %f e %f\n",s_min,s_max)
    end
else
    error 'Autovalori complessi, risolvere lambda - s < sqrt[(Re(lambda_succ)-s)^2 + Im(lambda_succ)^2]'
end

end

