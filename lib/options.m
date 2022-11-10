classdef options < int8
    properties (Constant = true)
        NULL = -1;
        FEATURE_GABOR = 0;
        FEATURE_FULL = 1;
        FEATURE_DR_PCA = 2
        PCA_P = 200;

        PREPROCESS_HE = 3;
        PREPROCESS_PL = 4;
        PREPROCESS_LS = 5;
    end
end

