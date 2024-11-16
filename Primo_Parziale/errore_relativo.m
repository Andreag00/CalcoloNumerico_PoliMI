function [stima] = errore_relativo(A,x,b)
% [stima] = errore_relativo(A,x,b): Restituisce la stima della sensitività dell'errore
% 
% A è la matrice del sistema lineare
% x è la soluzione del sistema ottenuta con un dato algoritmo
% b è il termine noto del sistema lineare
% 
% stima <= cond(A) * norm(b-A*x)/norm(b)

stima = cond(A) * norm(b - A * x) / norm(b);

end

