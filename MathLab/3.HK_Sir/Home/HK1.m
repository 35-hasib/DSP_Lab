clc; close all;
I = 3;
D = 2;
L = 100;
f1 = 0.02;
f2 = 0.03;

t = 0:L-1;
x = sin(2*pi*f1*t) + sin(2*pi*f2*t);

y = resample(x,I,D);
m = 0 : L*I/D-1;
subplot(2,1,1)
stem(t,x(1:L))
xlabel('Time')
ylabel('Amplitude')

subplot(2,1,2)
stem(m,y(1:L*I/D))
xlabel('Time')
ylabel('Amplitude')
