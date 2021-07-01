function plot_power_spec(x,fs,p)
% Plot power spectrum of 1D signal given its sampling frequency
% define p for normalised power spectrum or original
Y = fft(x);
N = length(Y);
Pyy = (1/N)*(Y.* conj(Y));
f2 = (0:N-1)*(fs/N);
if ~exist('p', 'var')
    p = 'original';
end
switch p
    case 'norm'
        plot(f2(1:length(f2)/2),(Pyy(1:length(Y)/2)./max(abs(Pyy))));% plot normalised power spectrum and only positive frequencies
        % plot(f2,(Pyy./max(abs(Pyy)))); % Normalised power spectrum for full freq range
        title('Normalised Power Spectrum');
    case 'original'
        plot(f2(1:length(f2)/2),Pyy(1:length(Y)/2)); % plot only positive frequencies of fft
        % plot(f2,(Pyy));
        title ('Power Spectrum');
end
end