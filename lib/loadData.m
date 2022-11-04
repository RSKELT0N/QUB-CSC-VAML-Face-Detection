function data = loadData(path, sampling, feature)
    
    [images, labels] = loadFaceImages(path, sampling, feature);
    data.data = images;
    data.labels = labels;
end