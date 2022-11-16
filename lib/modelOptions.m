classdef modelOptions
    properties (Constant = true)
        ML_KNN = @knnCreation;
        ML_SVM = @svm;

        FEATURE_NONE = @noFeature;
        FEATURE_GABOR = @gaborFeatureVector;
        FEATURE_DR = @dimensionalityReduction;

        PREPROCESS_NONE = @noPreprocess;
        PREPROCESS_HE = @enhanceContrastHE;
        PREPROCESS_PL = @enhanceContrastAPL;
        PREPROCESS_LS = @enhanceContrastALS;
    end
    
end

