IMPORT $, DataPatterns;

// Browse raw input data
OUTPUT($.File_Property.File,NAMED('Property'));
COUNT($.File_Property.File);

// Profiling the raw data
// OUTPUT(DataPatterns.Profile($.File_Property.File));
// OUTPUT(DataPatterns.Benford($.File_Property.File,'assessed_value, total_value'));

// Browse clean input data
// OUTPUT($.Prep01.myDataE,NAMED('CleanProperty'));
// COUNT($.Prep01.myDataE);

// Browse clean train data and test data
// OUTPUT($.Prep01.myTrainData,NAMED('TrainData'));
// COUNT($.Prep01.myTrainData);
// OUTPUT($.Prep01.myTestData,NAMED('TestData'));
// COUNT($.Prep01.myTestData);

// Browse converted train and test data
// OUTPUT($.Convert02.myIndTrainDataNF,NAMED('IndTrain'));
// OUTPUT($.Convert02.myDepTrainDataNF,NAMED('DepTrain'));
// OUTPUT($.Convert02.myIndTestDataNF,NAMED('IndTest'));
// OUTPUT($.Convert02.myDepTestDataNF,NAMED('DepTest'));

// Test the function
// $.FN_GetPrice(95451,118720,2011,14774,1437,3,2,1,1968); //~130k
