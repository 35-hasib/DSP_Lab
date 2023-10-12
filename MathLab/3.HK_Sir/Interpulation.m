clc;
I = input('Enter Interpulation Factor : ');
L = input('Enter Length of the Signsl : ');
f1 = input('Enter F1 : ');
f2 = input('Enter F2 : ');

t = 0 : L-1;
x = sin(2*pi*f1*t) + sin(2*pi*f2*t);
y = interp(x,I);   %% interp(signal, factor) IMP

subplot(2,1,1)
stem(t,x(1:L));

m = 0 : L*I-1;
subplot(2,1,2)
stem(m,y(1:L*I)); 