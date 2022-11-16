function data = enhanceContrastHE(data)
    for i = 1:size(data, 1)
        Iin = uint8(data(i, :));
        LUT = zeros(1, 256);
        hist = double(histcounts(Iin, 'BinLimits', [0, 256], 'BinWidth', 1));
        
        [rows, cols] = size(Iin);
        CH = cumsum(hist);
        for j = 1:256
            LUT(1, j) = max(0, round(256 * CH(1, j) / (rows*cols) - 1));
        end
        LUT = uint8(LUT);
        Iout = intlut(Iin, LUT);
        data(i, :) = double(Iout);
    end    
end