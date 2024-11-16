%% Es 1
clear
close all
clc

f = @(x) 2 ^ (-x) - 1;
[x_vect,k,k_max] = bisez(-1,4,1e-6,f);
x_vect(1), x_vect(2)

%% Es 2
clear
close all
clc

f = @(x) (1 - exp(x - 3)) .* (x .^ 2 / 9 - 1);
df = derivata(f);
d2f = derivata(df);

molteplicita_zero(3,df,d2f) % Poiché lo zero ha m >= 1 e f appartiene a C2, p = 2

%% Es 3
clear
close all
clc

nmax = 4; n = 0;

syms x [1 2]; 

F = [exp((x(1)^2 + x(2)^2 - 1) / 4) - 1; x(1) + exp(x(2)) - 2];

x0 = [2/3 1/3]';

[x_vect, k] = sol_sist_nonlin(F,x0,nmax);

x_vect(1:2,end)

%% Es 4
clear
close all
clc

syms x g mu;
phi(x) = (g+0.5)*x+2*g-1+(x+2)^mu;
dphi(x) = diff(phi,x)
d2phi(x) = diff(dphi,x)
d3phi(x) = diff(d2phi,x)



%% Es 5
clear
close all
clc


syms t x;
phi(x) = t*x*(1-2*x);
dphi = diff(phi,x)