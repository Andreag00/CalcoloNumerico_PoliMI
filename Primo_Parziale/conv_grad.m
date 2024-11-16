function [bool] = conv_grad(A,P)
%[bool] = conv_grad(A,P): Verifica la convergenze dei metodi del gradiente (coniugato e non coniugato)
%
% A: matrice del sistema
% P: precondizionatore, se non viene passato si assume gradiente non precondizionato
% bool: valori attesi
% 0 se i metodi del gradiente non convergono
% 1 se i metori del gradiente convergono

if nargin == 1
    if simmpos(A) == 1
        disp 'I metodi del gradiente (coniugato e non coniugato) non precondizionati convergono'
        bool = 1;
    else
        disp 'I metodi del gradiente (coniugato e non coniugato) non precondizionati NON convergono'
        bool = 0;
    end
else
    if simmpos(A) == 1 && simmpos(P) == 1
        disp 'I metodi del gradiente (coniugato e non coniugato) precondizionati convergono'
        bool = 1;
    else
        disp 'I metodi del gradiente (coniugato e non coniugato) precondizionati NON convergono'
        bool = 0;
    end
end

end

