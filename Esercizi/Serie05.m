%% Es 1
clear
close all
clc

%% Parte 1
f = @(x) x .* sin(x);
a = -2; b = 6;
x = linspace(a,b,1000);
f_dis = f(x);

plot(x,f(x))
xlabel('x')
ylabel('f(x)')
title('f(x) = x * sin(x) e i suoi interpolanti')
hold on

%% Parte 2
PP_dis = [];
err_dis = [];
err_max = [];

for i = 2:2:6
    h = (b - a) / i;
    x_nod = [a:h:b];
    f_nod = f(x_nod);
    P = polyfit(x_nod, f_nod, i);
    P_dis = polyval(P, x);
    PP_dis = [PP_dis; P_dis];
    err_dis = [err_dis; abs(P_dis - f_dis)];
    err_max = [err_max; max(abs(P_dis - f_dis))];
end

plot(x, PP_dis)
legend('y = x * sin(x)','Interpolante di secondo grado','Interpolante di quarto grado','Interpolante di sesto grado','Location','southwest')

%% Parte 3


figure
plot(x,err_dis)
grid on
legend('Errore secondo grado','Errore quarto grado','Errore sesto grado')
xlabel('x')
ylabel('Errore')
title('Errore di interpolazione per grado')


%% Es 2
clear
close all
clc

%% Parte 1
f = @(x) sin(1 ./ (1 + x.^2));
a = -2*pi; b = 2*pi;
x = linspace(a,b,1000);
n = [2 4 8 10];

[PP,err,err_max] = polinomi_lagrange(n,a,b,f);

plot(x,f(x))
hold on
plot(x,PP)
legend('f(x)=sin(1/(1+x^2))','Secondo grado','Quarto grado','Ottavo grado','Decimo grado')
title('Funzione vs interpolazione')

%% Parte 2
figure
plot(n,err_max)

%% Parte 3

[PP,err,err_max] = polinomi_lagrange_chebyshev(n,a,b,f);

plot(x,f(x))
hold on
plot(x,PP)
legend('f(x)=sin(1/(1+x^2))','Secondo grado','Quarto grado','Ottavo grado','Decimo grado')
title('Funzione vs interpolazione con nodi di Chebyshev')

figure
plot(n,err_max)


%% Es 3
clear 
close all
clc

f = @(x) -x.^3 + 3*x.^2 - 2;

a = 0; b = 2;
x0 = 0; x1 = 1/2; x2 = 2;

syms x
phi0 = (x - x1) / (x0 - x1) * (x - x2) / (x0 - x2);
phi1 = (x - x0) / (x1 - x0) * (x - x2) / (x1 - x2);
phi2 = (x - x0) / (x2 - x0) * (x - x1) / (x2 - x1);

pol = simplify(f(x0) * phi0 + f(x1) * phi1 + f(x2) * phi2)

x1 = 1; x2 = 2;

phi0 = (x - x1) / (x0 - x1) * (x - x2) / (x0 - x2);
phi1 = (x - x0) / (x1 - x0) * (x - x2) / (x1 - x2);
phi2 = (x - x0) / (x2 - x0) * (x - x1) / (x2 - x1);

pol1 = simplify(f(x0) * phi0 + f(x1) * phi1 + f(x2) * phi2)



%% Es 4
clear
close all
clc


sigma = [0.1800 0.3000 0.5000 0.6000 0.7200 0.7500 0.8000 0.9000 1.0000];
epsilon = [0.0005 0.0010 0.0013 0.0015 0.0020 0.0045 0.0060 0.0070 0.0085];

plot(sigma, epsilon, 'ko')
title 'Dati sperimentali'
xlabel 'Sforzo'
ylabel 'Deformazione'

%% Polinomio di Lagrange
sigma_dis = linspace(min(sigma), max(sigma), 1000);
grado = length(sigma) - 1;
PL = polyfit(sigma, epsilon, grado);
epsilon_IL = polyval(PL, sigma_dis);

figure
plot(sigma, epsilon, 'ko', sigma_dis,epsilon_IL,'r','LineWidth',2)
title 'Dati sperimentali vs Interpolazione Lagrangiana'
xlabel 'Sforzo'
ylabel 'Deformazione'

%% Interpolazione polinomiale composita lineare

