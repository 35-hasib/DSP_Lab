clc;close all;
wc = 0.5*pi;
N = 24;

w = 0:0.01:pi;

b = fir1(N,wc/pi,hamming(N+1));
h = freqz(b,1,w);

subplot(2,2,1)
plot(w/pi, abs(h))
title('Hamming')
grid;
b = fir1(N,wc/pi,hanning(N+1));
h = freqz(b,1,w);

subplot(2,2,2)
plot(w/pi, abs(h))
title('Hanning')
grid;
b = fir1(N,wc/pi,blackman(N+1));
h = freqz(b,1,w);

subplot(2,2,3)
plot(w/pi, abs(h))
title('Blackman')
grid;
b = fir1(N,wc/pi,kaiser(N+1, 3.5));
h = freqz(b,1,w);

subplot(2,2,4)
plot(w/pi, abs(h))
title('Kaiser')
grid;