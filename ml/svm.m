function model = svm(train)

    modelInternal = fitcsvm(train.data, train.labels);

    function class = classify(data)
        pred = predict(modelInternal, data);
        if pred>0
            class = 1;
        else
            class = -1;
        end
    end

    model.classify = @classify;
end