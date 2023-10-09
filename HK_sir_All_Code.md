1. Decimation
---
```matlab
clc;
D = input('Enter Decimation Factor : ');
l = input('Enter Length of Signal : ');
f1 = input('Enter F1 : ');
f2 = input('Enter F2 : ');

t = 0 : l-1;
x = sin(2*pi*f1*t) + sin(2*pi*f2*t);
y = decimate(x,D,'fir');            %% decimate(signal, factor) IMP

subplot(2,1,1)
stem(x);
subplot(2,1,2)
stem(y);
```
1. Interpulation
---
```matlab
clc;
I = input('Enter Interpulation Factor : ');
l = input('Enter Length of the Signsl : ');
f1 = input('Enter F1 : ');
f2 = input('Enter F2 : ');

t = 0 : l-1;
x = sin(2*pi*f1*t) + sin(2*pi*f2*t);
y = interp(x,I);   %% interp(signal, factor) IMP

subplot(2,1,1)
stem(x);

subplot(2,1,2)
stem(y);
```
3. I_DSampling
---
```matlab
clc;
I = input('Upsampling Factor    : ');
D = input('Downsampling Factor  : ');
L = input('Langth of thr Signal : ');
f1 = input('F1 : ');
f2 = input('F2 : ');

t = 0 : L-1;
x = sin(2*pi*f1*t) + sin(2*pi*f2*t);
y = resample(x,I,D);

subplot(2,1,1)
stem(t,x);

% m = 0 : L*I/D -1;
subplot(2,1,2)
stem(y)
```
4. LowPassFilter
---
```matlab
clc;           %Given,
wc = 0.5 * pi;       % The signal cutoff frequency is 0.5 Hz 
N = 25;              % The number of samples are 25.

w = 0 : 0.1 : pi;
b = fir1(N,wc/pi,blackman(N+1));
h = freqz(b, 1, w);

subplot(2,2,1)
plot(w/pi, abs(h));
title('BLACKMAN');
grid on;

%For hamming(N+1)
%For hanning(N+1)
%For kaiser(N+1,3.5)
```
