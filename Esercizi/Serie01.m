%% Es 1.1
clear
clc

v1 = 2 .^ (0:10);

v2 = cos(pi ./ (1:10))';

v3 = 0.1 ./ (2 .^ (0:5));

v4_dispari = exp(1:10) - (-1).^(1:10) .* (6:5:51);

v4 = zeros(1,19);

v4(1:2:end) = v4_dispari(1:10);

%% Es 1.2
clear
clc
k = 10;
A = diag(2*ones(k,1))+diag(5*ones(k-1,1),-1)+diag(10*ones(k-2,1),2)+diag(10*ones(k-2,1),-2)+diag(40*ones(k-4,1),4)+diag(40*ones(k-4,1),-4)

A1 = A(1:3,1:3)
A2 = A(1:2:5,[1,2,4])
A3 = A(2:4,[1,3,4])

%% Es 1.3
clear
clc

B = eye(10)+[0 ones(1,8) 0]'*[1 zeros(1,8) 1]+[1 zeros(1,8) 1]'*[0 ones(1,8) 0]

k = 200;
C = diag(1:k)+diag(ones(k-1,1),-1)+diag(ones(k-1,1),1)+diag(0.5*ones(k-2,1),-2)+diag(0.5*ones(k-2,1),2)

n = 10;
D = diag(n*2:-2:2)+diag(0.5*ones(n-2,1),-2)+diag(3.^(0:n-2),1)

%% Es 1.4
clear
clc

x = 0:3;
f1 = @(t) t.*sin(t) + (0.5).^sqrt(t);

f1(x)

f2 = @(t) t.^4 + log(t.^3 + 1);
f2(x)

%% Es 1.5
clear
clc

x = linspace(0,6,10000);
f = @(t) 2 + (x-3).*sin(5*(x-3));

plot(x,f(x))
hold on
plot(x,-x+5)
plot(x,x-1)

%% Es 1.6
clear
clc

x = linspace(0.1,10,10000);
f = @(t) log(t).^2;

semilogx(x,f(x))

%% Es 4.1
clear
clc
n = 100;

for i = 1:n
    for j = 1:n
        A(i,j) = 1 / ( i + j -1);
    end
end

%% Es 4.2
clear
clc

n(1) = 7;
i = 1;
while n(end) ~= 1
    if mod(n(end),2)
        n(end+1)=3*n(end)+1;      
    else
        n(end+1) = n(end)/2;
    end
end

%% Es 4.3
clear
clc

USD = 10000;
y = 0;
while USD <= 1000000
    USD = USD*1.02 + 10000;
    y = y + 1;
end

    
%% Es 4.4
clear
clc

n = 10000000;
m = 0;
for i = 1:n
    v = [rand(1),rand(1)];
    if norm(v)<=1
        m = m + 1;
    end
end

pi2 = 4*m/n


%% Es 4.5
clear
clc

n = 1;

while ( sum([1:n]) < 88 )     
   n = n + 1;
end
n

%% Es 4.6
clear
clc

n = 10;

for i = 1:10
    if i == 2 || i == 6
        a(i,1) = 1 /i;
    else
        a(i,1) = 1 / (i-2) / (i - 6);
    end
end

%% Es 4.7
clear
clc

k = 8;

for i = 1:k+1
    v(i) = (2*(i-1)+1).^2;
end

%% Es 4.8
clear
clc

%function [v] = es4_8(n)
%    for i = 1:n
%        v(k)=(2.*(i-1)+1).^2;
%    end
%end

%% Es 4.9
clear
clc

%function [rad] = erone(n)
%    r(1) = n;
%    toll = 1e-6;
%    incr = toll + 1;
%
%    while incr > toll
%        r(end+1) = 0.5 * (r(end) + n / r(end));
%        incr = abs(r(end) - r(end-1));
%    end
%rad = r(end);
%plot(1:length(r),r);
%end


%% Es 4.10
clear
clc

n = 20;

a(1) = sqrt(2);
b(1) = 2;

for i = 2:n
    a(i) = sqrt(2) .* sqrt(1 - sqrt(1 - 0.25 .* a(i-1) .^ 2));
    b(i) = a(i) ./ sqrt(1 - 0.25 .* a(i-1) .^ 2);
end

x = [1:n];
p = 2 .^ x .* a(x);
q = 2 .^ x .* b(x);

r(x) = pi;

