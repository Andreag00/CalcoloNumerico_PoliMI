%% Es 3.1

clear all
clc
close all

n = 100;

A = randi([0,1],n);

s = sum(A);

for i = 1:n
    A(i,:) = A(i,:) ./ s;
end

B = [0 0 0 1 0
     1 0 0 0 0
     0 1 0 0 0
     0 1 0 0 1
     1 1 1 1 0];

s = sum(B);

for i = 1:5
    B(i,:) = B(i,:) ./ s;
end

toll = 1.e-6;
nmax = 100;
x0 = ones(n,1) ./ n;

[l_A,x,k] = eigpower(A,toll,nmax,x0);
l_A

x0 = ones(5,1) ./ 5;
[l_B,x,k] = eigpower(B,toll,nmax,x0);
l_B


%% Es 3.2

clear all
clc
close all

A = toeplitz(1:4);
toll = 1e-6;
nmax = 100;
x0 = (1:4)';

[lambda,x,k] = invpower(A,toll,nmax,x0);
lambda

x0 = ones(4,1);

[lambda,x,k] = invpower(A,toll,nmax,x0);
lambda


%% Es 3.3

clear all
clc
close all

A = [10 -1 1 0
     1 1 -1 3
     2 0 2 -1
     3 0 1 5];

gershcircles(A)

eig(A)

[lambda,x,k] = invpower(A);
lambda

lambda = invpowershift(A,i)

lambda = invpowershift(A,-i)

%% Es 3.4
clear all
clc
close all

A = [30 2 3 13;
     5 11 10 8;
     9 7 6 12;
     4 14 15 1];

toll = 1e-10;
nmax = 1000;

qrbasic(A,toll,nmax);
V1 = v_conv_qr(A,toll,nmax)
A = [-30 2 3 13;
     5 11 10 8;
     9 7 6 12;
     4 14 15 1];
qrbasic(A,toll,nmax);
V2 = v_conv_qr(A,toll,nmax)
%% Es 3.6

clear all
clc
close all

A = tridiag(4,-1,2,-1);
toll = 1e-8;
nmax = 200;

K = sdpcond(A,toll,nmax)