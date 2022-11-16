function edges = edgeExtraction(data)
    B1=[-1 0 1; -1 0 1; -1 0 1];
    B2=[-1 -1 -1; 0 0 0; 1 1 1];
    
    for i = 1:size(data, 1)
        Iin = reshape(data(i, :), [27 18]);
        Iin = double(Iin);
        Iver = conv2(B1, Iin);
        Ihor = conv2(B2, Iin);

        edgesThis = sqrt((Iver.^2)+(Ihor.^2));
        %edgesThis = reshape(edgesThis.',1);
        edgesThis = reshape(edgesThis, [1 size(edgesThis, 1)*size(edgesThis, 2)]);
        edges(i, :) = edgesThis;
    end

    
end