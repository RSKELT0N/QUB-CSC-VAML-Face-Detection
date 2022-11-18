function [imagesDetected, detected] = windowDetector(model, img)
    % Reading image file and gathering image height and width.
    img = imread(img);
    currImgX = size(img, 2);
    currImgY = size(img, 1);

    % Setting default window size.
    windowY = 27;
    windowX = 18;

    % Return results.
    imagesDetected = [];
    detected = 0;

    % Looping until size of image is less than predefined window size.
    while (currImgX > windowX && currImgY > windowY)
        for i = 1:(currImgY-(windowY))
            for j = 1:(currImgX-(windowX))

                % Taking window-sized image from current I & J indexes.
                I = img(i:i+windowY-1, j:j+windowX-1);
                vector = double(reshape(I, 1, windowX * windowY));

                % Extracting data from image, based on model.
                vector = extractData(model.preprocess, model.feature, model.dr, vector, 0);
                % Testing the probability of image, belonging to the classifier
                prob = model.classify(vector);

                % Setting a base probability of 0.5, and then adding the window to the result.
                if prob > 0.5
                    detected = detected + 1;
                    imagesDetected(detected, :) = reshape(I, 1, windowX * windowY);
                end
            end
        end
        % Resizing the image in half.
        img = imresize(img, 0.5);
        currImgX = size(img, 2);
        currImgY = size(img, 1);
    end
    disp(['Faces detected: ', num2str(detected)])
end