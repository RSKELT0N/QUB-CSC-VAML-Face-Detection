function [extractedData] = featureExtraction(data, feature)

    [rows, cols] = size(data);
    
    if (feature == options.NULL)
        extractedData = data;
        return;
    elseif (feature == options.FEATURE_DR_PCA)
        [~, extractedData] = pca(data, 'NumComponents', options.PCA_P);
        return;
    end

    for image = 1:rows
        switch feature
            case options.FEATURE_GABOR
                I = uint8(reshape(data(image, :), [27 18]));
                vector = gabor_feature_vector(I);
            case options.FEATURE_FULL
                I = uint8(reshape(data(image, :), [27 18]));
                vector = reshape(I, 1, size(I, 1) * size(I, 2));
        end

        if image == 1
            extractedData = zeros(rows, size(vector, 2));
        end

        vector = double(vector);
        extractedData(image, :) = vector;
    end
end

