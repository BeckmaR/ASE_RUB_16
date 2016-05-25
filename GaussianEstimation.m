function theta = GaussianEstimation(x)
    mu = 0;
    for k = 1:length(x)
        mu = mu + x(:,k);
    end
    mu = mu / length(x);
    
    C = zeros(2, 2);
    
    for k = 1:length(x)
        diff = x(:,k)-mu;
        mat = diff * diff';
        C = C + mat;
    end
    l = length(x);
    C = C / l;
    
    theta.('C') = C;
    theta.('mu') = mu;
    theta.('type') = 'Gauss';
end