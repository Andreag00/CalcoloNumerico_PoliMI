function [x] = lusol(A,b,per_righe,per_colonne)
% [x] = lusol(A,b,per_righe,per_colonne): Risolve il sistema lineare Ax = b con la fattorizzazione LU
% x = lusol(A,b,0,0) risolve il sistema senza permutazioni
% x = lusol(A,b,1,0) risolve il sistema con permutazione per righe
% x = lusol(A,b,1,1) risolve il sistema con permutazione per righe e colonne

if per_colonne == 1 && issparse(A) == 1
    [L,U,P,Q] = lu(A);
    y0 = fwsub(L,P * b);
    x0 = bksub(U,y0);
    x = Q * x0;
    disp 'Risolto con permutazione per righe e colonne'
elseif per_colonne == 1 && issparse(A) == 0
    A = sparse(A);
    [L,U,P,Q] = lu(A);
    y0 = fwsub(L,P * b);
    x0 = bksub(U,y0);
    x = Q * x0;
elseif per_righe == 1
    [L,U,P] = lu(A);
    y = fwsub(L, P * b);
    x = bksub(U, y);
    disp 'Risolto con permutazione per righe'
else
    [L,U] = lu(A);
    y = fwsub(L,b);
    x = bksub(U,y);
    disp 'Risolto senza permutazione'
end

end

     