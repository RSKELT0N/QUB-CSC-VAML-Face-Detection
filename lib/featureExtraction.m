function [vector] = featureExtraction(data, feature)
    [rows, cols] = size(data);

    I = data;
    switch feature
        case "Gabor"
            vector = gabor_feature_vector(I);
        otherwise
            vector = reshape(I, 1, rows * cols);
    end
    vector = double(vector);
end

