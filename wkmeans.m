function [ C ] = wkmeans( X, w, k )

m = size(X, 1);
n = size(X, 2);

mins = min(X);
maxs = max(X);

C = rand(k, n) .* (maxs - mins) + mins;
% hold off;
% plot2d(X, 'r.');
% hold on
% plot2d(C, 'bo');
% hold off

lastI = zeros(m, 1);

% Each iteration
for i = 1:100
    % Assign points to cluters
    I = zeros(m, 1); % Index matrix. Associates each point with nearest center.
    for j = 1:m
        x = X(j, :);
        diff = C - x;
        d = zeros(k, 1);
        for a = 1:k
            d(a) = norm(diff(a, :))^2;
        end
        [~, I(j)] = min(d);
    end
    
    if isequal(I, lastI) 
        break
    end
    lastI = I;
    
    % Update centers
    for l = 1:k
        indices = I == l;
        points = X(indices, :);
        weights = w(indices);
        
        numerator = sum(points .* weights);
        denominator = sum(weights);
        C(l, :) = numerator / denominator;
    end
    
%     plot2d(X, 'r.');
%     hold on
%     plot2d(C, 'bo');
%     hold off
end

Ns = sum(isnan(C), 2);
validIndices = Ns == 0;
C = C(validIndices, :);
C = sort(C);

end

