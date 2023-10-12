clc;
N = 64;
fs = 64000;
f1 = 3300;
f2 = 3700;
ts = 1/fs;
ind = 1;
x = zeros(1, N);
for n = 1:N
 m = n - 1;
 x(ind) = 8*sin(2*pi*f1*m*ts) + 6*sin(2*pi*f2*m*ts);
 ind = ind + 1;
end
X = dft(x, N);
n = (0:N-1);
w_Ham = 0.54 - 0.46*cos(2*pi*n/(N-1));
x_Ham = x .* w_Ham;
X_Dft_Ham = dft(x_Ham, N);
t=0:N-1;

figure(1)
plot(t, x, 'b--o');
grid minor;
title('Time Domain Signal');
xlabel('Time (Sample)');
ylabel('Amplitude');

figure(2)
stem(t, abs(X));
grid minor;
title('Magnitude of DFT');
xlabel('Frequency Bin');
ylabel('Magnitude');

figure(3)
stem(t, w_Ham);
grid minor;
title('Hamming Window');
xlabel('n');
ylabel('Amplitude');

figure(4)
stem(t, x_Ham);
grid minor;
title('Multiplication of Hamming Window and Signal');
xlabel('n');
ylabel('Amplitude');

figure(5)
stem(t, abs(X_Dft_Ham));
grid minor;
title('Magnitude of DFT with Hamming Window');
xlabel('Frequency Bin');
ylabel('Magnitude');

function X = dft(x, N)
 X = zeros(1, N);
 for k = 0:N-1
 X(k+1) = 0;
 for n = 0:N-1
 X(k+1) = X(k+1) + x(n+1) * exp(-1j* 2 * pi * k * n / N);
 end
 end
end