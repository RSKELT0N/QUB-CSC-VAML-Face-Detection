function model = createModel(preprocess, feature, dr, ml)
    %% Load
    train = loadData("face_train.cdataset", 1);
    test = loadData("face_test.cdataset", 1);

    %% Extract data
    train.data = extractData(preprocess, feature, dr, train.data, 1);
    test.data = extractData(preprocess, feature, dr, test.data, 1);
    
    %% Train
    disp("Training")
    model = ml(train);
    
    %% Test
    disp("Evaluating")
    scores = evaluate(model, test)

    model.scores = scores;
    model.test = test;
    model.train = train;
    model.preprocess = preprocess;
    model.feature = feature;
    model.dr = dr;
end