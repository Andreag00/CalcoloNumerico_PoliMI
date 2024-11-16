%% Es 1

clear all
clc

A = [4 2 1;
     2 4 1;
     1 1 7];

b = 2 * ones(3,1);

x0 = b;

[x,k,alpha] = richardson(A,b,eye(3),x0,1e-6,1) % Modificare Richardson

%% Es 2

A = hilb(3);

stima_it_richstaz(A,200)

%% Es 3

syms g;

A = [4 -1; -1 g];

b = ones(2,1);
x0 = zeros(2,1);

r = b - A * x0;
p = r;
x = x0;

alpha = (p' * r) / (p' * A * p);
x = x + alpha * p;
r = r - alpha * A * p;
beta = (p' * A * r) / (p' * A * p);
p = r - beta * p;

simplify(p)

%% Es 4

clear all
clc

A = [8 -2 -2;
     -2 6 -1;
     -2 -1 9];

b = ones(3,1);

x = pcg(A,b,1e-6,2,[],[],b)

%% Es 5

clear all
clc


syms b;
A = [10 -2;
     -2 b];
x = ones(2,1);

autoval_rayleigh(A,x)