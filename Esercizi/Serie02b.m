%% Es 1.1
clear all
clc

n = 100;
R1 = 1;
R2 = 2;

A = diag(-R2*ones(n,1)) + diag(R1*ones(n-1,1),-1);
A(1,:) = 1;

%nnz(A)
%figure(1)
%spy(A)
%sparse(A);

[L,U] = lugauss(A);
%figure(2)
%spy(U)

% Matrice di precondizionamento Jacobi
D = diag(A) .* eye(n);
D_inv = (1 ./ diag(A)) .* eye(n);

B_j = D_inv * (D - A);

% Matrice di precondizionamento Gauss-Seidel

T = tril(A);
T_inv = inv(T);

B_gs = T_inv * (T - A);

rho_j = max(abs(eig(B_j)))
rho_gs = max(abs(eig(B_gs)))

% parte 5

b = ones(n,1);
b(1) = 2;
x0 = zeros(n,1);
toll = 1e-6;
nmax = 1000;

[x,k] = jacobi(A,b,x0,toll,nmax)

%% Es 1.2
clear all
clc

n = 7;

A = tridiag(n,-3,9,-3) + diag(ones(n-2,1),-2) + diag(ones(n-2,1),2);
b = [7 4 5 5 5 4 7]';

simmpos(A)

domdiagstrcol(A)

domdiagstrrig(A)

x0 = zeros(n,1);
toll = 1e-6;
nmax = 1000;

[x,i] = gs(A,b,x0,toll,nmax)

[xj,k] = jacobi(A,b,x0,toll,nmax)

stima_it_gs(A,toll)
stima_it_jacobi(A,toll)
%% Es 2.1
clear all
clc

n = 50;

A = pentadiag(n,-1,-1,4,-1,-1);

b = 0.2 * ones(n,1);

simmpos(A);

kond = max(eig(A)) / min(eig(A))

x0 = zeros(n,1);
P = eye(n);
nmax = 10000;
toll = 1e-5;

disp 'alpha = 0.2'
alpha = 0.2;
B_alpha   = eye(n) - alpha * A;
fprintf ('\nRaggio spettrale: %f\n\n',max(eig(B_alpha)))
[x_02,k_02] = richardson(A, b, P, x0, toll, nmax, alpha);


disp 'alpha = 0.33'
alpha = 0.33;
B_alpha   = eye(n) - alpha * A;
fprintf ('\nRaggio spettrale: %f\n\n',max(eig(B_alpha)))
[x_033,k_033] = richardson(A, b, P, x0, toll, nmax, alpha);

disp 'alpha ottimale'
alpha = 2 / (max(eig(A)) + min(eig(A)));
B_alpha   = eye(n) - alpha * A;
fprintf ('\nRaggio spettrale: %f\n\n',max(eig(B_alpha)))
[x_opt,k_opt] = richardson(A, b, P, x0, toll, nmax, alpha);

disp 'alpha dinamico'

[x_din,k_din] = richardson(A, b, P, x0, toll, nmax);

%% Es 2.1.5
clc

fprintf('\nRichardson: P = tril(A), alpha = 1.00\n')
P = tril(A);
alpha = 1;
B_alpha = eye(n) - alpha * inv(P) * A;
fprintf('Raggio spettrale: %f\n', max(abs(eig(B_alpha))))
[x_ri, k_ri] = richardson(A,b,P,x0,toll,nmax,alpha);
[x_gs, k_gs] = gs(A,b,x0,toll,nmax);
fprintf('Gauss-Seidel converge in %d iterazioni \n', k_gs)
fprintf('Scarto tra le soluzioni: %e\n', max(abs(x_ri-x_gs)))


%% Es 2.1.6
clc
P = tridiag(n,-1,2,-1);

simmpos(P)

fprintf('\nRichardson: P tridiagonale, alpha ottimale\n')
v = eig(inv(P)*A);
alpha = 2/(max(v)+min(v));
B_alpha = eye(n) - alpha * inv(P) * A;
fprintf('\nRaggio spettrale: %f\n', max(abs(eig(B_alpha))))
fprintf('\nNumero di condizionamento: %f \n', cond(inv(P)*A))
[x_tri, k_tri] = richardson(A, b, P, x0, toll, nmax, alpha);


fprintf('\nRichardson: P tridiagonale, alpha dinamico\n')
[x, k_tridin] = richardson(A, b, P, x0, toll, nmax);



%% Es 3.1
clear all
clc


A = [6.8 -2.4; -2.4 8.2];

v1 = [4 3]' / 5;
v2 = [-3 4]' / 5;
b = [4 8]';

l1 = 5;
l2 = 10;

V = [v1, v2];
D1 = diag([l1,l2]);
A1 = V * D1 * V';

l1 = 1;
l2 = 10;

D2 = diag([l1,l2]);
A2 = V * D2 * V';


x = linspace(-10,10,80);
y = linspace(-10,10,80);
[X,Y] = meshgrid(x,y);

Phi1 = 0.5 * ( A1(1,1) * X.^2 + A1(2,2) * Y.^2 + 2 * A1(1,2) * X .* Y) - b(1) * X - b(2) * Y;
Phi2 = 0.5 * ( A2(1,1) * X.^2 + A2(2,2) * Y.^2 + 2 * A2(1,2) * X .* Y) - b(1) * X - b(2) * Y;

surf(X,Y,Phi1,'Lines','No');
title('Phi1');
hold on;
contour(X,Y,Phi1,20);



