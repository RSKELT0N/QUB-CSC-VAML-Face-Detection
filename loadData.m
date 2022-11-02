function data = loadData(path, sampling)
    
    [images, labels] = loadFaceImages(path, sampling);
    data.data = images;
    data.labels = labels;
end