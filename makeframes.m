function windowed = makeframes(audiodata, fs, parameters)
    window_samples = fs*parameters.WINDOWSIZE*100e-9;
    ex = ceil(log2(window_samples));
    window_samples = 2^ex
    targetrate_samples = fs*parameters.TARGETRATE*100e-9;
    overlap = window_samples - targetrate_samples;
    signal_samples = length(audiodata);
    
    %fill = ceil(audiodata / window_samples)*window_samples - length(audiodata);
    
    fill_vec = zeros(ceil(length(audiodata) / window_samples)*window_samples, 1);
    
    fill_vec(1:length(audiodata)) = audiodata;
    
    audiodata = fill_vec;
    
    num_windows = (signal_samples - overlap) / (window_samples - overlap);
    num_windows = ceil(num_windows)
    
    if parameters.USEHAMMING == 'T'
        window_func = hamming(window_samples);
    else
        window_func = hann(window_samples);
    end

    result = zeros(window_samples, num_windows);
    for k = 0:(num_windows-1)
       pos = k*targetrate_samples+1;
       frame_end = pos+window_samples-1
       frame_data = audiodata(pos:frame_end);

       windowed_frame = window_func .* frame_data;
       result(:,k+1) = windowed_frame;
    end
    
    windowed = result;
end