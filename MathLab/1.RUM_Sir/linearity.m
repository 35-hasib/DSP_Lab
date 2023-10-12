clc;
N = 24;
fs = 24000;
f1 = 3000;
f2 = 11000;
ts = 1/fs;

x1 = zeros(1, N);
x2 = zeros(1, N);

a = 4;
b = 7;
 
 i = 1;
 for n = 0:N-1
 m = n;
 x1(i) = a * sin(2*pi*f1*m*ts);
 x2(i) = b * sin(2*pi*f2*m*ts);
 i = i + 1;
 end

x_comb = x1 + x2;
X1 = dft(x1, N);
X2 = dft(x2, N);
X_comb_direct = dft(x_comb, N);
X_sum = X1 + X2;
X_sum_Mag=abs(X_sum);
X_comb_direct_Mag=abs(X_comb_direct);

% Verify DFT Linearity property:
DFT_Linearity_error = max(abs(X_comb_direct - X_sum));
if DFT_Linearity_error < 1e-6
   disp('DFT Linearity is proved.');
else
   disp('DFT Linearity is not proved.');
end
figure(1)
plot(1:N,x1,'r--o'); grid on;
xlabel('Time (millisecond)');
ylabel('Signal amplitude')
title('x-seq1 signal versus time');
 
figure(2)
plot(1:N,x2,'b--o');
grid on;
xlabel('Time (millisecond)');
ylabel('Signal amplitude')
title('x-seq2 signal versus time');
 
figure(3)
stem(0:N-1,X_comb_direct_Mag);
grid on;
xlabel('Time (millisecond)');
ylabel('Signal amplitude')
title('Combinational Sum of signal versus time');
 
figure(4)
stem(0:N-1,X_sum_Mag);
grid on;
xlabel('Time (millisecond)');
ylabel('Signal amplitude')
title('Combinational Sum of signal versus time');
 
 %DFT Function.....below,
function X = dft(x, N)
 X = zeros(1, N);
 for k = 0:N-1
 X(k+1) = 0;
 for n = 0:N-1
 X(k+1) = X(k+1) + x(n+1) * exp(-1j* 2 * pi * k * n / N);
 end
 end
end