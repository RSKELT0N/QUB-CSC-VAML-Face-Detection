function Lut = contrast_LS_LUT(m,c)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Lut = 1:256; %should be Lut_i

if Lut < -c/m
    Lut = 0;
else if Lut>(255-c)/m
    Lut = 255;
else
    Lut = Lut*m + c;
end

Lut = uint8(Lut);
end
