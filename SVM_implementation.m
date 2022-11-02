addpath .\SVM-KM\
clear all
close all

sample = 1;
[train_images, train_labels] = loadFaceImages('face_train.cdataset', sample);
[test_images, test_labels] = loadFaceImages('face_test.cdataset', sample);

% for i = 1:size(train_images,1)
%     train_images(i,:) = myHistogram(train_images(i,:));
% end

figure
for i=1:size(train_images,1)
    Im = reshape(train_images(i,:), 27, 18);
    Im = uint8(Im);
%     Im = enhanceContrastALS(Im);
%     subplot(8,12,i), imshow(Im), title(['label: ',num2str(train_labels(i))])
    
end

modelSVM = SVMtraining(train_images, train_labels);

for i= 1:size(test_images,1)
    testnumber = test_images(i,:);
    classifier(i,1) = SVMTesting(test_images,modelSVM);
end

comparison = (test_labels == classifier);

accuracy = sum(comparison)/length(comparison)

figure
title('Correct Classification')
count=0;
i=1;
while (count<100)&&(i<=length(comparison))
   
    if comparison(i)
        count=count+1;
        subplot(10,10,count)
        Im = reshape(test_images(i,:),27,18);
        Im = uint8(Im);
        imshow(Im)
        title(num2str(classifier(i)))
    end
    
    i=i+1;
    
end


%We display 100 of the incorrectly classified images
figure
title('Wrong Classification')
count=0;
i=1;
while (count<100)&&(i<=length(comparison))
    
    if ~comparison(i)
        count=count+1;
        subplot(10,10,count)
        Im = reshape(test_images(i,:),27,18);
        Im = uint8(Im);
        imshow(Im)
        title(num2str(classifier(i)))
    end
    
    i=i+1;
    
end