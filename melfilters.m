function melfilters = melfilters(hz_frequencies, numchans, nfft, fs)
    filters = zeros(numchans + 2);
    filters(1) = 1;
    filters(numchans + 2) = nfft/2 + 1;
    
    frequency_scale = fs/nfft;
    
    four_frequencies = hz_frequencies;
    
    for k = 2:(numchans + 1)
        hz = hz_frequencies(k);
        four_frequencies(k) = round(hz / frequency_scale)
    end
        
    
    for k = 1:numchans
        for m = 1:(nfft/2 + 1)
        end
    end
            
end