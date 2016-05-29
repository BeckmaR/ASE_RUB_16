function features = computeFeatures(audiodata, fs, configfile)

    t=[1/fs:1/fs:length(audiodata)/fs];
    figure
    plot(t,audiodata)

    max_ampl=max(abs(audiodata))
    fs
%     soundsc(audiodata)
    
    parameters = getConfig(configfile);

    windowed = makeframes(audiodata, fs, parameters);

    four_transformed = fft(windowed);

    figure
    imagesc(log(abs(four_transformed)));
    set(gca, 'YDir', 'normal');

    features = four_transformed(1:size(four_transformed,1)/2+1,:);
    
    nfft = size(windowed, 1);

    frequencies = linfreqs(fs, nfft);
    
    figure
    imagesc(t, frequencies, log(abs(features)));
    set(gca, 'YDir', 'normal');
    xlabel('Zeit [s]');
    ylabel('Frequenz [Hz]');
    
    cmp = strcmp(parameters.TARGETKIND, 'MELSPEC');
    
    if cmp == 1
        fmin = 0;
        fmax = fs / 2;
        numchans = parameters.NUMCHANS;
        freqs = melfreqs(fmin, fmax, numchans);
        melfilters=makemelfilters(freqs, numchans, nfft, fs);
        figure
        plot(frequencies, melfilters)
    end
    
end