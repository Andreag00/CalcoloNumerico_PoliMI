%% Es 1
clear 
clc
close all 

f = @(x) x.^3 - (2 + exp(1)) * x.^2 + (2 * exp(1) + 1) * x + (1 - exp(1)) - cosh(x - 1); 

x = linspace(0.5,6.5,10000);

plot_zero(f,x)

applicabilita_bisez(3,4,f);
applicabilita_bisez(6,6.5,f);
applicabilita_bisez(0.5,1.5,f);

[x_vect1,k1,k_max1] = bisez(3,4,1e-12,f);
[x_vect2,k2,k_max2] = bisez(6,6.5,1e-12,f);

%% Es 2

clear
clc
close all

f = @(x) x.^3 - (2 + exp(1)) * x.^2 + (2 * exp(1) + 1) * x + (1 - exp(1)) - cosh(x - 1); 
%Df = @(x) 3*x.^2 - 2*(2+exp(1))*x + (2*exp(1)+1) - sinh(x-1);
Df = derivata(f);
%D2f = @(x) 6*x - 2*(2+exp(1)) - cosh(x-1);
D2f = derivata(Df);
alpha = 1;
x = linspace(0.5,6.5,10000);

plot_zero(f,x,1,'Funzione');
plot_zero(Df,x,1,'Derivata');
plot_zero(D2f,x,1,'Derivata seconda')

molteplicita_zero(alpha,Df,D2f);

toll = 1e-6;
nmax = 100;

disp 'Calcolo della radice con molteplicità 2'
x01 = 0.5;
disp 'Metodo di Newton semplice'
[x_vect_1,k1] = newton(x01,nmax,toll,f,Df);
disp 'Metodo di Newton modificato'
[x_vect_1m,k1m] = newton(x01,nmax,toll,f,Df,2);

disp 'Calcolo della radice con molteplicità 1'
x02 = 3;
[x_vect_2,k2] = newton(x02,nmax,toll,f,Df);

disp 'Calcolo dela seconda radice con molteplicità 1'
x03 = 6;
[x_vect_3,k3] = newton(x03,nmax,toll,f,Df);



%% Es 3

clear
clc
close all


f = @(x) atan(7.*(x - pi/2)) + sin((x - pi/2).^3);
x = linspace(-1,6,10000);
df = derivata(f);
Df = @(x) 7 ./ (1 + 49 .* ( x-pi/2 ).^2 ) + 3 .* (x-pi/2).^2 .* cos( (x-pi/2).^3 );
D2f = derivata(Df);

%plot_zero(f,x)
figure
plot(x,Df(x))
plot(x,df(x))

figure
plot(x,(Df(x)-df(x)))

alpha = pi/2;
molteplicita_zero(alpha,Df,D2f)


toll = 1e-10;

disp 'Guess iniziale x0 = 1.5'
x0 = 1.5;
[x_vect,k] = newton(x0,1000,toll,f,Df);
err = abs(x_vect(end) - alpha)

disp 'Guess iniziale x0 = 4'
x0 = 4;
[x_vect,k] = newton(x0,1000,toll,f,Df);
err = abs(x_vect(end) - alpha)
[x_vect,k] = newton(x0,1000,toll,f,df);
err = abs(x_vect(end) - alpha)


a = -1; b = 6;
toll = (b - a) / 2^31;
applicabilita_bisez(a,b,f);
[x_vect,k,k] = bisez(a,b,toll,f);
err = abs(x_vect(end) - alpha)


nmax_b = 5;
nmax_n = 1000;
[x_vect,k] = biseznewton(a,b,nmax_b,nmax_n,toll,f,Df);
err = abs(x_vect(end) - alpha)


%% Es 4

clear
clc
close all

f = @(x) (cos(2*x)).^2 - x.^2;
x = linspace (-pi/2,pi/2,10000);
%plot_zero(f,x)

phi = @(x) x + 0.1 * (f(x));
x0 = 0.1;
[succ1,it1] = ptofis(x0,phi,1000,1e-10,-pi/2,pi/2);


Df = derivata(f);
Df_a = Df(succ1(end));
A_sup = -2/Df_a

[p1,c1] = stimap(succ1);

%% Es 5

clear 
clc
close all
f = @(x) cos(pi.*x).*(x - 1/2);

Df = derivata(f);
D2f = derivata(Df);

molteplicita_zero(0.5,Df,D2f)