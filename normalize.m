function [ Xout, Mu, Sigma ] = normalize( X )

Xout = X;

n = size(X, 2);
Mu = zeros(n, 1);
Sigma = zeros(n, 1);

for i = 1:n
    col = X(:, i);
    
    mu = mean(col);
    sigma = std(col);
    Mu(i) = mu;
    Sigma(i) = sigma;
    
    Xout(:, i) = (col - mu) / sigma;
end


end

