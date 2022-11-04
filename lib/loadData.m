function data = loadData(path, sampling, feature)
    
    [images, labels] = loadFaceImages(path, sampling, feature);
    data.data = images;
    data.labels = labels;
    data.size = size(images, 1);
    data.features = size(images, 1);
end