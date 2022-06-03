%signal x
nx = 0:7; %
x = nx;

%signal y
ny = nx - 5;
y = x;

N1 = numel(x);
N2 = numel(y);
N = max(N1, N2);

if (N1<N2)
    x = [x, zeros(1,N-N1)];
end
if (N1>N2)
    y = [y, zeros(1,N-N2)];
end

cconv = zeros(1,N); %circular convolution function
%implementing the circular convolution
for m=0:N-1
    for n=0:N-1
        z = mod(m-n,N);
        cconv(m+1) = cconv(m+1)+x(n+1).*y(z+1);
    end
end

%generate circular convolution of x[n] and y[n]
figure()
stem(cconv, "filled", "k")
title("Circular Convolution of x[n] and y[n]")
xlabel("n"), ylabel("x[n] * y [n]")
grid on

fprintf("CIRCULAR CONVOLUTION OF x[n] AND y[n]: \n")
disp(cconv)
fprintf("\n")
