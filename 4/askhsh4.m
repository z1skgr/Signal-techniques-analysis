%Askisi 1
clc;
clear all;

Wc=0.4*pi;
Fs=100;
N=21;

Fc=Wc/(2*pi);
Ws=Fc/(Fs/2);

rectF=fir1(N-1,Ws,rectwin(N));
hamF=fir1(N-1,Ws,hamming(N));


[h1,W1]=freqz(rectF);
[h2,W2]=freqz(hamF);
figure (1);
plot(W1,abs(h1),W2,abs(h2));
legend('Rectangular','Hamming');
xlabel('Frequency Hz');
ylabel('Magnitude |Filter|');
title('Hamming & Rectangular window Frequency response ');

%Askisi 2
Wc=0.5*pi;
Fs=100;
N1=21;
N2=41;

Fc=Wc/(2*pi);
Ws=Fc/(Fs/2);


hamm21=fir1(N1-1,Ws,hamming(N1));
hamm41=fir1(N2-1,Ws,hamming(N2));
hann21=fir1(N1-1,Ws,hann(N1));
hann41=fir1(N2-1,Ws,hann(N2));

[h2_1,W2_1]=freqz(hamm21);
[h2_2,W2_2]=freqz(hamm41);
[h2_3,W2_3]=freqz(hann21);
[h2_4,W2_4]=freqz(hann41);

figure(2);
subplot(1,2,1);
plot(W2_1*Fs/2/pi,abs(h2_1));
xlabel('Frequency Hz');
ylabel('Magnitude |Filter|');
title('Hamming N=21');
subplot(1,2,2);
plot(W2_2,abs(h2_2));
xlabel('Frequency Hz');
ylabel('Magnitude |Filter|');
title('Hamming N=41');

figure(3);
subplot(1,2,1);
plot(W2_3*Fs/2/pi,abs(h2_3));
xlabel('Frequency Hz');
ylabel('Magnitude |Filter|');
title('Hanning N=21');
subplot(1,2,2);
plot(W2_4*Fs/2/pi,abs(h2_4));
xlabel('Frequency Hz');
ylabel('Magnitude |Filter|');
title('Hanning N=41');


%Meros B

Fs=100;
Ts=1/Fs;
N=500;
n=0:N-1;
nF=1024;

F=-Fs/2:Fs/nF:Fs/2-Fs/nF;


x=sin(15*n*Ts)+0.25*sin(200*n*Ts);

xF=fftshift(fft(x,nF)*Ts);
figure(4);
plot(F,abs(xF));
xlabel('Frequency(Hz)');
ylabel('Values X(F)');
title('Fourier Transformation of x(t)');


filter1=filter(hamm21,1,x);
filter2=filter(hamm41,1,x);
filter3=filter(hann21,1,x);
filter4=filter(hamm41,1,x);

xF1=fftshift(fft(filter1,nF)*Ts);
xF2=fftshift(fft(filter2,nF)*Ts);
xF3=fftshift(fft(filter3,nF)*Ts);
xF4=fftshift(fft(filter4,nF)*Ts);

figure(5);
plot(F,abs(xF1));
xlabel('Frequency(Hz)');
ylabel('Values filtered X(F)');
title('Filtered Fourier Transformation x(t) with Hamming(21) window');

figure(6);
plot(F,abs(xF2));
xlabel('Frequency(Hz)');
ylabel('Values filtered X(F)');
title('Filtered Fourier Transformation x(t) with Hamming(41) window');

figure(7);
plot(F,abs(xF3));
xlabel('Frequency(Hz)');
ylabel('Values filtered X(F)');
title('Filtered Fourier Transformation x(t) with Hanning N(21) window');

figure(8);
plot(F,abs(xF4));
xlabel('Frequency(Hz)');
ylabel('Values filtered X(F)');
title('Filtered Fourier Transformation x(t) with Hanning N(41) window');

%Meros C
Fs=50;
Ts=1/Fs;
nF=1024;

N1=21;
N2=41;
Wc=0.5*pi;
Fc=Wc/(2*pi);
Ws=Fc/(Fs/2);
x=sin(15*n*Ts)+0.25*sin(200*n*Ts);
F=-Fs/2:Fs/nF:Fs/2-Fs/nF;

hamm21=fir1(N1-1,Ws,hamming(N1));
hamm41=fir1(N2-1,Ws,hamming(N2));
hann21=fir1(N1-1,Ws,hann(N1));
hann41=fir1(N2-1,Ws,hann(N2));

filter1=filter(hamm21,1,x);
filter2=filter(hamm41,1,x);
filter3=filter(hann21,1,x);
filter4=filter(hamm41,1,x);

xF1=fftshift(fft(filter1,nF)*Ts);
xF2=fftshift(fft(filter2,nF)*Ts);
xF3=fftshift(fft(filter3,nF)*Ts);
xF4=fftshift(fft(filter4,nF)*Ts);

x=sin(15*n*Ts)+0.25*sin(200*n*Ts);
F=-Fs/2:Fs/nF:Fs/2-Fs/nF;

xF=fftshift(fft(x,nF)*Ts);
figure(9);
plot(F,abs(xF));
xlabel('Frequency(Hz)');
ylabel('Values X(F)');
title('Fourier Transformation of x(t)');

figure(10);
plot(F,abs(xF1));
xlabel('Frequency(Hz)');
ylabel('Values filtered X(F)');
title('Filtered Fourier Transformation x(t) with Hamming(21) window');

figure(11);
plot(F,abs(xF2));
xlabel('Frequency(Hz)');
ylabel('Values filtered X(F)');
title('Filtered Fourier Transformation x(t) with Hamming(41) window');

figure(12);
plot(F,abs(xF3));
xlabel('Frequency(Hz)');
ylabel('Values filtered X(F)');
title('Filtered Fourier Transformation x(t) with Hanning N(21) window');


figure(13);
plot(F,abs(xF4));
xlabel('Frequency(Hz)');
ylabel('Values filtered X(F)');
title('Filtered Fourier Transformation x(t) with Hanning N(41) window');

