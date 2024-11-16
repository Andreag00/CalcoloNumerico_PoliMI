%% Es 1
clear all
clc
close all

n = 100;
A = diag(2*ones(n,1)) + diag(-ones(n-1,1),1);
A(n,1) = 1;
b = ones(1,n);

[L,U,P,Q] = lu(sparse(A));

y = fwsub(L,b);
b1 = P*b';
y1 = fwsub(L,b1);

x1 = bksub(U,y1);

L(2,1)

x1(n)

y(n)

%% Es 2
clear all
clc
close all


syms x;

A = [2*x, sqrt(3)/2*x; sqrt(3)/2*x, x];

K = max(abs(eig(A)))/min(abs(eig(A)))

%% Es 3

clear all
clc
close all

K2 = 1e10;
normb = 10;
res_norm = 1e-11;

err_rel = K2 * res_norm / normb

%% Es 4
clear all
clc
close all

n = 3;
A = [1e-6 1e6 1; 1 0 1; 1 1 1];
eps_m = 2^-52;

den = max(abs(A),[],'all');

[L,U] = lugauss(A);

max_U = max(abs(U),[],'all');
max_L = max(abs(L),[],'all');
num = max(max_U,max_L);

rho = num / den;
P_rel = 8 * n ^ 3 * eps_m * rho


%% Es 5
clear all
clc
close all

A = [6 -2 -2; -2 8 -4; -2 -4 10];

b = ones(3,1);

P = [6 0 0; -1 8 0; -1 -2 10];
x = b;
in = inv(P);

B = eye(3) - in*A;
g = in*b;

for i = 1:2
    x = B * x + g;
end

x

