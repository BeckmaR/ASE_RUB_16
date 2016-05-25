function freqs = linfreqs(fs, nfft)
    points = 0:(nfft/2);
    fact = fs / nfft;
    freqs = points * fact;
end