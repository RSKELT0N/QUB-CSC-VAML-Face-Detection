% close all;
% clear variables;

addpath ./ml/
addpath ./lib/
addpath ./preprocess/
addpath ./featureExtraction/

rng(100);

%model = createModel(options.PREPROCESS_HE, options.FEATURE_HOG, options.NONE, options.ML_KNN(3));

%model.scores

limit = 20;
results = zeros(limit, 3);
for i = 1:limit
    k = 1+((i-1)*2)
    model1 = createModel(options.NONE, options.HOG, options.NONE, options.KNN(k));
    model2 = createModel(options.HE, options.HOG, options.NONE, options.KNN(k));
    model3 = createModel(options.LS, options.HOG, options.NONE, options.KNN(k));

    results(i, 1) = model1.scores.kappa;
    results(i, 2) = model2.scores.kappa;
    results(i, 3) = model3.scores.kappa;
end

% model2 = createModel(options.NONE, options.NONE, options.NONE, options.ML_KNN(25));
% model1 = createModel(options.NONE, options.NONE, options.FEATURE_DR(200), options.ML_KNN(25));

% model = createModel(options.NONE, options.FEATURE_GABOR, options.NONE, options.ML_SVM);
% 
% model.scores


