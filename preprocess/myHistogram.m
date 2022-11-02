function [output] = myHistogram(inputImage)
    [rows, cols] = size(inputImage);
    output = zeros(1, 256);
    output = uint16(output);

    for i = 1:rows
        for j = 1:cols
            output(1, inputImage(i, j)) = output(1, inputImage(i, j)) + 1;
        end
    end
end