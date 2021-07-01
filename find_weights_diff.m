function [w] = find_weights_diff(x,d,threshold)
% x is time series
% d is difference parameter
% threshold above which weights are to be considered
% weights: w(k) = -w(k-1)*(d-k+1)/k, where k is the weight number
% w(1) = - d;
% w : array of weights : [1 -d d(d-1)/2 ...]
w = zeros(1,length(x)-1);
w(1) = - d;
k = 2;
while (k < (length(x)))
    w(k) = -w(k-1)*(d-k+1)/k;
    if (abs(w(k)) <= threshold)
        break;
    end
    k = k+1;
    
end
w = [1 w];
end