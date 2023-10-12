N = 8;
f1 = 1000;
f2 = 2000;
fs = 8000;
ts = 1 / fs;
ind = 1;
x = zeros(1, N);
for n = 0:N - 1
 k = n;
 x(ind) = sin(2 * pi * f1 * k * ts) + 0.5 * sin(2 * pi * f2 * k * ts + (3 * pi / 4));
 ind = ind + 1;
end
t = 0:N - 1;
X = dft(x, N);
X_mag=abs(X);
shift_amount = 3;
k = 0:N-1;
phase_shift = exp(1i * 2 * pi * k * shift_amount / N);
X_shifted = X .* phase_shift;
X_shifted_real = real(X_shifted);
X_shifted_imag = imag(X_shifted);
 X_phase_radians = atan2(X_shifted_imag, X_shifted_real);
 phase_thresholds = [0, -30, 30, -45, 45, -60, 60, -90, 90];
X_phase_radians(~ismembertol(X_phase_radians, deg2rad(phase_thresholds), 1e-6)) = 0;
X_phase_degrees = rad2deg(X_phase_radians);
X_shifted_mag = abs(X_shifted);
figure(1)
stem(t, X_shifted_mag);
grid minor;
title('Shifted Magnitude part ');
xlabel('KHz');
ylabel('Amplitude');
figure(2)
stem(t, X_shifted_real);
grid minor;
title('Shifted Real Part');
xlabel('KHz');
ylabel('Amplitude');
figure(3)
stem(t, X_shifted_imag);
grid minor;
title('Shifted Imaginary Part');
xlabel('KHz');
ylabel('Amplitude');
figure('Name','Phase Angle')
stem(t, X_phase_degrees);
grid minor;
title('Shifted Phase Angle');
xlabel(' KHz');
ylabel('Amplitude');
DFT_Shifting_error = max(abs(X_mag - X_shifted_mag));
 if DFT_Shifting_error < 1e-6
 disp('DFT Shifting is proved.');
 else
 disp('DFT Shifting is not proved.');
 end
function X = dft(x, N)
 X = zeros(1, N);
 for k = 0:N-1
 X(k+1) = 0;
 for n = 0:N-1
 X(k+1) = X(k+1) + x(n+1) * exp(-1j* 2 * pi * k * n / N);
 end
 end
end
