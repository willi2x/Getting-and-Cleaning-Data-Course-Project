## PART 1: Merges the training and the test sets to create one data set

#Load all required Packages
library(downloader)
library(data.table)
library(dplyr)

#Create Directory
#Download zip file and extract data using the downloader package
#Set Working Directory
if(!file.exists("C:/wd/data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(fileUrl, dest="dataset.zip", mode="wb") 
unzip(zipfile="./dataset.zip",exdir="./data")
setwd("C:/wd/data/UCI HAR Dataset")

#Read test data 
subject_test <- read.table("./test/subject_test.txt")
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")

#Read Train Data
subject_train <- read.table("./train/subject_train.txt")
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")

#Read activity lables
activityLabels <- read.table("./activity_labels.txt", header = FALSE)

#Adding Column for Subject files
#Adding Column For Activity
#Adding Features from txt file
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"
names(y_train) <- "activity"
names(y_test) <- "activity"
features <- read.table("features.txt")
names(X_train) <- features$V2
names(X_test) <- features$V2


#Combine all elements of train
trainCombined <- cbind(subject_train, y_train, X_train)
#Combine all elements of test
testCombined <- cbind(subject_test, y_test, X_test)
#Combine both test and train together
allCombined <- rbind(trainCombined, testCombined)

## PART 2: Extracts only the measurements on the mean and standard deviation for each measurement.

#Extracting the mean and sd using grepl function
meanANDsd <- grepl("mean\\(\\)", names(allCombined)) |
      grepl("std\\(\\)", names(allCombined))
#so we don't lose subjectID and anctivity
meanANDsd[1:2] <- TRUE

#storing extracted data in new object
allCombined <- allCombined[, meanANDsd]


##PART 3: Uses descriptive activity names to name the activities in the data set 

#Adding activity labels from txt file
allCombined$activity <- as.character(allCombined$activity)
for (i in 1:6){
       allCombined$activity[allCombined$activity == i] <- as.character(activityLabels[i,2])
}

#Change subjectID and activity variable from character to factor
allCombined$activity <- as.factor(allCombined$activity)
allCombined$subjectID <- as.factor(allCombined$subjectID)
allCombined <- data.table(allCombined)

##PART 4: Appropriately labels the data set with descriptive variable names

#clean up sloppy names
names(allCombined)<-gsub("BodyBody", "Body", names(allCombined))
names(allCombined)<-gsub("Mag", "Magnitude", names(allCombined))
names(allCombined)<-gsub("^f", "Frequency", names(allCombined))
names(allCombined)<-gsub("angle", "Angle", names(allCombined))
names(allCombined)<-gsub("gravity", "Gravity", names(allCombined))
names(allCombined)<-gsub("Gyro", "Gyroscope", names(allCombined))
names(allCombined)<-gsub("Acc", "Accelerometer", names(allCombined))
names(allCombined)<-gsub("^t", "Time", names(allCombined))
names(allCombined)<-gsub("tBody", "TimeBody", names(allCombined))
names(allCombined)<-gsub("-std()", "STD", names(allCombined), ignore.case = TRUE)
names(allCombined)<-gsub("-mean()", "Mean", names(allCombined), ignore.case = TRUE)
names(allCombined)<-gsub("-freq()", "Frequency", names(allCombined), ignore.case = TRUE)

## Part 5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Make tidy txt file
tidy <- aggregate(.~subjectID + activity, allCombined, mean)
tidy<- tidy[order(tidy$subjectID,tidy$activity),]
write.table(tidy, file = "Tidy.txt", row.names = FALSE)







