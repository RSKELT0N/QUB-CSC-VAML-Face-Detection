function data = loadData(path, sampling)
    
    [images, labels] = loadFaceImages(path, sampling);
    %images = preprocess(images, preprocessMethod);
    %images = featureExtraction(images, feature);

    data.data = images;
    data.labels = labels;
    data.size = size(images, 1);
    data.features = size(images, 2);
end