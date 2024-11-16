%% T1

%% T2
clear
close all
clc

A = [4 2 -8;
     2 1 8;
     2 0 1];

b = [1 2 8]';
[L,U,P] = lu(A);
y = fwsub(L, P * b);

L(2,1), U(3,3), y(2)

%% T3
clear
close all
clc

n = 3;

A = diag([8 5 2]) + diag(-1 * ones(n-1,1),1) + diag(-1 * ones(n-1,1),-1);
b = ones(n,1);
P = diag([6 5 4]);
x0 = zeros(n,1);
alpha = alpha_opt_richstaz(A,P);


[x,k] = richardson_it(A,b,P,x0,1e-6,1000,alpha);

x(1:n,5)

%% T4
clear
close all
clc

syms g;

A(g) = [8 -5 g;
        -5 12 3;
        g 3 8];

solve(det(A) == 0, g)

%% T5
clear
close all
clc

A = [10 -2;
     -2 8];

v = [-1 1]';

autoval_rayleigh(A,v)

%% T6
clear
close all
clc

A = [2.05 1 -1.05;
     1 2 -1;
     -1.05 -1 2.05];

qrbasic(A,1e-2,100)

%% T7
clear
close all
clc

% Il metodo di Newton ha ordine di convergenza 1 perché lo zero in alpha ha
% molteplicità 2, per questo può convergere solo linearmente (ordine 1).

%% T8
clear
close all
clc

phi = @(x) x - 0.5 * (exp(2*(x-1)) - 1);
alpha = 1;

Dphi = derivata(phi);
%Poiché per convergere il valore assoluto di Dphi deve essere minore di
%uno, bisogna trovare il valore per cui abs(Dphi) == 1 e sarà il limite
%massimo di b
syms x;
dphi = abs(1 - exp(2*x - 2));


solve(dphi == 1,x)

%% T9
clear
close all
clc

f = @(x) log((x - 3) ./ 4);
x0 = 6;
q0 = 4;
toll = 1e-6;
nmax = 4;
[x_vect,k] = metodo_secanti(f,x0,q0,toll,nmax)

%% T10
clear
close all
clc

% Verifico che in un intervallo attorno a 4 la funzione non cambi segno
f = @(x) (x-4).^2;
x = linspace(2,6,1000);
plot(x,f(x))

%% Es 1
clear
close
clc

n = 100;
A = diag(1:100) + diag(-1 * ones(n-1,1),-1) + diag(-2 * ones(n-1,1),1) + diag(10 * ones(n-2,1),2);
b = ones(n,1);

%% P1
[bool,rho] =  conv_gs(A)

%% P2
[x, k, res_norm] = gs(A,b,b,1e-4,1000)

%% P3
cond(A)
errore_relativo(A,x,b)

%% P4
D = diag(diag(A));
E = -(tril(A) - D);
F = -(triu(A) - D); 

  