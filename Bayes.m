function klasse = Bayes(x, k)
    klasse = 0;
    max_lik = 0;
    for index = [1:length(k)]
        lik = likelihood(x, k(index).theta)*k(index).prior;
        if lik > max_lik
            klasse = index;
            max_lik = lik;
        end
    end
end