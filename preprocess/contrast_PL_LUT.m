function [LUT] = contrast_PL_LUT(gamma)
    LUT = zeros(1, 256);

    for i = 1:256
        LUT(1, i) = round(i^gamma / 255^(gamma-1));
    end

    LUT = uint8(LUT);
end

