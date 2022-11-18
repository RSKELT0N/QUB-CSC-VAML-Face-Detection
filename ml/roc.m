function curve = roc(model, testData)

    sampling = 20;
    probabilities = zeros(size(testData.data, 1), 1);
    tprs = zeros(sampling+1, 1);
    fprs = zeros(sampling+1, 1);


    tprs(1, 1) = 1;
    fprs(1, 1) = 1;
    
    for i = 1:size(testData.data, 1)
        probabilities(i, 1) = model.classify(testData.data(i, :));
    end
    
    for i = 1:sampling
        threshold = (i*(100/sampling))/100;
        predictions = zeros(size(testData.data, 1), 1);
        for j = 1:size(testData.data, 1)
            if probabilities(j, 1) > threshold
                predictions(j, 1) = 1;
            else
                predictions(j, 1) = -1;
            end
        end

        cm = confusionmat(testData.labels, predictions);

        TN = cm(1,1);
        TP = cm(2,2);
        FN = cm(2,1);
        FP = cm(1,2);

        tprs(i+1, 1) = TP/(TP+FN);
        fprs(i+1, 1) = FP/(FP+TN);
    end

    baseline = 0:1/100:1;
    p = plot(fprs, tprs, baseline, baseline);
    ylabel("True Positive Rate");
    xlabel("False Positive Rate");
    axis([0 1 0 1]);
    p(1).LineWidth = 2;
    p(2).Color = "black";

    curve = p;
end