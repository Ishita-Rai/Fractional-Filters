function [v] = compute_power(x)
% Return Single Sided Power vector
Y = fft(x);
N = length(Y);
Pyy = (1/N)*Y.* conj(Y);
v = Pyy(1:length(Y)/2)./max(abs(Pyy));
end