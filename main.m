close all;
clear variables;

addpath ./ml/
addpath ./lib/
addpath ./preprocess/

%% Load
train = loadData("face_train.cdataset", 1);
test = loadData("face_test.cdataset", 1);

%% Preprocess
train.data = preprocess(train.data, "HE");

%% Train
model = knn(train, 11);
%scores = evaluate(model, test);

modelSvm = svm(train);
scores = evaluate(modelSvm, test)
