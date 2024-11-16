%% Es 1
clear all 
clc

A = [1 2; -1 4];

conv_gs(A);
conv_jacobi(A);

%% Es 2
clear all
clc

syms g;
n = 3;

A = [1 g g;
     g 1 g;
     g g 1];

D = diag(diag(A));
B_j = eye(n) - D \ A;
rho = max(abs(eig(B_j)))

simplify(2*abs(g) < 1)


%% Es 3

clear all
clc

n = 4;
A = tridiag(n,-1,3,2);
b = ones(n,1);
nmax = 5;
toll = 1e-6;

gs(A,b,b,toll,nmax)

%% Es 4
clear all
clc

A = [3 -1; -1 2];
b = ones(2,1);

syms b;

P = [b -1; 0 2];

i_P = inv(P);

rho = raggiospettrale(eye(2) - i_P * A)

solve(abs(5/(2*b) - 1) < 1,b)
%% Es 5

clear all
clc

A = hilb(4);
e = eig(A);

K = max(abs(e)) / min(abs(e));
d = (K-1) / (K+1);

syms x;
N = eval(solve(d^x == 1/1000,x))

stima_it_richstaz(A,1000)

%% Es 6


clc

n = 100;
A = pentadiag(n,-1,3,8.1,-3,-1);
y = 2:0.0001:2.5;
m = length(y);
alpha = [];
x0 = ones(n,1);

%for i = 2:0.0001:2.5
%    P = tridiag(n,-1,i,-1);
%    alpha_it = alpha_opt_richstaz(A,P);
%    alpha = [alpha alpha_it];
%end

for i = 1:m
    [x,k] = richardson(A,b,P,x0)
