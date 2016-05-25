function lik = likelihood(x, theta)
    dimensions = size(x, 1);
    num_values = size(x, 2);
    mu = theta.mu;
    C = theta.C;
    p = zeros(1, num_values);
    if strcmp(theta.type, 'Gauss')
        for k = 1:num_values
            d = x(:,k)-mu;
            p(k)= 1/(sqrt((2*pi)^dimensions*det(C)))*exp(-0.5*d'*(inv(C))*d);
        end
    elseif strcmp(theta.type, 'Discrete')
        for k = 1:num_values
           	val = x(k);
            index = find(theta.values, val);
            p(k) = theta.propabilities(index);
        end
    end
    lik = p;
end