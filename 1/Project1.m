%Askisi 1
%Meros 1
n=[-15:10];
z1=5+3*(-n+3).*((-n+3)>0)-2*(n==0)+sin(n);
z2=((n-3)>0)+cos(n);

figure(1);
stem(n,z1);
title('Signal z1(n)');
xlabel('Time n');
ylabel('Values of z1(n)');

figure(2);
stem(n,z2);
title('Signal z2(n)');
xlabel('Time n');
ylabel('Values of z2(n)');

%Xrhsimopoioume thn synarthsh tou matlab gia synelixh(conv)

figure(3);
z3=conv(z1,z2);
time=2*n(1):2*n(end);
stem(time,z3);
title('Conv using matlab command conv ');
xlabel('Time n');
ylabel('Values of x(n)*y(n)');

%Ekteloume synelixh xwris thn entolh conv
z1Len=length(z1);
z2Len=length(z2);
convLen=z1Len+z2Len-1;
z4=zeros(1,convLen);
for i=1:convLen
    for j=1:convLen 
        if((i-j)>0 && (i-j)<=z2Len && (j)<=z1Len)
            z4(i)= z4(i)+(z1(j).*z2(i-j));
            end
    end
end
figure(4);
stem(time,z4);
title('Conv without using matlab conv ');
xlabel('Time n');
ylabel('Values of z1(n)*z2(n)');

%Meros 2
n=[-15:10];
z1=5+3*(-n+3).*((-n+3)>0)-2*(n==0)+sin(n);
z2=((n-3)>0)+cos(n);
z3=conv(z1,z2);
time=2*n(1):2*n(end);
figure(5)
stem(time,z3);
title('Conv using matlab command conv ');
xlabel('Time n');
ylabel('Values of z1(n)*z2(n)');

Z1=fft(z1,length(time));
Z2=fft(z2,length(time));
Z3=Z1.*Z2;

Z=ifft(Z3);
figure(6);
stem(time,Z);
title('Conv Z3 with ifft of F(z1)*F(z2)');
xlabel('Time n');
ylabel('Values of z1(n)*z2(n)');


%Askhsh 2
t=0:0.00001:0.5;
x=5*cos(24*pi*t)-2*sin(1.5*pi*t);
figure(7);
plot(t,x);
title('Signal x(t)');
xlabel('Time t');
ylabel('Values of x(t)');


Ts1=1/48;
t1=0:Ts1:0.5;
x1=5*cos(24*pi*t1)-2*sin(1.5*pi*t1);
figure(8);
plot(t,x);
title('Signal x1(t)(Sampling signal)');
xlabel('Time t');
ylabel('Values of x1(t)');
hold on;
stem(t1,x1,'r');
hold off;

Ts2=1/24;
t2=0:Ts2:0.5;
x2=5*cos(24*pi*t2)-2*sin(1.5*pi*t2);
figure(9);
plot(t,x);
title('Signal x2(t)(Sampling signal)');
xlabel('Time t');
ylabel('Values of x2(t)');

hold on;
stem(t2,x2,'g');
hold off;

Ts3=1/12;
t3=0:Ts3:0.5;
x3=5*cos(24*pi*t3)-2*sin(1.5*pi*t3);
figure(10);
plot(t,x);
title('Signal x3(t)(Sampling signal)');
xlabel('Time t');
ylabel('Values of x3(t)');

hold on;
stem(t3,x3,'r');
hold off;

%Askisi 3
%Meros a
Fs=100;
Ts=1/Fs;
t=0:0.01:0.5;
x=10*cos(40*pi*t)-4*sin(80*pi*t+5);
figure(11);
plot(t,x);
title('Signal x(t)');
xlabel('Time t');
ylabel('Value x(t)');

N=128;
n=0:N-1;
x1=10*cos(40*pi*n*Ts)-4*sin(80*pi*n*Ts+5);
figure(12);
stem(n,x1,'r')
title('Signal x1(nTs)');
xlabel('Time t');
ylabel('Value x1(nTs)');

y=fftshift(abs(fft(x1)));

figure(12);
stem(-Fs/2:Fs/N:Fs/2-Fs/N,y);
title('FFT graph');
xlabel('Frequency Hz');
ylabel('Value of FFT');

%Meros B
f=5;
Fs=8000;
Ts=1/Fs;
N=250;
n=0:N-1;
for F=100:125:475
   g=sin(2*pi*F*n*Ts+f);
   figure;
   Flim=-Fs/2:Fs/N:Fs/2-1; %frequency axis
   G=fftshift(fft(g));  %Fourier transform
   figure;
   stem(Flim,G);
   title('FFT graph');
   xlabel('Frequency Hz');
   ylabel('Value of FFT');
end

f=5;
Fs=8000;
Ts=1/Fs;
N=250;
n=0:N-1;
for F=7525:125:7900
    g=sin(2*pi*F*n*Ts+f);
    figure;
    Flim=-Fs/2:Fs/N:Fs/2-1;
    G=fftshift(fft(g));
    figure;
    stem(Flim,G);
    title('FFT graph');
    xlabel('Frequency Hz');
    ylabel('Value of FFT');
end
