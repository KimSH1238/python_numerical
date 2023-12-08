% Parameter 
A = 2; % Amplitude
tau = [1,2,3,4]; % tau = 1, 2, 3, 4
t = -5 : 0.01 : 5;

%%FFT
N1 = 128;
N2 = 256;
Ts = 0.01;
Fs = 1/Ts;

y_1 = A * rectangularPulse(t  / tau(1) + 1/2) - A * rectangularPulse(  t  / tau(1) - 1/2);
y_2 = A * rectangularPulse(t  / tau(2) + 1/2) - A * rectangularPulse(  t  / tau(2) - 1/2);
y_3 = A * rectangularPulse(t  / tau(3) + 1/2) - A * rectangularPulse(  t  / tau(3) - 1/2);
y_4 = A * rectangularPulse(t  / tau(4) + 1/2) - A * rectangularPulse(  t  / tau(4) - 1/2);


f1_64 = [-N1/2 : N1/2-1] * (Fs/N1);
f1_512 = [-N2/2 : N2/2-1] * (Fs/N2);

% y_1
X_FFT_1 = fftshift(abs(fft(y_1,N1)))/N1;
X_FFT_2 = fftshift(abs(fft(y_1,N2)))/N2;

% y_2
X_FFT_3 = fftshift(abs(fft(y_2,N1)))/N1;
X_FFT_4 = fftshift(abs(fft(y_2,N2)))/N2;

% y_3
X_FFT_5 = fftshift(abs(fft(y_3,N1)))/N1;
X_FFT_6 = fftshift(abs(fft(y_3,N2)))/N2;

% y_4
X_FFT_7 = fftshift(abs(fft(y_4,N1)))/N1;
X_FFT_8 = fftshift(abs(fft(y_4,N2)))/N2;


figure
subplot(2,4,1);
plot(f1_64, X_FFT_1, '-');
xlabel('Freq. [Hz]');
ylabel('Magnitude');

subplot(2,4,5);
plot(f1_512, X_FFT_2, '-');
xlabel('Freq. [Hz]');
ylabel('Magnitude');

subplot(2,4,2);
plot(f1_64, X_FFT_3, '-');
xlabel('Freq. [Hz]');
ylabel('Magnitude');

subplot(2,4,6);
plot(f1_512, X_FFT_4, '-');
xlabel('Freq. [Hz]');
ylabel('Magnitude');

subplot(2,4,3);
plot(f1_64, X_FFT_5, '-');
xlabel('Freq. [Hz]');
ylabel('Magnitude');

subplot(2,4,7);
plot(f1_512, X_FFT_6, '-');
xlabel('Freq. [Hz]');
ylabel('Magnitude');


subplot(2,4,4);
plot(f1_64, X_FFT_7, '-');
xlabel('Freq. [Hz]');
ylabel('Magnitude');

subplot(2,4,8);
plot(f1_512, X_FFT_8, '-');
xlabel('Freq. [Hz]');
ylabel('Magnitude');