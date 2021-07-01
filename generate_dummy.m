% script to generate dummy bold fMRI signal consisting of frequencies
clear all
close all
clc
%% Generate random vector of freq  between 0.01 and 0.15 Hz
f = 0.01 + (0.15-0.01).*rand(10,1);
amp = -50+(50+50).*rand(10,1);
fs=1000/720;% sampling frequency 
t = (1:1:1200)./fs;  % 100 second span time vector
x = 0;
for i = 1:10
    x = x+ (amp(i)*sin(2*pi*f(i)*t)); % clean dummy signal
end
%%
white_noise_dummy =sqrt(100)*randn(1200,1); % white gaussian noise of varaince 100
noisy_signal = x +white_noise_dummy'; 
%% Find fractional difference parameter d
output_num = 0:0.1:5; % range among which the value of d to be obtained
k = 1;
for j = 0.0:0.1:5
     differenced_signal = differencing(noisy_signal-mean(noisy_signal),j,0.0001);
     [acf,lags,bounds] = autocorr(differenced_signal,'NumLags',1000);
     Y = ((acf < bounds(2)) | (acf > bounds(1)));
     value(k) = sum(Y);
     k = k+1;
end
[m,idx] = min(value);   
% from the index of minmum error, find correspoding d value
d = output_num(idx);
%% Use AR filter to filter out noise
differenced_signal = differencing(noisy_signal'-mean(noisy_signal),d,0.0001);
[A1,logA1,EstMdl] = est_AR_coeff(1,differenced_signal');
filtered_signal = filter(1,[1 A1],noisy_signal);
%% Plot normalised power spectrum
figure();
plot_power_spec(x,fs,'norm');
hold on;
plot_power_spec(filtered_signal,fs,'norm');
xlabel('Frequency (Hz)');
ylabel('Normalised Power');
legend('Noisy Signal','ARFIMA filtered');