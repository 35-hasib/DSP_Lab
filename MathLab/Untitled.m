clc; close all;
wc = 0.5*pi;
N = 24;

w = 0:0.01:pi;
b = fir1(N,wc/pi,kaiser(N+1, 4.5));
h = freqz(b,1,w);
plot(w/pi, abs(h))
grid;