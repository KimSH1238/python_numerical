% Parameter 
Ts = 0.005; % or 0.05
t = 0 : Ts : 2*pi; 
%%FFT
N1 = 32;
N2 = 512;
Fs = 1/Ts;

x1 = sin(20*pi.*t) .* sin(15*pi.*t);
x2 = sin(20*pi.*t).*sin(20*pi.*t) + 2*(sin(15*pi.*t) .* sin(15*pi.*t));


f1_32 = [-N1/2 : N1/2-1] * (Fs/N1);
f1_512 = [-N2/2 : N2/2-1] * (Fs/N2);


X_FFT_1 = fftshift(abs(fft(x1,N1)))/N1;
X_FFT_2 = fftshift(abs(fft(x2,N1)))/N1;

X_FFT_3 = fftshift(abs(fft(x1,N2)))/N2;
X_FFT_4 = fftshift(abs(fft(x2,N2)))/N2;


figure
subplot(2,4,1);
plot(t, x1, '-');
xlabel('Time. [s]');
ylabel('Magnitude');

subplot(2,4,5);
plot(f1_32, X_FFT_1, '-');
xlabel('Freq. [Hz]');
ylabel('Magnitude');

subplot(2,4,2);
plot(t, x2, '-');
xlabel('Time. [s]');
ylabel('Magnitude');

subplot(2,4,6);
plot(f1_32, X_FFT_2, '-');
xlabel('Freq. [Hz]');
ylabel('Magnitude');

subplot(2,4,3);
plot(t, x1, '-');
xlabel('Time. [s]');
ylabel('Magnitude');

subplot(2,4,7);
plot(f1_512, X_FFT_3, '-');
xlabel('Freq. [Hz]');
ylabel('Magnitude');

subplot(2,4,4);
plot(t, x2, '-');
xlabel('Time. [s]');
ylabel('Magnitude');

subplot(2,4,8);
plot(f1_512, X_FFT_4, '-');
xlabel('Freq. [Hz]');
ylabel('Magnitude');

