%Askisi 1
clc;
clear all;
close all;

Fs=10000;
Wp=2*pi*3000;
Ws=2*pi*4000;
Rp=3;
Atten1=30;

[o1,Wn1]=buttord(Wp,Ws,Rp,Atten1,'s');
[z,p,k]=buttap(o1);
[num1,den1]=zp2tf(z,p,k);
[Num1,Den1]=lp2lp (num1,den1,Wn1);
disp('The order of the filter is');
disp(o1);

N1=2048;
F=0:(Fs/2)/N1:Fs/2-(Fs/2)/N1;

[h1,W1]=freqs(Num1,Den1,2*pi*F);
[NumZ1,DenZ1]=bilinear(Num1,Den1,Fs);
[h2,W2]=freqz(NumZ1,DenZ1,N1);

figure(1);
plot(F,20*log10(abs(h1)),'m:',F,20*log10(abs(h2)));
title('Lowpass Butterworth Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('Analog','Digital');

Atten2=50;
[o2,Wn2]=buttord(Wp,Ws,Rp,Atten2,'s');
disp('The order of the filter is:');
disp(o2);
[z,p,k] = buttap(o2);
[num2,den2] = zp2tf(z,p,k);
[Num2,Den2] = lp2lp (num2,den2,Wn2);

[h3,W3]=freqs(Num2,Den2,2*pi*F);
[NumZ2,DenZ2]=bilinear(Num2,Den2,Fs);
[h4,W4]=freqz(NumZ2,DenZ2,N1);

figure(2);
plot(F,20*log10(abs(h3)),'m:',F,20*log10(abs(h4)));
title('Lowpass Butterworth Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('Analog','Digital');


%Askisi 2
t1=2;
t2=16;
Ts=0.2;
Fs=1/Ts;
Wc=2;
Fc=Wc/(2*pi);
Wp=Fc/(Fs/2);
Rp=3;
N2=256;
Freq=0:(1/N2):1-(1/N2);

[b1,a1]=cheby1(t1,Rp,Wp,'high');
[b2,a2]=cheby1(t2,Rp,Wp,'high');
[h5,W5]=freqz(b1,a1,N2);
[h6,W6]=freqz(b2,a2,N2);

figure(3);
plot(Freq,20*log10(abs(h5)),'m:',Freq,20*log10(abs(h6)));
title('Highpass Chebyshev Filter');
legend('2nd order', '16th order');
ylabel('Magnitude (dB)');
xlabel('Frequency (radians/sample)');

%Askisi 3
%Meros A
Fs=10000;
Ts=1/Fs;
N3=500;
n=0:N3-1;
x1=1+cos(1000*n*Ts)+cos(16000*n*Ts)+cos(30000*n*Ts);

figure(4);
stem(n,x1);
title('Sampling x1(t)');
xlabel('Frequency(Hz)');
ylabel('Values of x1(t)');

Fs=10000;
Fx=-Fs/2:Fs/N3:(Fs/2)-(Fs/N3);

X1_fourier=fftshift(fft((x1)));
figure(5);
stem(Fx,abs(X1_fourier));
title('FFT of x1(t)');
xlabel('Frequency(Hz)');
ylabel('FFT values of x1(t)');

X1_filtred1=filter(NumZ1,DenZ1,x1);
figure(6);
stem(Fx,fftshift(abs(fft(X1_filtred1))));
xlabel('Frequency(Hz)');
ylabel('Values of function');
title('Fourier transform of x1(t) filtred #1');

X1_filtred2=filter(NumZ2,DenZ2,x1);
figure(7);
stem(Fx,fftshift(abs(fft(X1_filtred2))));
xlabel('Frequency(Hz)');
ylabel('Values of function');
title('Fourier transform of x1(t) filtred #2');

%Meros B
Ts=0.2;
Fs=1/Ts;
N3=500;
n=0:N3-1;
x2=1+cos(1.5*n*Ts)+cos(5*n*Ts);
Fx=-Fs/2:Fs/N3:Fs/2-(Fs/N3);

figure(8);
stem(n,x2);
title('Sampling x2(t)');
xlabel('Frequency(Hz)');
ylabel('Values of x2(t)');


X2_fourier=fftshift(fft(x2));
figure(9);
stem(Fx,abs(X2_fourier));
xlabel('Frequency(Hz)');
ylabel('FFT values of x2(t)');
title('Fourier transform of x2(t)');

X2_filtred=filter(b2,a2,x2);   % filtered Fourier transform
figure(10);
stem(Fx,fftshift(abs(fft(X2_filtred))));
xlabel('Frequency(Hz)');
ylabel('Values of function');
title('Filtered Fourier transform of x(t)');