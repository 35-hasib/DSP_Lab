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
X_ang_deg = dft_ang(X,N);

shift_value = 3;
k = 0:N-1;
X_shift = X .* exp(1j*2*pi*k*shift_value/N);

X_shift_real = real(X_shift);
X_shift_imag = imag(X_shift);
%X_shift_meg = sqrt(X_shift_real.^2 + X_shift_imag.^2);
X_shift_meg = abs(X_shift);
%X_shift_angle = atan2(X_shift_imag, X_shift_real);

%th = [0,-30,30,-45,45,-60,60,-90,90];
%X_shift_angle(~ismembertol(X_shift_angle, deg2rad(th), 1e-6)) =0;
%X_shift_deg = rad2deg(X_shift_angle);

X_shift_deg = dft_ang(X_shift,N);

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

figure(4)
stem(n,X_ang_deg(1:N))

if max(abs(X_shift_meg - X_meg)) < 1e-6
    disp('Shifting Property is Proved !!');
else
    disp('Shifting Property is not Proved !!');
end
