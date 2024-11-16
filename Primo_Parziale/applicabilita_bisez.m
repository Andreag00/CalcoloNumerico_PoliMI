function [bool] = applicabilita_bisez(a,b,f)
% [bool] = applicabilita_bisez(a,b,f) Verifica l'applicabilità del metodo di bisezione
%
% a, b: estremi
% f: funzione
%
% bool: 1 se applicabile, 0 se non applicabile
if f(a) * f(b) < 0
    fprintf('Si può applicare il metodo di bisezione con a = %f e b = %f\n\n', a,b); 
    bool = 1;
else
    fprintf('Non può applicare il metodo di bisezione con a = %f e b = %f\n\n', a,b);
    bool = 0;
end

end

