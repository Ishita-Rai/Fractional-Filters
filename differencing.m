function [y] = differencing(x,d,threshold)
% x is time series
% d is difference parameter
% threshold above which weights are to be considered
% y is fractionally differenced time series
% eq: x(t) = w1*x(t)+w2*x(t-1) + w3*x(t-2) + w4*x(t-3) + w5*x(t-4)+...
% w1,w2,w3 and w4 are the weights found through find_weights_diff function

%check whether input is vector, if not convert into vector
TF = iscolumn(x);
if TF == 0
    x = x';
end

w = find_weights_diff(x,d,threshold);
F = triu(toeplitz((w)));
y = x'*F;
end