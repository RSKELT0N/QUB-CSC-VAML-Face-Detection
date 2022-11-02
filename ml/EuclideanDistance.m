function dEuc = EuclideanDistance(sample1, sample2)
    [~, S1Cols] = size(sample1);
    [~, S2Cols] = size(sample2);

    if(S1Cols ~= S2Cols)
        return;
    end

    
    distance = (double(sample1) - double(sample2)).^2;

    dEuc = double(sqrt(sum(distance)));
end