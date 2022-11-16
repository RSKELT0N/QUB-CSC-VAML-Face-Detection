function [Iout] = enhanceContrastHE(Iin)
    Iin = uint8(Iin);
    LUT = zeros(1, 256);
    hist = double(histcounts(Iin, 'BinLimits', [0, 256], 'BinWidth', 1));
        
    [rows, cols] = size(Iin);
    CH = cumsum(hist);
    for i = 1:256
        LUT(1, i) = max(0, round(256 * CH(1, i) / (rows*cols) - 1));
    end
    LUT = uint8(LUT);
    Iout = intlut(Iin, LUT);
    Iout = double(Iout);
end