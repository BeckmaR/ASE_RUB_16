function freqs = melfreqs(fmin, fmax, numfreqs)
    mel_min = 2595*log10(1 + fmin/700);
    mel_max = 2595*log10(1 + fmax/700);
    
    mel_freqs = linspace(mel_min, mel_max, numfreqs + 2);
    freqs = mel_freqs;
    for k = 1:(numfreqs + 2)
        mel = mel_freqs(k);
        freqs(k) = (10^(1/2595*mel)-1)*700;
    end
end