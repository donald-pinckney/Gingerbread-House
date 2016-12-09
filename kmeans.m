function [ C ] = kmeans( X, k )


w = ones(size(X, 1), 1);
C = wkmeans(X, w, k);

end

