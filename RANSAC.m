% input data
noise_sigma=100;
x=[1:100]';
y=-2*(x-40).^2+30;
oy=500*abs(x-60)-5000;
y([50:70])=y([50:70])+oy([50:70]);
y=y+noise_sigma*randn(length(x):1);

% build matrix
A=[x.^2 x ones(length(x),1)];
B=y;

% R fitting
n_data=length(x);
N=100; %iteration
T=3*noise_sigma; %residual threshold
n_sample=3;
max_cut=0;
best_model=[0 0 0]';

for itr=1:N
    %random sampling
    k=floor()
end
