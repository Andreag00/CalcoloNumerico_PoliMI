%% Es `1
clear
clc

syms U;
F = [2,3,-2,U];
x_max = 14;

solve(F(1) ^ U * (1 - F(1) ^ (-F(2))) == x_max,U)

%% Es 2

clear
clc

b = [];
a = [];
a(1) = 2500;
b(1) = 1;

for i = 1:4
    b(end + 1) = sqrt(a(end) * b(end));
    a(end + 1) = (a(end)+b(end - 1)) / 2;
end

S_4 = pi / 2 * a(1) / b(end)


%% Es 3

clear
clc

A = [0 3 -1;
     0 0 2;
     7 -1 2];

Q = [0 1 0;
     0 0 1;
     1 0 0];

b = [1 4 5]';

R = Q \ A; R(3,3)

y = Q' * b; y(1)

x = R \ y; x(1)

%% Es 4

clear
clc

syms g;

A = [5 -1 -1;
     0 4 -2;
     0 g 3];

T = tril(A);
B_gs = eye(3) - T \ A;
rho = max(abs(eig(B_gs)))

%% Es 5

clear
clc

syms g;

A = [3 -g 0;
     g 1 0;
     1 2 6];

e = eig(A) 
% devo controllare che gli autovalori siano uno maggiore dell'altro: e(3) è
% sempre maggiore di e(2). Devo controllare che e(2) sia maggiore di e(1)

%% Es 6

clear
clc
f = @(x) 8 / (1 + x.^2) - x;
df = derivata(f);

[x_vect] = biseznewton(-10,10,2,2,1e-6,f,df);
x_vect(end)

%% Es 7

clear
clc
f = @(x) exp(x) .* log((x - 5) / 2) .* (7 - x);
Df = derivata(f);

[x_vect] = newton(6.7,1000,1e-5,f,Df);

stimap(x_vect)

%% Es 8 HOW THE FUCK

clear
clc

f = @(x) exp(x/8) - 1;
df = derivata(f);
d2f = derivata(df);

%% Es 9 DA FARE

clear
clc

phi = @(x) x .* (x.^2 - 3 * x + 3);
x0 = 1.90;
[succ,k] = ptofis(x0,phi,1000,1e-6);
succ(4)
%% Es 10 DA FARE

clear
clc

syms g;

f = @(x) 0.5 * (x - g).^2;
alpha1 = g + 1 - sqrt(1 + 2*g);




%% %% %% ESERCIZIO %% %% %%

%% Punto 2

n = 100;

A = pentadiag(n,1,-8,14,-8,1);

simmpos(A);

%% Punto 3

it = stima_it_richstaz(A,10^3)

%% Punto 4

b = ones(n,1);
toll = 1e-3;
nmax = 1e5;

[x,k, res] = richardson(A,b,eye(n),b,toll,nmax);

x(1), k, res


%% Punto 5

P1 = tridiag(n,-1,2,-1);
P2 = tridiag(n,-2,5,-2);

K_1 = sdpcond(P1 \ A, 1e-6, 10000)
K_2 = sdpcond(P2 \ A, 1e-6, 10000)

K1 = sdpcond_vect(P1 \ A,ones(n,1),10000); K1(end)
K2 = sdpcond_vect(P2 \ A,ones(n,1),10000); K2(end)

K11 = sdpcond_eig(P1 \ A)
K22 = sdpcond_eig(P2 \ A)

%% Punto 7
clc

x0 = ones(n,1);

[lambda, x, k, lambda_vect] = eigpower_mod(A,P2);
lambda_vect(1), lambda_vect(2), lambda_vect(101)