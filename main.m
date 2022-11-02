close all;
clear variables;

addpath ml/

%% Load
train = loadData("face_train.cdataset", 1);
test = loadData("face_test.cdataset", 1);

%% Preprocess

%% Train
model = knn(train, 11);
%scores = evaluate(model, test);

modelSvm = svm(train);
scores = evaluate(modelSvm, test)


