function scores = evaluate(model, testData)
    
    predictions = zeros(1, size(testData.data, 1));

    for i = 1:size(testData.data, 1)
        predictions(1, i) = model.classify(testData.data(i, :));
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
end