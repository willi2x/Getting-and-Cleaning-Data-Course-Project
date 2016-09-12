# Getting-and-Cleaning-Data-Course-Project
Course Project

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Analysis Files
run_analysis.R  is basically a script that combines multiple datasets of human activity recognition collected by smartphones, cleans up the data and saves it in a much more readable form. He are the functions in order:

#### It reads several datasets
1. subject_test 
2. X_test
3. y_test
4. subject_train 
5. X_train 
6. y_train 

#### It merges these datasets
1. Merging all elements of the test datasets to an object called "testCombined" 
2. Merging all elements of the train datasets to an object called "trainCombined"
3. Merging both "testCombined" and "trainCombined" to an object called "allCombined"

#### It extracts only the mean and the sd
1. using the grepl function we sort and save these variables to an object called meanANDsd
2. we then re add it to the allComined object

#### It changes the activity variable from number to more decriptive labels as dicbribed in the document activity_labels.txt 

#### It cleans up all the labels so that they are more decriscriptive abd easier to understand

#### It creates more tidy dataset and saves it to a file called tidy.txt
 


