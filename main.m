close all;
clear variables;

addpath ./ml/
addpath ./lib/
addpath ./preprocess/
addpath ./featureExtraction/

rng(100);

model = createModel(options.NONE, options.FEATURE_EDGES, options.NONE, options.ML_SVM);
[faceDetected, count] = windowDetector(model, "images/im1.jpg");

roc(model, model.test);