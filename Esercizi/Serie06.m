%% Es 1
clear
close all
clc

f = @(x) pi * cosh(x - 0.5) .^ 2;

a = 0; b = 0.8;

x = linspace(a,b,1000);

plot(x,f(x),'LineWidth',2);
legend 'f(x) = sinh(x - 1/2)';
xlabel 'x'
ylabel 'f(x)'
title 'Funzione'

V = pi * ((sinh(1) + sinh(3/5)) / 4 + 2/5);

n = 1:20;
for i = n
    I_pmed(i) = pmedcomp(a,b,i,f);
    I_trap(i) = trapcomp(a,b,i,f);
    I_simp(i) = simpcomp(a,b,i,f);
end

figure 

plot(n,I_pmed,'*',n,I_trap,'o',n,I_simp,'d',n,V * ones(1,20))
grid on
legend('Punto medio composito','Trapezio composito','Simpson composito','Volume reale')
title 'Integrali'

err_pmed = abs(V - I_pmed);
err_trap = abs(V - I_trap);
err_simp = abs(V - I_simp);

h = (b - a) ./ n;

figure
loglog(h,err_pmed,'*',h,err_trap,'o',h,err_simp,'d',h,h.^2,h,h.^4);
grid on
legend('Punto medio composito','Trapezio composito','Simpson composito','h^2','h^4','Location','best');
title 'Errore di quadratura in scala logaritmica'

%%
clc
toll = 1e-5;
n_pmed = stima_n_pmed(a,b,f,toll)
n_trap = stima_n_trap(a,b,f,toll)
n_simp = stima_n_simpson(a,b,f,toll)


%% Es 2
clear
close all
clc 