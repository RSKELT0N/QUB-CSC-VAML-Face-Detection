close all;
clear variables;

addpath ./ml/
addpath ./lib/
addpath ./preprocess/
addpath ./featureExtraction/

rng(100);

model = createModel(options.PREPROCESS_HE, options.FEATURE_EDGES, options.NONE, options.ML_SVM);


roc(model, model.test);