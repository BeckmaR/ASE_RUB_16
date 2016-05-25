[y,fs] = audioread('C:\Users\ASE\Downloads\Uebung1\13zz637a.wav');
t=[1/fs:1/fs:length(y)/fs];

conffile = 'C:\Users\ASE\Downloads\Uebung1\configSPEC.con';


features = computeFeatures(y, fs, conffile);

figure(2);
imagesc(t, frequencies, log(abs(features)));
set(gca, 'YDir', 'normal');
xlabel('Zeit [s]');
ylabel('Frequenz [Hz]');

fmin = 0;
fmax = fs / 2;
NUMCHANS = 12;
freqs = melfreqs(fmin, fmax, NUMCHANS);
melfilters(freqs, NUMCHANS, 256, fs);

    

