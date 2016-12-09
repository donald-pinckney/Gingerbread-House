function [ T ] = compute_timings( filename )

% Load audio
[Wave, fs] = audioread(filename);
Wave = Wave(:,1);

windowDelay = 0.25
windowWidth = floor(fs * windowDelay);

[windowWidth, startWindow, endWindow] = gen_window(length(Wave), windowWidth);
windowFunc = hamming(windowWidth);

% Add up FFTs of windows
S_sum = zeros(windowWidth/2+1, 1); 

for i = startWindow:10000:endWindow
    X = Wave(get_window(i, windowWidth));
    X = X .* windowFunc;
    [F, S] = easy_fft(X, windowWidth, fs);
    S_sum = S_sum + S;
    
    fprintf('Progress: %g%%\n', 100*(i-startWindow)/(endWindow-startWindow));
end


% K-means on sum of FFT to divide up frequency space.
k = 4;
C = wkmeans(F, S_sum, k);

% Compute a sum of each class individually
classes = pred_freq_class(C, F);
classSums = [];
sumTimes = [];
for i = startWindow:10000:endWindow
    X = Wave(get_window(i, windowWidth));
    X = X .* windowFunc;
    [~, S] = easy_fft(X, windowWidth, fs);
    
    sums = zeros(1, k);
    for j = 1:k
        sums(j) = sum(S(classes == j));
    end
    classSums = [classSums; sums];
    sumTimes = [sumTimes; i / fs];
    
    fprintf('Progress: %g%%\n', 100*(i-startWindow)/(endWindow-startWindow));
end

% Normalize class sums
[classSums, Mu, Sigma] = normalize(classSums);

% Now find 2 clusters for each frequency class: beat and not beat.
beatClasses = zeros(2, k);
for j = 1:k
    beatClasses(:, j) = kmeans(classSums(:,j), 2);
end


T = cell(k, 1);
for i = 1:size(classSums, 1)
    sums = classSums(i, :);
    t = sumTimes(i);
    for j = 1:k
        s = sums(j);
        beatCenters = beatClasses(:,j);
        isBeat = pred_freq_class(beatCenters, s) == 2;
        if isBeat
            T{j} = [T{j} t];
        end
    end
    
    fprintf('Progress: %g%%\n', 100*i/size(classSums, 1));
end



end

