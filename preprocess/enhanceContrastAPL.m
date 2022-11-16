function data = enhanceContrastAPL(data)
    for i = 1:size(data, 1)
        Iin = uint8(data(i, :));
        LUT = zeros(1, 256);
        hist = histcounts(Iin, 'BinLimits', [0, 256], 'BinWidth', 1);
        [~, index] = max(hist);
        gamma = -(1/ log(index / (255 - 1)));
        
        for j = 1:256
            LUT(1, j) = round(j^gamma / 255^(gamma-1));
        end
        LUT = uint8(LUT);
        Iout = intlut(Iin, LUT);
        data(i, :) = double(Iout);
    end
end