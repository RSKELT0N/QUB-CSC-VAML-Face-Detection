close all;
clear variables;

addpath ./ml/
addpath ./lib/
addpath ./preprocess/

%% Load
train = loadData("face_train.cdataset", 1, "Gabor");
test = loadData("face_test.cdataset", 1, "Gabor");

%% Preprocess
train.data = preprocess(train.data, "HE");

%% Train
model = knn(train, 11);
%scores = evaluate(model, test);

modelSvm = svm(train);
scores = evaluate(modelSvm, test)
