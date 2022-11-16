function [Iout] = enhanceContrastAPL(Iin)
    Iin = uint8(Iin);
    hist = histcounts(Iin, 'BinLimits', [0, 256], 'BinWidth', 1);
    [~, index] = max(hist);
    gamma = -(1/ log(index / (255 - 1)));
   
    LUT = zeros(1, 256);
    for i = 1:256
        LUT(1, i) = round(i^gamma / 255^(gamma-1));
    end
    LUT = uint8(LUT);
    Iout = intlut(Iin, LUT);
    Iout = double(Iout);
end