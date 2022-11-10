close all;
clear variables;

addpath ./ml/
addpath ./lib/
addpath ./preprocess/

feature = options.FEATURE_DR_PCA;
preprocess = options.PREPROCESS_HE;

%% Load + PreProcess + Feature Extraction
train = loadData("face_train.cdataset", 1, feature, preprocess);
test = loadData("face_test.cdataset", 1, feature, preprocess);

%% Train
model = knn(train, 11);
%scores = evaluate(model, test);

modelSvm = svm(train);
scores = evaluate(modelSvm, test)
