function [preprocessedData] = preprocess(data, preprocessMethod)

    if (preprocessMethod == options.NULL)
        preprocessedData = data;
        return;
    end

    [rows, cols] = size(data);
    preprocessedData = zeros(rows, cols);

    for image = 1:rows
        I = reshape(data(image, :), [27 18]);
        I = uint8(I);

        switch preprocessMethod
            case options.PREPROCESS_HE
                I = enhanceContrastHE(I);
            case options.PREPROCESS_LS
                I = enhanceContrastALS(I);
            case options.PREPROCESS_PL
                I = enhanceContrastAPL(I);          
        end
        
        I = reshape(I, 1, size(I, 1) * size(I, 2));
        preprocessedData(image, :) = double(I);
    end
end

