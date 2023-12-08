clear all
close all
clc



%% Runge-Kutta x(t)
w = 10; F0 = 100;
m = 10; c = 20; k = 4000; % 초기값

dt = 0.005; % 시간 간격
t = [0:dt:10]; %% 시간
A = [0 1; -k/m -c/m];
f = 2*rand(1,length(t))-1;  % 힘을 랜덤으로 주었을때 비교를위해서
% f = 2*sin(2*pi*t); % 힘 조건 fft와 cpsd 특성 비교

%% 룽게 쿠타
y0 = [0;
    0];
for n = 1 : length(t)-1
    
    b0=[0;f(n)/m];
    b1=[0;f(n+1)/m];
    
    k1 = A*y0+b0;
    k2 = A*(y0+k1*dt/2)+(b0+b1)/2;
    k3 = A*(y0+k2*dt/2)+(b0+b1)/2;
    k4 = A*(y0+k3*dt)+b1;
    y1 = y0+(dt/6)*(k1+2*k2+2*k3+k4);
    x(n+1) = y1(1,1); x_prime(n+1) = y1(2,1);
    y0 = y1;
end

%% 룽게쿠타 그래프
figure(3)
plot(t,x,'b-','linewidth',1)
grid on, hold on
xlabel('Time[sec]')
ylabel('Displacement[m]')
legend('Runge-Kutta','Location','Northeast')
set(gca,'linewidth',2,'fontsize',13)




%% 엄밀해

Frequency=[0:1/t(end):1/dt];

w = 2*pi*Frequency;
X = 1./(-m*w.^2+k+i*c*w);
%% 엄밀해 그래프 
figure(1)

loglog(Frequency,abs(X),'--r','linewidth',1)
hold on
%% fft

dt = t(2)-t(1);
X = fft(x)/length(x);
F = fft(f)/length(f);
Frequency=[0:1/t(end):1/dt];
%% fft 그래프
loglog(Frequency,abs(X./F),'--g','linewidth',1)


%% PSD
N = length(t);% 전체 개수
t=linspace(0,2,N+1)

Nw = length(t)/2% 전체 개수의 반정도 하는것이 좋다.

Win = hanning(Nw);
Fs = 1/dt;
Percent = 0.99;
[Pxf_PSD,f_PSD] = cpsd(x,f,Win,floor(Percent*Nw),Nw,Fs);
[Pxx_PSD,f_PSD] = cpsd(x,x,Win,floor(Percent*Nw),Nw,Fs);

% Pxx_PSD

% Pxf_PSD
a=[f_PSD,Pxf_PSD]
%% PSD 그래프
loglog(f_PSD,abs(Pxx_PSD./Pxf_PSD),'--b','linewidth',1)
hold on
xlabel('Frequency[Hz]')
ylabel('|X(w)\F(w)|')
set(gca,'linewidth',2,'fontsize',13)
legend('exact','Numerical(fft)','Numerical(PSD)','Location','Northeast')
