function [preprocessedData] = preprocess(data, method)
    [rows, cols] = size(data);
    preprocessedData = zeros(rows, cols);

    for image = 1:rows
        currentImage = reshape(data(image, :), [27 18]);
        currentImage = uint8(currentImage);

        switch method
            case "HE"
                currentImage = enhanceContrastHE(currentImage);
            case "LS"
                currentImage = enhanceContrastALS(currentImage);
            case "PL"
                currentImage = enhanceContrastAPL(currentImage);
        end
        currentImage = reshape(currentImage, 1, 27 * 18);
        preprocessedData(image, :) = double(currentImage);
    end
end

