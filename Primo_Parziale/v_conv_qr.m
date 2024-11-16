function [V] = v_conv_qr(A, toll, nmax)
% [V] = v_conv_qr(A, toll, nmax) Calcola la velocità di convergenza del metodo delle iterazioni QR per calcolare gli autovalori di una matrice
%
% A: matrice
% toll: tolleranza sull'errore
% nmax: iterazioni massime
%
% V: velocità di convergenza, the lower the better


D = qrbasic(A, toll, nmax);

for i = 1:length(D) - 1
    v(i) = abs(D(i+1) / D(i));
end

V = max(v);

end

