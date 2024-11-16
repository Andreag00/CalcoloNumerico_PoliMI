function [] = molteplicita_zero(alpha,Df,D2f)
% [] = molteplicita_zero(alpha,Df,D2f) Verifica la molteplicità di uno zero
%
% alpha: coordinata x dello zero da verificare
% Df: derivata prima della funziona
% D2f: derivata seconda della funzione

if (round(Df(alpha)) == 0)
    if (round(D2f(alpha)) == 0)
        disp('La radice ha molteplicità maggiore di due')
    else
        disp('La radice ha molteplicità uguale a due => p = 1 per Newton')
    end
else
    disp('La radice ha molteplicità uguale ad uno => p = 2 per Newton')
end

end

