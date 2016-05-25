function klasse = MaxLik(x, k)
    maxLik = 0;
    klasse = 0;
    for index = [1:length(k)]
        theta = k(index).theta;
        lik = likelihood(x, k(index).theta);
        if lik > maxLik
            klasse = index;
            maxLik = lik;
        end
    end
end