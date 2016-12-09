function [ F, P ] = easy_fft( X, width, fs )

Y = fft(X);
P2 = abs(Y/width);
P = P2(1:width/2+1);
P(2:end-1) = 2*P(2:end-1);
F = fs*(0:(width/2))/width;
F = F';

end

