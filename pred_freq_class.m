function [ Y ] = pred_freq_class( C, X )

k = length(C);
m = size(X, 1);
Y = zeros(m, 1);

for i = 1:m
    x = X(i, :);
    diff = C - x;
    d = zeros(k, 1);
    for a = 1:k
        d(a) = norm(diff(a, :))^2;
    end
    [~, Y(i)] = min(d);
end

end

