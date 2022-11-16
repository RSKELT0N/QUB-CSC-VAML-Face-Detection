classdef options
    properties (Constant = true)
        NONE = @noOperation

        ML_KNN = @knnCreation;
        ML_SVM = @svm;

        FEATURE_GABOR = @gaborFeatureVector;
        FEATURE_EDGES = @edgeExtraction;
        FEATURE_DR = @dimensionalityReduction;

        PREPROCESS_HE = @enhanceContrastHE;
        PREPROCESS_PL = @enhanceContrastAPL;
        PREPROCESS_LS = @enhanceContrastALS;
    end
    
end

