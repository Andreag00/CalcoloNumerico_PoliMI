%% Es 1
clear all
clc

x = 2;
n = 6;
sum = 0;
S = 0;

while true
    if exp(x) - S < 1e-1
        break;
    end
    for k = 1:n
        sum = sum + x^k / factorial(k);
    end
    S = 1 + sum;
    n = n + 1;
end


%% Es 2
clear all
clc
format long
n = 1e6;

res = montecarlo(n)

format short

%% Es 5
clear all
clc

syms gamma

A = [2*gamma 2 -8; gamma 1 8; 2 0 1];

[L,U,P] = lu(A);

L(2,1)
U(3,3)

P*L

%% Es 6
clear all
clc

U = [3 4 7; 0 -2 5; 0 0 1];

det(U)