%% Es 1
clear
close all
clc

syms g;

A(g) = [(5 + 4*g) (10 - 2*g); (-2*g) g];
eig(A)
% Per poter applicare il metodo delle potenze abs(lambda_1) =/=
% abs(lambda_2) => abs(g) =/= 1

%% Es 2
clear
close all
clc

A = diag([3 2 5]) + diag(-1*ones(2,1),1) + diag(-1*ones(2,1),-1);
x0 = ones(3,1);
toll = 1e-6;
nmax = 3;

K = sdpcond(A,x0,toll,nmax)

%% Es 3
clear
close all
clc

A = [11 0 0;
     5 -2 0;
     3 0 -9];

e = eig(A);
(e(1) + e(2)) / 2

%% Es 4
clear
close all
clc
syms g;
A(g) = [9 g 0;
        g 1 0;
        0 0 2];

eig(A)
%rank(A)
%gershcircles(A(5))
eig(A(3))
%% Es 5
A = [15 1 -2;
     0 3 1;
     1 -1 9];

[D,k,err] = qrbasic(A,1e-6,5)

%% Es 6
clear
close all
clc

f = @(x) 1 - exp(x);
syms g;
stima_it_bisez(4,2^-g)