figure();
plot(x,r,x,p,x,q);
grid on


%% Es 4.11
clear
clc


circle = fimplicit(@(x,y) x.^2+y.^2-1, [-1,1])
hold on
ellispe = fimplicit(@(x,y) x.^2 ./ 4 + y.^2 ./ 9 -1)


%% Es 4.12
clear
clc


x = linspace(-5,5,2000);

f = @(x) -sqrt(x .^ 2 - x) .* (x < 0) + (-x .^ 2 + 2 .* x) .* exp(-x) .* (x >= 0); 

plot(x,f(x));


%% Es 4.13
clear
clc

k = 8;
n = 10;

%function [A] = cazzingulo(n,k)
%    for i = 1:n
%        for j = 1:n
%            a(i,j) = 2 * i * j + (k + 1);
%        end
%    end
%end


%% Es 4.14
clear
clc

x = 3;
y = -2;

f = atan(y ./ x) - sin(x .* sqrt(abs(y))) .^2;

%% Es 4.15
clear
clc
format longg

k = 8;
r = 2.5 + mod(k,2);
b = 0;

a(1) = 0.5;

for i = 2:100
    a(i) = r * a(i-1) * (1 - a(i-1));

    if abs(a(i)-a(i-1)) < 1e-3 && b == 0
        b = a(i)
        c = i
    end
end

%% Es 4.16
clear
clc

a = 2;
b = 4;
k = 8;
sum = 0;
n = mod(k,4) + 3;

for j = 1:n+1
    sum = sum + factorial(n) / factorial(j-1) / factorial(n-j+1) * a^(j-1) * b^(n-j+1);
end


%% Es 4.17
clear
clc

%% Es 4.18
clear
%clc

k = 8;
n = 5*k+k;
s_p = 0; s_d = 0;

for i = n:1000
    if mod(i,2)
        s_d = s_d + i;
    else
        s_p = s_p + i;
    end
end

%% Es 4.19
clear
clc

x1=linspace(-pi, 0, 1000);
x2=linspace(0, pi, 1000);

f1=@(x) sin(x);
f2=@(x) (x.^2+x)./6;

figure();
plot(x1, f1(x1), 'r');
hold on;
plot(x2, f2(x2), 'k');
grid on

%% Es 4.20
clear
clc

n = 48;

if (floor(sqrt(n))^2) ~= n
    disp diocane
else
    disp dioporco
end

%% Es 4.21
clear
clc

k = 4;
div = k + 2;
sum = 0;

for x = 1:1000
    if mod(x,div)
        sum = sum + x;
    end
end


%% Es 4.22
clear
clc

a = 4; b = 5; c = 3;
%function rettangolo(a,b,c)
%    if a^2 + b^2 == c^2
%        disp 'rettangolo';
%    elseif a^2 + c^2 == b^2
%        disp 'rettangolo'
%    elseif b^2 + c^2 == a^2
%        disp 'rettangolo'
%    else
%        disp 'non rettangolo'
%    end
%end


%% Es 4.23
clear
clc

n = 20;

%function [A] = stairs(n)
%    A = zeros(n,n) + diag(ones(n,1));
%    for i = 2:2:n
%        A = A + diag(ones(n-i,1),i) + diag(ones(n-i,1),-i);
%    end
%end


%% Es 4.24
clear
clc

k = 1000000000;

%function [avg] = armonicavg(k)
%    a = 1:10+k;
%    sum = 0;
%    for i = 1:size(a,2)
%        sum = sum + 1 ./ a(i);
%    end
%    avg = size(a,2) / sum;
%end

%% Es 4.25
clear
clc

k = 8;
%function [avg] = geomavg(k)
%    a = 1:10+k;
%    mlt = 1;
%    for i = 2:size(a,2)
%        mlt = mlt * a(i);
%    end
%    avg = nthroot(mlt,size(a,2));
%end


%% Es 4.26
clear
clc

n = 1000;

a(1) = 1

for i = 2:n
    a(end+1) = (a(end).^2+2)./(2.*a(end));
end

plot(1:length(a),a)


%% Es 4.27
clear
clc


n = 100;

T = zeros(n);
for i = 0:n
    T = T + diag((i+1) * ones(n-i,1),i);
end

%% Es 4.28
clear
clc

x = linspace(-5,5,10000);
f = @(x) (x.^2 + 3) ./ (x - 1);

plot(x,f(x))