function [] = err_arr_flops(beta,t)
% [] = err_arr_flops(beta,t): Calcola errore di arrotondamento
%
% beta: base
% t: numero cifre significative

fprintf("\nL'errore di arrotondamento |x-fl(x)|/|x| è minore o uguale a %d\n\n",0.5*epsilon_flops(beta,t))

end

