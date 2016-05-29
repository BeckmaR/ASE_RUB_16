function melfilters = makemelfilters(freqs, numchans, nfft, fs)

    f = zeros(numchans + 2,1);
    f(1) = 1;
    f(numchans + 2) = nfft / 2 + 1;
    
    frequency_scale = fs / nfft;

    for i = 2 : (numchans + 1)
        f(i) = round(freqs(i) / frequency_scale);
    end
    
    H = zeros(nfft / 2 + 1,numchans);
    
    for m = 1:numchans+1
        
        if (m - 1) ~= 0  
        
            for k = 1 : f(m - 1)
                H(k,m) = 0;   
            end


            for k = f(m - 1) : f(m)
                H(k,m) = 2 * (k - f(m - 1)) / ((f(m + 1) - f(m - 1))*(f(m) - f(m - 1)));
            end


            for k = f(m) : f(m + 1)
                H(k,m) = 2 * (f(m + 1) - k) / ((f(m + 1) - f(m - 1))*(f(m + 1) - f(m)));
            end

            for k = f(m + 1) : (nfft / 2 + 1)
                H(k,m) = 0;
            end
            
        end
        
    end
      
    melfilters = H;
    
end