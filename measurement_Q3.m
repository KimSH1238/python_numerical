%% Q 3.26
wn=1400.29;
w=120;
xi=0.7;

a=1-w^2/wn^2;
b=2*xi*w/wn;

m=1/(a^2+b^2)^0.5
t=0:0.1:100;
%t=10.^torigin;
yst_ratio=m*sin(w.*t+atan(-b/a));

plot(t,yst_ratio)