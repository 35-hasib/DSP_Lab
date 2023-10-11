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
__Set 2__
---
```matlab
clc;
N = 8;
fs = 8000;
ts = 1/fs;

n = 0:N-1;
x = sin(2*pi*1000*n*ts) + 0.5 * sin(2*pi*2000*n*ts + (3*pi/4));

% 2. A
figure(1)
subplot(2,1,1)
plot(n,x(1:8))
subplot(2,1,2)
stem(n,x(1:N))

% 2. B
figure(2)
subplot(2,1,1)
plot(3:10,x(1:8))
subplot(2,1,2)
stem(3:10,x(1:N))

%2. C
X = dft(x,N);
X_meg = abs(X);

shift_value = 3;
k = 0:N-1;
X_shift = X .* exp(1j*2*pi*k*shift_value/N);

X_shift_real = real(X_shift);
X_shift_imag = imag(X_shift);
X_shift_meg = sqrt(X_shift_real.^2 + X_shift_imag.^2);
X_shift_angle = atan2(X_shift_imag, X_shift_real);

th = [0,-30,30,-45,45,-60,60,-90,90];
X_shift_angle(~ismembertol(X_shift_angle, deg2rad(th), 1e-6)) =0;
X_shift_deg = rad2deg(X_shift_angle);

figure(3)
subplot(2,2,1)
stem(n,X_shift_meg(1:N))
title('Shifted Megnetude')
subplot(2,2,3)
stem(n,X_shift_imag(1:N))
title('Shifted Imaginary ')
subplot(2,2,2)
stem(n,X_shift_real(1:N))
title('Shifted Real')
subplot(2,2,4)
stem(n,X_shift_deg(1:N))
title('Shifted Phase')

if max(abs(X_shift_meg - X_meg)) < 1e-6
    disp('Shifting Property is Proved !!');
else
    disp('Shifting Property is not Proved !!');
end

```
