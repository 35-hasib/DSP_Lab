clc;
N = 64;
fs = 64000;
ts = 1/fs;

n = 0: N-1;
x = 8*sin(2*pi*3300*n*ts) + 6*sin(2*pi*3700*ts);
X = dft(x,N);

w_hamm = transpose(hamming(N));
%w_hamm = 0.54 - 0.46*cos(2*pi*n/(N-1));
w_hann = transpose(hanning(N));
% 0.5 -0.5*cos(2*pi*n/(N-1))
%w_black = transpose(blackman(N));
w_black = 0.42 - 0.5*cos(2*pi*n/(N-1)) + 0.08*cos(4*pi*n/(N-1));
x_hamm = x.* w_hamm;
X_hamm = dft(x_hamm,N);
x_hann = x.* w_hann;
X_hann = dft(x_hann,N);
x_black = x.* w_black;
X_black = dft(x_black,N);

figure(1)
stem(n,x(1:N))
figure(2)
stem(n,abs(X(1:N)))
figure(3)
stem(n,w_hamm(1:N))
figure(4)
stem(n,x_hamm(1:N))
figure(5)
stem(n,abs(X_hamm(1:N)))

figure(6)
stem(n,w_hann(1:N))
figure(7)
stem(n,x_hann(1:N))
figure(8)
stem(n,abs(X_hann(1:N)))

figure(9)
stem(n,w_black(1:N))
figure(10)
stem(n,x_black(1:N))
figure(11)
stem(n,abs(X_black(1:N)))

