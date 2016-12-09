function [ widthOut, startIndex, endIndex ] = gen_window( n, width )

widthOut = width;
if mod(widthOut, 2) == 1
    widthOut = widthOut + 1;
end

halfWidth = widthOut / 2;
startIndex = halfWidth;
endIndex = n - halfWidth;



end

