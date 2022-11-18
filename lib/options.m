classdef options
    properties (Constant = true)
        NONE = @noOperation

        KNN = @knnCreation;
        SVM = @svm;

        GABOR = @gaborFeatureVector;
        HOG = @hogFeatureVector;
        EDGES = @edgeExtraction;
        DR = @dimensionalityReduction;

        HE = @enhanceContrastHE;
        PL = @enhanceContrastAPL;
        LS = @enhanceContrastALS;
    end
    
end

