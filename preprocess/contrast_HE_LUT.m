function [LUT] = contrast_HE_LUT(Iin)
    LUT = zeros(1, 256);
    hist = double(myHistogram(Iin));
    [rows, cols] = size(Iin);
    CH = cumsum(hist);

    for i = 1:256
        LUT(1, i) = max(0, round(256 * CH(1, i) / (rows*cols) - 1));
    end
    LUT = uint8(LUT);
end

