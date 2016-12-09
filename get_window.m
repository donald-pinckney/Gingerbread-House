function [ W ] = get_window( i, width )

halfWidth = width / 2;
W = (i-halfWidth+1):(i+halfWidth);

end

