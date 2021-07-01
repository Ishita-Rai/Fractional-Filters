function [d] = find_d(rfMRi,n,m,t)
% function to find fractional difference parameter d
% rfMRi is th ematrix of input resting-state BOLD signals
% n: number of ROIs
% m: number of datasets
% t: number of datapoints in one time series of a ROI
output_num = 0.1:0.1:5; % range among which the value of d to be obtained
for l = 1:m
    for i = 1:n
        k = 1;
        for j = 0.1:0.1:5
            differenced_signal = differencing(rfMRi(i,(t*l-(t-1)):t*l)'-mean(rfMRi(i,(t*l-(t-1)):t*l)),j,0.0001);
            [acf,lags,bounds] = autocorr(differenced_signal,'NumLags',1000);
            Y = ((acf < bounds(2)) | (acf > bounds(1)));
            value(k,(n-(n-1))*i) = sum(Y);
            y = sort(differenced_signal);
            k = k+1;
        end
    end
    for b = 1:n
        [Macf(b),Idx_acf(b)] = min(value(:,b));
    end
    % from the index of minmum error in qq plot, find correspoding d value
    acf_mag = output_num(Idx_acf);
    for c = 1:n
    d(c,l) = acf_mag(c);
    end
end

