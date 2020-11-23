%Askisi
clc;
clear all;
close all;

Fs=10000;
Wp=2*pi*1000;
Ws=2*pi*4000;
Rp=3;
Atten=30;

[n,Wn]=buttord(Wp,Ws,Rp,Atten,'s');
t=sprintf('The minimum order of the analog Butterworth filter is: %d',n)



%Askisi 2
n1=2;
n2=16;
Ts=0.2;
Fs=1/Ts;
Wc=2;
Fc=Wc/(2*pi);
Wp=Fc/(Fs/2);
Rp=3;
N2=256;
Freq=0:1/(N2-1):1;

[b1,a1] = cheby1(n1,Rp,Wp,'high');
digital1=freqz(b1,a1,N2);

[b2,a2] = cheby1(n2,Rp,Wp,'high');
digital2=freqz(b2,a2,N2);


%Askisi 3
Fs=10000;
Ts=1/Fs;
F1=500/pi;
F2=8000/pi;
F3=15000/pi;
N3=500;
n=0:N3-1;
x1=1+cos(2*pi*F1*n*Ts)+cos(2*pi*F2*n*Ts)+cos(2*pi*F3*n*Ts);

stem(n,x1);
fx=-Fs/2:Fs/N3:Fs/2-1;
Xf=fftshift(fft(x1));
stem(fx,Xf);