epsilon_ICL = interp1(sigma, epsilon, sigma_dis);

figure
plot(sigma, epsilon, 'ko', sigma_dis,epsilon_ICL,'r','LineWidth',2)
title 'Dati sperimentali vs Interpolazione Composita Lineare'
xlabel 'Sforzo'
ylabel 'Deformazione'

%% Splice cubica naturale interpolante

epsilon_ISCN = cubicspline(sigma, epsilon, sigma_dis);

figure
plot(sigma, epsilon, 'ko', sigma_dis,epsilon_ISCN,'r','LineWidth',2)
title 'Dati sperimentali vs Interpolazione Spline Cubica Naturale'
xlabel 'Sforzo'
ylabel 'Deformazione'

%% Spline cubica interpolante con condizioni di chiusura not-a-know

epsilon_ISCnak = spline(sigma, epsilon, sigma_dis);

figure
plot(sigma, epsilon, 'ko', sigma_dis,epsilon_ISCnak,'r','LineWidth',2)
title 'Dati sperimentali vs Interpolazione Spline Cubica con condizioni not-a-knot'
xlabel 'Sforzo'
ylabel 'Deformazione'

%% Minimo Quadrati grado 1, 2, 4

epsilon_IMQ(1,:) = polyval(polyfit(sigma,epsilon,1),sigma_dis);
epsilon_IMQ(2,:) = polyval(polyfit(sigma,epsilon,2),sigma_dis);
epsilon_IMQ(3,:) = polyval(polyfit(sigma,epsilon,4),sigma_dis);

figure
plot(sigma, epsilon, 'ko', sigma_dis,epsilon_IMQ,'LineWidth',2)
title 'Dati sperimentali vs Interpolazione ai Minimi Quadrati'
xlabel 'Sforzo'
ylabel 'Deformazione'
legend('Dati Sperimentali','Minimi Quadrati Grado 1','Minimi Quadrati Grado 2','Minimi Quadrati Grado 4')

%% Parte 3

sigma_v = [0.4 0.65];
epsilon_IL_v = polyval(PL, sigma_v);
epsilon_ICL_v = interp1 (sigma , epsilon , sigma_v );
epsilon_IMQ4_v = polyval ( polyfit (sigma , epsilon , 4), sigma_v );
epsilon_ISCN_v = cubicspline (sigma , epsilon , sigma_v );
epsilon_ISCnak_v = spline (sigma , epsilon , sigma_v );

fprintf ('Sigma : %f %f\n', sigma_v )
fprintf ('Epsilon IL: %f %f\n', epsilon_IL_v )
fprintf ('Epsilon ICL: %f %f\n', epsilon_ICL_v )
fprintf ('Epsilon IMQ4 : %f %f\n', epsilon_IMQ4_v )
fprintf ('Epsilon ISCN : %f %f\n', epsilon_ISCN_v )
fprintf ('Epsilon ISCnak : %f %f\n\n', epsilon_ISCN_v )


%% Es 5
clear
close all
clc

f = @(x) exp(-x.^2) .* sin(x);
a = -2; b = 3;
x = linspace(a,b,1000);
n = 3;

err_max = [];

f_x = f(x);

%% Parte 1

plot(x,f_x,'k','LineWidth',2)
hold on

h = (b - a) / n;
nodi = [a:h:b];

f_nodi = f(nodi);
P_dis = interp1(nodi,f_nodi,x);

plot(nodi,f_nodi,'bo','LineWidth',2);
plot(x,P_dis,'b','LineWidth',2)
legend('f(x)','nodi','Interpolante Composito Lineare','Location','best')
xlabel 'x'
ylabel 'y'
title 'f(x) vs Interpolante Composito Lineare'

%% Parte 2

err_max = [err_max; max(abs(P_dis - f_x))];

%% Parte 3

H = [];
err_max1 = [];

for n = 2.^(2:7)
    h = (b - a) / n;
    H = [H h];
    nodi = [a:h:b];
    f_nodi = f(nodi);
    P_dis = interp1(nodi,f_nodi,x);
    err_max1 = [err_max1; max(abs(P_dis - f_x))];
end

figure
loglog(H,err_max1,'ro-',H,H,'k--',H,H.^2,'k','LineWidth',2)
legend('Errore','H','H^2','Location','best')

