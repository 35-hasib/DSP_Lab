__Set 1__
```matlab
clc;
N = 16;
fs = 16000;
ts = 1/fs;

n = 0:N-1;
x1 = 2*sin(2*pi*1000*n*ts);
x2 = 5*sin(2*pi*3000*n*ts);

%1. A
figure(1)
subplot(2,1,1)
stem(n,x1(1:N))
title('Signal 1')
subplot(2,1,2)
stem(n,x2(1:N))
title('Signal 2')

x = x1+x2;
x_sum = dft(x,N);
x_sum_meg = abs(x_sum);

X1 = dft(x1,N);
X2 = dft(x2,N);
X_sum = X1+X2;
X_sum_meg = abs(X_sum);

%1. C
if max(abs(X_sum_meg - x_sum_meg)) < 1e-6
    disp('Proved !!');
else
    disp('Not Proved !!');
end

%1. B
% Megnetude
figure(2)
subplot(2,1,1)
stem(n,x_sum_meg(1:N))
title('Megnetude of X3');
subplot(2,1,2)
stem(n,X_sum_meg(1:N))

%Phase
x_real = real(x_sum);
x_imag = imag(x_sum);
x_meg = sqrt(x_real.^2 + x_imag.^2);
x_phase = atan2(x_imag, x_real);

th = [-90,90];
x_phase(~ismembertol(x_phase, deg2rad(th), 1e-6)) = 0; %IMP

x_phase_deg = rad2deg(x_phase);

figure(3)
subplot(2,1,1)
stem(n,x_phase_deg(1:N))
title('Phase of x3')
subplot(2,1,2)
stem(n,x_meg(1:N))
title('Megnetude of x3')

```
