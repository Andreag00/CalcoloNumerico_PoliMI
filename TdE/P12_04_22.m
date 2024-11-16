clear all
clc

A = pentadiag(100,1,-11,20,-11,1);

[c_gs, rho_gs] = conv_gs(A)
[c_j,rho_j] = conv_jacobi(A)

%%

clear all
clc

n = 7;
A = hilb(n);
b = 5 * ones(n,1);

x = A\b;

errore_relativo(A,x,b)

%% Es T2
clear all
clc

n = 90;
k = 0:n;

S = 4*sum((-1).^k ./ (2*k +1))

%% Es T5
clear all
clc

syms gamma;

A = [3 3; gamma 1]

x0 = [0; 1];
y0 = x0 / norm(x0);
x1 = A * y0;
y1 = x1 / norm(x1);
lambda = y1' * A * y1;

simplify(lambda)

%% Es T6
clear all
clc

n = 100;
A = tridiag(n,-1,2,-1);

f = @(x) 2 + 2 * cos(pi * x / (n + 1));

lambda48 = f(48);
lambda47 = f(47)
lambda46 = f(46);

(lambda48 + lambda47) / 2
(lambda47 + lambda46) / 2


%% Es T8
clear all
clc

f = @(x) exp(-4 * x) - 2 * x;
Phi = @(x) x - (f(x)^2) / (f(x + f(x)) - f(x));
x = 1;
toll = 1e-2;
err = 1 + toll;

k = 0;

while err > toll
    k = k + 1;
    x = Phi(x);
    err = abs(f(x));
end
k, x


%% Esercizio 
clear all
clc

n = 100;
A = pentadiag(n,1,-11,20,-11,1);
%A = 20*eye(n) + diag(ones(n-2,1),-2) + diag(-11*ones(n-1,1),-1) + diag(-11*ones(n-1,1),1) + diag(ones(n-2,1),2);
conv_gs(A)
conv_jacobi(A)

b = 5 * ones(n,1);
x0 = b;
toll = 1e-2;
nmax = 1e4;

[x, k,res_norm] = gs(A,b,x0,toll,nmax)

err_rel = errore_relativo(A,x,b)
%%
clc

Omega = [1.45:0.1:1.85];
T = tril(A);
nOmega = length(Omega);
rho = zeros(1,nOmega);

for i = 1:nOmega
    B = eye(n) - Omega(i) * (T \ A);
    rho(i) = max(abs(eig(B)));
end 

% format long e
[rho_min,index] = min(rho)

Omega(index)

%%
clc

P1 = eye(n);
P2 = tridiag(n,-1,2,-1);

K_P1 = sdpcond(A)
K_P2 = sdpcond(P2\A)

e1 = eig(A);
e2 = eig(P2\A);
Ksp1 = max(abs(e1))/min(abs(e1))
Ksp2 = max(abs(e2))/min(abs(e2))

f_abb = fatt_abb_grad(A,10,P2)

%% 

f_abb_conj = fatt_abb_conjgrad(A,10,P2)

conv_grad(A,P2)

%% 

clc

nmax = 100;
x0  = ones(nmax,1);

K_A = sdpcong_vect(A,x0,nmax);

K_A(1), K_A(2), K_A(100)