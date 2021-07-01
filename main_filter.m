clear all
close all
clc
%% define variables
n = 100; % number of brain regions
m = 1*4; % number of datasets, 1 is the subject number and 4 the four different runs
t = 1200; % number of data point in each time series
fs = 1000/720; % sampling frequency = 1/TR where TR is the repetition time
%% 
load("rfMRI_ip.mat") % load rs-fMRI data where the data is organised as: n*(t*m)
fmri_Op = zeros(n,m*t); % memory allocation to ARFIMA filtered ouput
%% find the value of fractional difference paramter 'd' using autocorrelation plot
d = find_d(rfMRI_ip,n,m,t);
%% Perform ARFIMA (1,d,0) filtering
for j = 1:m
    for i = 1:n
        differenced_signal = differencing(rfMRI_ip(i,(t*j-(t-1)):t*j)'-mean(rfMRI_ip(i,(t*j-(t-1)):t*j)),d(i,j),0.0001);% 0.0001 is the threshold to convert infinte factorials to finite
        [A,logA,EstMdl] = est_AR_coeff(1,differenced_signal');
        ar(i,j) = A; % store coefficients of AR (1) parameter
        y_AR_5 = filter(1,[1 A],differenced_signal); 
        fmri_Op(i,(t*j-(t-1)):t*j) = differencing(y_AR_5,-d(i,j),0.0001); % fractional integration to bring the output in previous domain
        % statistical comparison of the power spectrum of input and ARFIMA
        % filtered signal
        power_rfmri = compute_power(rfMRI_ip(i,(t*j-(t-1)):t*j)');
        power_op = compute_power(fmri_Op(i,(t*j-(t-1)):t*j)');
        [h2(i,j),p2(i,j)]=kstest2(power_rfmri,power_op);

 end
end
clear i j