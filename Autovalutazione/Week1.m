%% Es 3
clear
clc

f1 = @(x) (x-1).^7;
f2 = @(x) x.^7 - 7*x.^6 + 21*x.^5 - 35*x.^4 + 35*x.^3 - 21*x.^2 + 7*x - 1;

x_b = 1.01;

100 * abs(f1(x_b)-f2(x_b)) / abs(f1(x_b))

%% Es 4
clear
clc

n = 100;

for i = 1:n
    for j = 1:n
        A(i,j) = 100 - abs(i-j);
    end
end

somma = sum(A(n,:))

somma1 = sum(diag(fliplr(A)))


%% Es 5
clear
clc

S = 1e5;
x(1) = S;
for i = 1:10
    x(end+1) = 0.5 * (x(end) + S/x(end));
end
x(end)