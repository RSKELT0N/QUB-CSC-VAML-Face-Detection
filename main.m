close all;
clear variables;

% Load
[images, labels] = loadFaceImages("face_train.cdataset", 1);
[testImages, testLabels] = loadFaceImages("face_test.cdataset", 1);

train.data = images;
train.labels = labels;

test.data = images;
train.labels = labels;


% Preprocess

% Train
model = knn(train, 11);

testLabel = model.classify(train.data(1, :));


