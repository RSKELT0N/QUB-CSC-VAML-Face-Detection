function h = myHistogram(I)
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here
% colormap(gray);
h_I = histogram(I,'BinLimits', [0 256],'BinWidth',1);
h = h_I.Values;
end