close all;
clear variables;

addpath ./ml/
addpath ./lib/
addpath ./preprocess/
addpath ./featureExtraction/

rng(100);

model.feature = modelOptions.FEATURE_EDGES;
model.feature2 = modelOptions.FEATURE_NONE;
model.ml = modelOptions.ML_SVM;
model.preprocess = modelOptions.PREPROCESS_NONE;

%% Load
train = loadData("face_train.cdataset", 1);
test = loadData("face_test.cdataset", 1);

%% Preprocess
disp("Preprocessing")
for i = 1:train.size
    train.data(i, :) = model.preprocess(train.data(i, :));
end
for i = 1:test.size
    test.data(i, :) = model.preprocess(test.data(i, :));
end

%% Feature Extraction
disp("Feature Extraction")
train.data = model.feature(train.data);
test.data = model.feature(test.data);

train.data = model.feature2(train.data);
test.data = model.feature2(test.data);


%% Train
disp("Training")
modelTrained = model.ml(train);

%% Test
disp("Evaluating")
scores = evaluate(modelTrained, test)
