function data = loadData(path, sampling)
    
    [images, labels] = loadFaceImages(path, sampling);
    data.data = images;
    data.labels = labels;
    data.size = size(images, 1);
    data.features = size(images, 1);
end