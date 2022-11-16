function model = knnProb(train, k)

    function probability = classify(data) 
        distances = zeros(1, size(train.data, 1));
        distances(1, :) = intmax;
         
        for i = 1: size(train.data, 1)
            distances(i) = EuclideanDistance(data, train.data(i,:));
        end
        
        [~, indices] = sort(distances);
    
        labels = train.labels(indices(1:k));
        probability = size(find(labels==1), 1)/k;
    end

    model.classify = @classify;

end