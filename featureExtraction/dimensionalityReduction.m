function f = dimensionalityReduction(n)

    function dataReduced = internal(data)
        [~, dataReduced] = pca(data, 'NumComponents', n);
    end

    f = @internal;
end