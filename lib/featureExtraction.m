function [extractedData] = featureExtraction(data, feature)
    
    if (feature == options.NULL)
        extractedData = data;
        return;
    end
    
    [rows, ~] = size(data);

    for image = 1:rows
        I = reshape(data(image, :), [27 18]);
        I = uint8(I);

        switch feature
            case options.FEATURE_GABOR
                vector = gabor_feature_vector(I);
            case options.FEATURE_FULL
                vector = reshape(I, 1, size(I, 1) * size(I, 2));
        end

        if image == 1
            extractedData = zeros(rows, size(vector, 2));
        end

        vector = double(vector);
        extractedData(image, :) = vector;
    end
end

