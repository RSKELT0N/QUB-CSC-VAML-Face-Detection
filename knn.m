function model = knn(train, k)

    function class = classify(data) 
        distances = zeros(1, size(train.data, 1));
        distances(1, :) = intmax;
         
        for i = 1: size(train.data, 1)
            distances(i) = EuclideanDistance(data, train.data(i,:));
        end
        
        [~, indices] = sort(distances);
    
        labels = train.labels(indices(1:k));
        class = mode(labels);
    end

    model.classify = @classify;
end



