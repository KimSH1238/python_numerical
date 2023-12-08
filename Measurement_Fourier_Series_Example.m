% Measurement Fourier Series Example
% Department of Mechanical Engineering @ Dankook University, ROK
% 2023-2 Sensor Based IoT System Design
% 
% Ex)2.4
% y(t) = -(t+2) (-2<t<-1)
% y(t) = t (-1<t<1)
% y(t) = 2-t (1<t<2)
clear

%% Original Graph Data
t1 = linspace(-2,2,4001);
for i = 1:1000
    y1(i) = -(t1(i)+2);
end

for i = 1001:3000
    y1(i) = t1(i);
end

for i = 3001:4001
    y1(i) = 2-t1(i);
end

%% Fourier Fitting Option
[xData, yData] = prepareCurveData( t1, y1 );
ft = fittype( 'fourier8' ); % Number of Fourier Series Terms

opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pi/2]; % Change fitting options based on weights
[fitresult_24, gof] = fit( xData, yData, ft, opts );

figure(1)
plot(t1,y1)
plot(fitresult_24, xData, yData)
t = title('Example 2.4');
t.FontSize = 16;
s.FontAngle = 'italic';

legend('Original Data','Fourier Series Data')

disp(fitresult_24)


% Ex)2.3
% y(t) = 0 (-pi<t<0)
% y(t) = -1 (0<t<pi/2)
% y(t) = 1 (pi/2<t<pi)

%% Original Graph Data
t2 = linspace(-pi,pi,4001);
for i = 1:2000
    y2(i) = 0;
end

for i = 2001:3000
    y2(i) = -1;
end

for i = 3001:4000
    y2(i) = 1;
end

for i = 1:4000
    t2(i+4000) = t2(i)+2*pi;
    y2(i+4000) = y2(i);
end

%% Fourier Fitting Option
[xData, yData] = prepareCurveData( t2, y2 );
ft = fittype( 'fourier8' ); % Number of Fourier Series Terms

opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1]; % Change fitting options based on weights
[fitresult_23, gof] = fit( xData, yData, ft, opts );

figure(2)
plot(t2,y2)
plot(fitresult_23, xData, yData)
t = title('Example 2.3');
t.FontSize = 16;
s.FontAngle = 'italic';

legend('Original Data','Fourier Series Data')

disp(fitresult_23)

% Ex)2.5
% y(t) = |120sin(120*pi*t)|

%% Original Graph Data
t3 = linspace(0,1/60,4001);

for i = 1:4001
    y3(i) = abs(120*sin(120*pi*t3(i)));
end
%% Fourier Fitting Option
[xData, yData] = prepareCurveData( t3, y3 );
ft = fittype( 'fourier8' ); % Number of Fourier Series Terms

opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1000]; % Change fitting options based on weights
[fitresult_25, gof] = fit( xData, yData, ft, opts );

figure(3)
plot(t3,y3)
plot(fitresult_25, xData, yData)
t = title('Example 2.5');
t.FontSize = 16;
s.FontAngle = 'italic';

legend('Original Data','Fourier Series Data')

disp(fitresult_25)