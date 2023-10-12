clc;
D = input('Enter Decimation Factor : ');
L = input('Enter Length of Signal : ');
f1 = input('Enter F1 : ');
f2 = input('Enter F2 : ');

t = 0 : L-1;
x = sin(2*pi*f1*t) + sin(2*pi*f2*t);
y = decimate(x,D,'fir');            %% decimate(signal, factor) IMP

subplot(2,1,1)
stem(t,x(1:L));

m = 0 : L/D-1;
subplot(2,1,2)
stem(m,y(1:L/D));