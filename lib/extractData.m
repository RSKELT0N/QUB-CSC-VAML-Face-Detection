function [data] = extractData(preprocess, feature, dr, data, print)

    %% Preprocess

    if (print == 1); disp("Preprocessing"); end
    data = preprocess(data);

    %% Feature Extraction
    if (print == 1); disp("Feature Extraction"); end
    data = feature(data);

    %% Dimension Reduction
    data = dr(data);
end

