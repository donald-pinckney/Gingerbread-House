function [ ] = plot2d( X, opts )

xs = X(:, 1);
ys = X(:, 2);

plot(xs, ys, opts);

end

