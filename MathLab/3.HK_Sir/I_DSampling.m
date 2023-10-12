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
stem(t,x(1:L));

m = 0 : L*I/D -1;
subplot(2,1,2)
stem(m,y(1:L*I/D))
