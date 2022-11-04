function [Iout] = enhanceContrastAPL(Iin)
    hist = histcounts(Iin, 'BinLimits', [0, 256], 'BinWidth', 1);
    [~, index] = max(hist);
    gamma = -(1/ log(index / (255 - 1)));

   
    LUT = contrast_PL_LUT(gamma);
    Iout = intlut(Iin, LUT);
end