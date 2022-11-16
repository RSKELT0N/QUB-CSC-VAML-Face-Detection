function creator = knnCreation(k)

    function model = make(train)
        model = knn(train, k);
    end
    
    creator = @make;
end
