%% T1
clear
clc
close all

syms t
eval(solve(2^(1-t)==1e-8,t))
% 28


%% T2

% Richiede 7 operazioni perché il cubo sono due moltiplicazioni

%% T3
clear
clc

n = 80;
ops = n^2*10

%% T4
clear
clc

A = [10 -1 0;
     2 4 1;
     0 3 5];

P = [1 0 0;
     0 0 1;
     0 1 0];

b = [1 2 3]';

[L,U] = lugauss(A);

y = fwsub(L,P*b)

%% T5
clear
clc

A = [6 -1 0;
     -1 4 -1;
     0 -1 2];

[lambda,x,k] = eigpower(A,1e-6,1000,ones(3,1));

lambda(1), lambda(4)

%% T6
clear
clc

A = [-4 0 0;
     0 2 (sqrt(10)-1);
     0 -(sqrt(10)+1) 2];
eig(A)
% Da fare a mano

%% T7
clear
clc

f = @(x) log(x/3) .* sin(pi*x);
Df = derivata(f);
D2f = derivata(Df);

molteplicita_zero(3,Df,D2f);

%% T8
clear
clc

f = @(x) exp(x) - 2;
a = 0; b = 2; x0 = 2;

[x_vect] = metodo_corde(f,a,b,x0,3)

%% T9
clear
clc

phi = @(x) cos(x);

[x_vect,it] = ptofis(0.9,phi,3,1e-6);
x_vect(end)

%% T10

syms g

% Controllare se fattibile con syms


%% Es 1.1
A = pentadiag(100,1,-11,20,-11,1);
x = 2 * ones(100,1);

b = A * x;

simmpos(A)

sdpcond_eig(A)

%% Es 1.2

[phi] = phi_f_energia(A,x,b)

y = ones(100,1);

res = norm(b - A*y)

%% Es 1.3

iterazioni = stima_it_richstaz(A,10^-3)

[xk,k] = conjgrad_it(A,b,b,1000,1e-3);
x = xk(end);

den = b - x;
norma = norma_A(A,den);
num = norma * 1e-3

%% Es 1.4

[x,k,res_norm] = richardson(A,b,eye(100),b,1e-3,1e5);
x(1), k, res_norm

%% Es 1.5




