%% Es 1.1
clear all
clc

A = [50 1 3; 1 6 0; 3 0 1];

B = [50 1 10; 3 20 1; 10 4 70];

C = [7 8 9; 5 4 3; 1 2 6];

% la matrice A e' simmetrica e definita positiva
if (A == A')
    disp('A e'' simmetrica')
    na = size(A, 1);
    for i=1:na
        if (det(A(1:i,1:i))>0)
            if (i==na) 
                disp('A e'' definita positiva') 
            end
        else
            error('A non e'' definita positiva')
        end   
    end
else
    disp('A non e'' simmetrica')
end

% la matrice B e' a dominanza diagonale stretta per colonne
db = diag(B);
nb = size(B,1);
for j = 1:nb
   r(j) = abs(db(j)) - sum(abs(B([1:j-1,j+1:nb], j)));
end
if (r > 0)
    disp('B e'' a dominanza diagonale per colonne')
end

% la matrice C non ha particolari proprieta'
% controllo che i suoi minori principali abbiano
% determinante diverso da zero

i = 1;
dc = 1;
nc = size(C,1);
while ( (i < nc) && (dc ~= 0) )
    dc = det(C(1:i, 1:i));
    i = i+1;        
end
if (dc == 0)
    disp('non posso applicare la decomposizione LU ad C')
else
    disp('posso applicare la decomposizione LU a C')
end

[L_A,U_A] = lugauss(A);
[L_B,U_B] = lugauss(B);
[L_C,U_C] = lugauss(C);

x_ex = [1 1 1]';
b = A * x_ex;

y = fwsub(L_A,b);
x = bksub(U_A,y)

err_rel = norm(x_ex-x) / norm(x_ex)

res_norm = norm(b-A*x)/norm(b)

%% Es 1.2
clear all
clc

A = [50 1 3; 1 6 0; 3 0 1];

n = size(A,1);

I = eye(n);

A_inv = [];

[l,U] = lugauss(A);
for i = 1:n
    y = fwsub(l,I(:,i));
    x = bksub(U,y);
    A_inv = [A_inv x];
end

A_inv
A_inv1 = inv(A)

%% Es 1.3
clear all
clc

n = 20;

R = ones(n,1);
%R(1) = 1e3; %se non uso permutazione per righe non funziona

I0 = 2;

b = zeros(n,1); 
b(1) = I0;

A = zeros(20,20);
A = diag(-R) + diag(R(1:n-1,1),-1);
A(1,:) = 1;

[l,U] = lu(A);

x = fwsub(l,b);
y = bksub(U,x);

i_ex = b(1) / n * ones(n,1);
err_rel = norm(i_ex - y) / norm(i_ex)
res_norm = norm(b - A * y) / norm(b)

cond(A)


%% Es 2.1
clear all
clc

n = 1000;
A = hilb(n);
B = rand(n);

x = ones(n,1);
y = x;

b = A * x;
c = B * y;

x1 = A \ b;
y1 = B \ c;

err_rel1 = norm(x - x1) / norm(x)
err_rel2 = norm(y - y1) / norm(y)

%% Es 3.1
clear all
clc

N = 20;
n = N-1;
l = 20;
K = 100;

A=diag(-2*ones(n,1))+diag(ones(n-1,1), -1)+diag(ones(n-1,1), 1);

A = K.*A;
b = zeros(n,1);
b(end) = -K*l;

[L,U,x] = thomas(A,b);

% Applico forza esterna a cazzo
b = 16 * rand(n,1);
b(end) = b(end) - K*l;

[LL,UU,xx] = thomas(A,b);


%% Es 4.1
clear all
clc

K = 100;
l = 20;
m = 20
T = zeros(4,m);

for i = 1:m 
    n = 200*i;

    A = diag(-2*ones(n,1))+diag(ones(n-1,1), -1)+diag(ones(n-1,1), 1);
    A = K.*A;

    b = zeros(n,1);
    b(end) = -K*l;

    tic;
    x_back = A \ b;
    T(1,i) = toc;

    tic;
    [L,U] = lu(A);
    y = fwsub(L,b);
    x_LU = bksub(U,y);
    T(2,i) = toc;

    tic;
    [L,U,x_thom] = thomas(A,b);
    T(3,i) = toc;

    tic;
    H=chol(-A);
    x_chol=H\(H'\-b);
    T(4,i)=toc;
end

figure
hold on;
dim=200:200:200*m;

plot(dim, T(1,:), '-ob', 'lineWidth', 2);
plot(dim, T(2,:), '-or', 'lineWidth', 2);
plot(dim, T(3,:), '-ok', 'lineWidth', 2);
plot(dim, T(4,:), '-om', 'lineWidth', 2);

legend('backslash', 'lu', 'thomas', 'chol');


%% Es 5.1
clear all
clc
close all

n = 20;

A = tridiag(n, -1, 4, -1);

A(:,1) = ones(n,1);
A(1,:) = ones(n,1);

A = sparse(A);

[L,U,P] = lu(A);

figure(1)
spy(A)
figure(2)
spy(L)
figure(3)
spy(U)





%% Es 6.1.2
clear all
clc
close all
% cond spettrale è max mod(autoval)/min mod(autoval)
m = 10;
spectre = zeros(m,1);

for i = 1:m
    n = 10 * i;
    A = tridiag(n,-1,2,-1);
    eigen = zeros(n,1);
    for j = 1:n
        eigen(j) = 2 + 2 * cos(pi * j / (n + 1));
    end

    spectre(i) = max(eigen) / min(eigen);
end


%% Es 6.1.5

n = 100;