figure;
surf(X,Y,Phi2,'Lines','no');
title('Phi2');
hold on;
contour(X,Y,Phi2,20);

figure
contour(X,Y,Phi1,20);
title('Linee di livello: Phi1')

figure
contour(X,Y,Phi2,20)
title('Linee di livello: Phi2')


%% Minimizzazione di Phi2
%% Alpha = 0.05
x0 = [-9 -9]';
nmax = 1000;
alpha = 0.05;
toll = 1e-7;
[Sg_rich, n_it_rich] = richardson_it(A2,b,eye(2),x0,toll,nmax,alpha);

figure
contour(X,Y,Phi2,80)
title('Phi2: alpha = 0.05');
axis equal
hold on
plot(Sg_rich(1,:),Sg_rich(2,:),'-or','LineWidth',2,'MarkerSize',4,'MarkerFaceColor','r')

%% Alpha = 0.24
alpha = 0.24;
[Sg_rich_2, n_it_rich_2] = richardson_it(A2,b,eye(2),x0,toll,nmax,alpha);

figure
contour(X,Y,Phi2,80)
title('Phi2: alpha = 0.24');
axis equal
hold on
plot(Sg_rich_2(1,:),Sg_rich_2(2,:),'-or','LineWidth',2,'MarkerSize',4,'MarkerFaceColor','r')


%% Alpha dinamico = metodo del gradiente

[Sg_dyn, n_it_dyn] = richardson_it(A2,b,eye(2),x0,toll,nmax);

figure
contour(X,Y,Phi2,80)
title('Phi2: alpha dinamico, metodo del gradiente');
axis equal
hold on
plot(Sg_dyn(1,:),Sg_dyn(2,:),'-or','LineWidth',2,'MarkerSize',4,'MarkerFaceColor','r')


%% Con precondizionatore

P = [1.0912 -0.8587; -0.8587 1.5921];

A_prec = P \ A2;
eig(A_prec);

b_prec = P \ b;

Phi_prec = 0.5 * ( A_prec(1,1) * X.^2 + A_prec(2,2) * Y.^2 + 2 * A_prec(1,2) * X .* Y) - b_prec(1) * X - b_prec(2) * Y;

figure;
contour(X,Y,Phi_prec,80)
grid on
title('Linee di livello: Phi precondizionato')

[Sg_prec,n_it_prec] = richardson_it(A2,b,P,x0,toll,nmax);

figure
contour(X,Y,Phi2,60)
axis equal
hold on
title('Gradiente precondizionato vs Gradiente')

plot(Sg_dyn(1,:),Sg_dyn(2,:),'--','LineWidth',2,'Color',[0.48 0.48 0.48])

plot(Sg_prec(1,:),Sg_prec(2,:),'-or','LineWidth',2,'MarkerSize',4,'MarkerFaceColor','r')

%% Gradiente coniugato

[Sg_conj,n_it_conj] = conjgrad_it(A2,b,x0,nmax,toll);

figure
contour(X,Y,Phi2,60)
axis equal
hold on
title('Gradiente coniugato vs Gradiente precondizionato')

plot(Sg_prec(1,:),Sg_prec(2,:),'--','LineWidth',2,'Color',[0.48 0.48 0.48])
plot(Sg_conj(1,:),Sg_conj(2,:),'-or','LineWidth',2)



%% Es 3.2
clear all
clc
close all

N = 5:20;
toll = 1e-6;
nmax = 5000;
It_np = [];
It_p = [];
K_np = [];
K_p = [];

for n = N
    A = pentadiag(n,2,1,4,1,2);
    KA = cond(A);
    K_np = [K_np KA];
    x0 = zeros(n,1);
    b = ones(n,1);
    P = tril(A);
    K_p = [K_p, cond(inv(P) * A)];
    % Precondizionato
    [x,k] = richardson(A,b,P,x0,toll,nmax);
    It_p = [It_p k];
    % Non precondizionato
    [x,k] = richardson(A,b,eye(n),x0,toll,nmax);
    It_np = [It_np k];
end

figure(1);
semilogy(N,It_np,'r',N,It_p,'b')
grid on
xlabel 'Dimensioni sistema'
ylabel 'Iterazioni richieste'
title 'Confronto metodo del gradiente vs gradiente precondizionato'
legend ('Gradiente','Gradiente precondizionato','Location','northwest');

figure(2)
plot(N,K_p,'r',N,K_np,'b')
grid on
xlabel 'Dimensioni sistema'
ylabel 'Numero di condizionamento'
title 'Numero di condizionamento di A e di P^{-1}*A'
legend ('cond(P^{-1}*A)','cond(A)','Location','northwest')


%% Es 3.2 parte 2
It_cg = [];
for n = N
    A = pentadiag(n,2,1,4,1,2);
    b = ones(n,1);
    x0 = zeros(n,1);
    [x,k] = conjgrad_it(A,b,x0,nmax,toll);
    It_cg = [It_cg k];
end

figure(3)
semilogy(N,It_np,'r',N,It_p,'b',N,It_cg,'g-')
grid on
title 'Confronto metodo del gradiente, gradiente precondizionato e gradiente congiunto'
ylabel 'Iterazioni richieste'
xlabel 'Dimensioni sistema'
legend ('Gradiente','Gradiente precondizionato','Gradiente coniugato','Location','northwest')


%% Es 4.1
clear all
close all
clc

n = 300;
A = pentadiag(n,1,-2,6,-2,1);
x = ones(n,1);
b = A * x;