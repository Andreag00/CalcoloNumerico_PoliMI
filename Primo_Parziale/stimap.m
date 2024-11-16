function [p,c] = stimap(x_vect)
% [p,c] = stimap(x_vect): Stima ordine e fattore di abbattimento di un metodo iterativo
% 
% Utlizza le seguenti formule :
%          
%        | x_(k+1) - x_k |
%     ln ------------------
%        | x_k - x_(k-1) |            | x_(k+1) - x_k |
% p = --------------------------  c = ---------------------
%        | x_k - x_(k-1) |           | x_(k) - x_(k-1) |^p  
%     ln ----------------------
%        | x_(k-1) - x_(k-2) |
%
% Parametri di ingresso:
%
% x_vect: Vettore contenente tutte le iterate
%
% Parametri di uscita:
%
% p: Vettore contenente tutte le stime dell'ordine calcolate
% c: Vettore contenente tutte le stime del fattore di abbattimento dell'errore

it = max(size(x_vect));

for i = 3:it-1
  diff1 = abs(x_vect(i+1) - x_vect(i));
  diff2 = abs(x_vect(i) - x_vect(i-1));
  
  if (diff1 == 0 | diff2 == 0) 
    disp('Attenzione: due valori di xvect coincidenti');
    break;
  else
    num = log(abs(x_vect(i+1) - x_vect(i)) / abs(x_vect(i) - x_vect(i-1)));
    den = log(abs(x_vect(i) - x_vect(i-1)) / abs(x_vect(i-1) - x_vect(i-2)));
    p(i) = num / den;
    c(i) = abs(x_vect(i+1) - x_vect(i)) / (abs(x_vect(i) - x_vect(i-1))) ^ p(i);
  end

end

dim = max(size(p));
if (it > 3)
  fprintf('Ordine stimato       : %12.8f \n',p(dim) );
  fprintf('Fattore di riduzione : %12.8f \n',c(dim) );  
else
  disp('Numero di iterazioni insufficiente!')
end

end

% Spiegazione. 
%-------------
% Si ponga e_k = |x_k - alfa|. Se per un metodo numerico iterativo vale asintoticamente
% e_k+1 = c * (e_k)^p , si dice che il metodo ha ordine di convergenza p e fattore di convergenza c.

% Illustrazione della stima.
%---------------------------
% Si ha:  e_k+1/(e_k)^p = e_k /(e_k-1)^p, quindi e_k+1/e_k = (e_k / e_k-1)^p, quindi
% p= log_{e_k/e_k-1}(e_k+1/e_k) = ln(e_k+1/e_k)/ln(e_k/e_k-1).
% Quindi approssimo e_k con x_k+1 - x_k.
