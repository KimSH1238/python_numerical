x=[10 20 30 40 50 60];
y = [0.14, 0.295, 0.442, 0.593, 0.725, 0.880];

sumX=0;
sumY=0;
sumX2=0;
sumXY=0;

n=length(x);
for i = n
    sumX=sumX+x(i);
    sumY=sumY+y(i);
    sumX2=sumX2+x(i)^2;
    sumXY=sumXY+x(i)*y(i);
end

a=(sumX*sumXY-sumX2*sumY)/(sumX^2-n*sumX2);
b=(sumX*sumY-n*sumXY)/(sumX^2-n*sumX2);

fprintf("y = %f + %fx\n",a,b)

% 결과 : y = -0.000000 + 0.014667x