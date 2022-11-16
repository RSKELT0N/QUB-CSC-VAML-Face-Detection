function scores = evaluateProb(model, testData, threshold)
    arguments
        model(1,1) struct {mustBeNonmissing};
        testData(1,1) struct {mustBeNonmissing};
        threshold(1,1) double {} = 0.5; 
    end
    
    predictions = zeros(1, size(testData.data, 1));

    for i = 1:size(testData.data, 1)
        probability = model.classify(testData.data(i, :));
        if probability > threshold
            predictions(1, i) = 1;
        else
            predictions(1, i) = -1;
        end
    end

    cm = confusionmat(testData.labels, predictions);

    TN = cm(1,1);
    TP = cm(2,2);
    FP = cm(2,1);
    FN = cm(1,2);

    scores.accuracy = (TP+TN)/(TP+TN+FP+FN);
    scores.sensitivity = TP/(TP+FN);
    scores.specificity = TN/(TN+FP);
    scores.precision = TP/(TP+FP);
    scores.recall = TP/(TP+FN);
    scores.f1_score = 2*((scores.precision*scores.recall)/(scores.precision+scores.recall));

    scores.kappa = 2*(TP*TN-FN*FP) / ((TP+FP)*(FP+TN)+(TP+FN)*(FN+TN));
end