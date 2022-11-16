function data = enhanceContrastALS(data)
    for i = 1:size(data, 1)
        Iin = uint8(data(i, :));
        LUT = 1:256; 
        h = histcounts(Iin, 'BinLimits', [0, 256], 'BinWidth', 1);
    
        first = find(h > 1, 1);
        last = find(h > 1, 1, "last");
        i1 = first;
        i2 = last;
        
        m = (255 - 0) / (i2 - i1);
        c = -m * i1;
    
        if LUT < -c/m
            LUT = 0;
        else if LUT > ((255 - c) / m)
            LUT = 255;
        else
            LUT = LUT * m + c;
        end
        LUT = uint8(LUT);
        Iout = intlut(Iin, LUT);
        data(i, :) = double(Iout);
    end
end