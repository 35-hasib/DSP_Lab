clc;           %Given,
wc = 0.5 * pi;       % The signal cutoff frequency is 0.5 Hz 
N = 25;              % The number of samples are 25.

w = 0 : 0.1 : pi;
a = 1;
b = fir1(N,wc/pi,blackman(N+1));
h = freqz(b, a, w);

subplot(2,2,1)
plot(w/pi, abs(h));
title('BLACKMAN');
grid on;

%For hamming(N+1)
%For hanning(N+1)
%For kaiser(N+1,3.5)