%% Es 6
clear
close all
clc

y0 = 10;
delta_t = 0.1;
T = 1;
y_s = [10 9.89 9.75 9.66 9.10 8.95 8.10 7.49 6.80 6.14 5.05];

%% Parte 1
f = @(x) y0 - 0.5 * 9.81 * x.^2;
x_s = linspace(0,T,11);
x_f = linspace(0,T,1001);

plot(x_s,y_s,'ro',x_f,f(x_f),'b','LineWidth',2)
title 'Legge oraria caduta di un grave vs dati sperimentali'
legend('(t_s,y_s)','y(t)')
xlabel 't [s]'
ylabel 'y [m]'
%% Parte 2

n = length(y_s) - 1;
Pi_n_v = polyval(polyfit(x_s,y_s,n), x_f);
PiH_1_v = interp1(x_s,y_s,x_f);
Pmq_2_v = polyval(polyfit(x_s,y_s,2), x_f);

figure
plot(x_s,y_s,'om',...
     x_f,f(x_f),'-b',...
     x_f,Pi_n_v,'-k',...
     x_f,PiH_1_v,'-g', ...
     x_f,Pmq_2_v,'-r');
grid on
legend('(t_s,y_s)','y(t)','Pi_n(t)','PiH_1(t)','Pmq_2(t)','Location','best')
xlabel 't [s]'; ylabel 'y [m]'
title 'Varie interpolazioni del porcodedio'

err_Pi_n_v = abs(Pi_n_v - f(x_f));
err_PiH_1_v = abs(PiH_1_v - f(x_f));
err_Pmq_2_v = abs(Pmq_2_v - f(x_f));

figure
plot(x_f, err_Pi_n_v,'-k', ...
     x_f, err_PiH_1_v,'-g',...
     x_f, err_Pmq_2_v,'-r')
grid on
xlabel 't [s]'; ylabel 'Errore [m]';
legend('Pi_n(t)','PiH_1(t)','Pmq_2(t)','Location','best')
title 'Errori per varie interpolazioni del porcodedio'

%% Parte 3

T_i = 1.05;
t_v = linspace(0,T_i,1001);
Pi_n_v = polyval(polyfit(x_s,y_s,n),t_v);
Pmq_s_v = polyval(polyfit(x_s,y_s,2),t_v);

figure
plot(x_s,y_s,'om',...
     t_v,f(t_v),'-b',...
     t_v,Pi_n_v,'-k',...
     t_v,Pmq_2_v,'-r');
grid on
xlabel 't [s]'; ylabel 'y [m]';
legend('(t_s,y_s)','y(t)','Pi_n(t)','Pmq_2(t)','Location','best')
title 'Altezza grave a t = 1.05s per varie interpolazioni del porcodedio'

%% Es 7
clear
close all
clc

g = @(x) 10 * x .^ 2;
f = @(x) g(x) + 2 * rand(size(x)) - 1;

a = 0; b = 1;
n = 9;

x_nodi = linspace(a,b,n + 1);
y_nodi = f(x_nodi);

%% Parte 1
x_v = linspace(a,b,1001);
f_v = f(x_v);
g_v = g(x_v);

P_int_v = polyval(polyfit(x_nodi,y_nodi,n),x_v);

P_mq_v = polyval(polyfit(x_nodi,y_nodi,2),x_v);

plot(x_v,f_v,'-g',x_v,g_v,'-k',x_v,P_int_v,'-r',x_v,P_mq_v,'-b','LineWidth',2);
legend('f(x)','g(x)','\Pi_n f(x)','f_2(x)');
title 'f(x) vs interpolazioni'

%% Parte 2

x_v2 = linspace(a,2,1001);
g_v2 = g(x_v2);
P_int_v2 = polyvalfit(x_nodi,y_nodi,n,x_v2);
P_mq_v2 = polyval(polyfit(x_nodi,y_nodi,2),x_v2);

P_int_v2(end)
P_mq_v2(end)

plot(x_v,f_v,'-g',x_v2,g_v2,'-k',x_v2,P_int_v2,'-r',x_v2,P_mq_v2,'-b','LineWidth',2)
legend('f(x)','g_2(x)','\Pi_n f(x)','f_2(x)');
title 'Intervallo 0-2'
