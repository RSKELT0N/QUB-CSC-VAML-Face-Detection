function model = svm(train)

    modelInternal = fitcsvm(train.data, train.labels, 'OptimizeHyperparameters','all');

    modelInternal = fitcsvm(train.data, train.labels);
    modelInternal = fitPosterior(modelInternal, train.data, train.labels);

    function probability = classify(data)
        [~, score] = predict(modelInternal, data);
        probability = score(2);
    end

    model.classify = @classify;
end