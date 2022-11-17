function model = createModel(preprocess, feature, dr, ml)
    %% Load
    train = loadData("face_train.cdataset", 1);
    test = loadData("face_test.cdataset", 1);
    
    %% Preprocess
    disp("Preprocessing")
    train.data = preprocess(train.data);
    test.data = preprocess(test.data);
    
    %% Feature Extraction
    disp("Feature Extraction")
    train.data = feature(train.data);
    test.data = feature(test.data);
    
    train.data = dr(train.data);
    test.data = dr(test.data);
    
    
    %% Train
    disp("Training")
    model = ml(train);
    
    %% Test
    disp("Evaluating")
    scores = evaluate(model, test)


    model.scores = scores;
    model.test = test;
    model.train = train;
end