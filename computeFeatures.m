function features = computeFeatures(audiodata, fs, configfile)
    [y,fs] = audioread('C:\Users\ASE\Downloads\Uebung1\13zz637a.wav');
    t=[1/fs:1/fs:length(y)/fs];
    plot(t,y)

    max(abs(y))
    fs

    soundsc(y)

    conffile = 'C:\Users\ASE\Downloads\Uebung1\configSPEC.con';

    parameters = getConfig(conffile);

    windowed = makeframes(y, fs, parameters);

    four_transformed = fft(windowed);

    imagesc(log(abs(four_transformed)));

    nfft = size(windowed, 1);

    frequencies = linfreqs(fs, nfft);

    features = four_transformed(1:size(four_transformed,1)/2+1,:);
end