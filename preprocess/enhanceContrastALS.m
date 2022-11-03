function [Iout,Lut] = enhanceContrastALS(Iin)
    h = histcounts(Iin, 'BinLimits', [0, 256], 'BinWidth', 1);

    first = find(h > 1, 1);
    last = find(h > 1, 1, "last");
    i1 = first;
    i2 = last;
    
    m = (255 - 0) / (i2 - i1);
    c = -m * i1;

    Lut = contrast_LS_LUT(m, c);
    Iout = intlut(Iin, Lut);
end