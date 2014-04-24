Read Me

run_analysis.R can run in the file with 1)file "test" and 2) file "train", and the 3)features.txt
File "test" has the X_test.txt and y_test.txt which store the test data.
File "train" has the X_train.txt and y_test.txt which store teh train data.
Features.txt stores the corresponding features in X_train and X_test data set.

The run_analysis.R script first loads in the necesary data set from the set. Then merge the test and train data sets. Here I create a label for isTrain, which is useless in this project but maybe useful for furthure research.

The second part of the script extract the features we need. As to the detailed of the features, please refer to Code Book.

The third part combine descriptive name to the activity instead of simple code 1~6.

The last part of the script creat a new table with the average of each variable for each activity and each subject. There are 6 activities and 30 subjects. And there are 79 features. Thus the size of the table is (6+30) * 79. 

