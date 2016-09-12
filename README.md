# Getting-and-Cleaning-Data-Course-Project
Course Project

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Analysis Files
run_analysis.R  is basically a script that compiles several datasets of human activity recognition collected smartphones, cleans up the data and saves it in a much more readable form. He are some of the functions in order
1. It reads several datasets
⋅⋅*subject_test
⋅⋅⋅X_test
⋅⋅⋅y_test <- read.table("./test/y_test.txt")

#Read Train Data
subject_train <- read.table("./train/subject_train.txt")
X_train <- read.table("./train/X_train.txt")
y_train <- read.table 
