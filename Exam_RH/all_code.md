Ans

```matlab
clc; close all;
plain =  load('plain'); %Data
figure(1)
plot(plain)

L = 512;

%Voice Signal
figure(2)
n = 8000 : 8000+L-1;
v_seg = plain(n);
subplot(3,1,1)
plot(n,v_seg)

subplot(3,1,2)
v_exp = abs(fft(v_seg).^2);
plot(n,v_exp)

subplot(3,1,3)
plot(n,real(ifft(v_exp)))

%Non Voice Signal
figure(3)
n = 3000 : 3000+L-1;
nv_seg = plain(n);
subplot(3,1,1)
plot(n,nv_seg)

subplot(3,1,2)
nv_exp = abs(fft(nv_seg).^2);
plot(n,nv_exp)

subplot(3,1,3)
plot(n,real(ifft(nv_exp)))

%Filter Using Hamming
n = 0:L-1;
hamm = (hamming(L));
%Voice
v_hamm = v_seg .*hamm;
figure(4)
v_hamm_exp = abs(fft(v_hamm).^2);
v_hamm_real = real(ifft(v_hamm_exp));

subplot(2,1,1)
plot(n,v_hamm_exp)
subplot(2,1,2)
plot(n,v_hamm_real)

%Non voice
nv_hamm = nv_seg .*hamm;
figure(5)
nv_hamm_exp = abs(fft(nv_hamm).^2);
nv_hamm_real = real(ifft(nv_hamm_exp));

subplot(2,1,1)
plot(n,nv_hamm_exp)
subplot(2,1,2)
plot(n,nv_hamm_real)

%Filter Using Hanning
n = 0:L-1;
hamm = (hanning(L));
%Voice
v_hamm = v_seg .*hamm;
figure(6)
v_hamm_exp = abs(fft(v_hamm).^2);
v_hamm_real = real(ifft(v_hamm_exp));

subplot(2,1,1)
plot(n,v_hamm_exp)
subplot(2,1,2)
plot(n,v_hamm_real)

%Non voice
nv_hamm = nv_seg .*hamm;
figure(7)
nv_hamm_exp = abs(fft(nv_hamm).^2);
nv_hamm_real = real(ifft(nv_hamm_exp));

subplot(2,1,1)
plot(n,nv_hamm_exp)
subplot(2,1,2)
plot(n,nv_hamm_real)
```
