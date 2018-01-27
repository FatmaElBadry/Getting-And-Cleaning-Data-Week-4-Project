### *0* Preprocessing Steps

#Set the working Directory
setwd("D://DataScienceCourse//Course 3//Week 4//Assignment//WD")

### *1* Download and unzip the dataset


if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip dataSet to data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")

### *2* Reading Files(Training , Testing , Features Vector, Activity Labels)

#A- Reading trainings tables:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#B- Reading testing tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#C- Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

#D- Reading activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

#E- Set column names for the datasets (As the data frames didn't have a colnames names):
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

###3 Merging all to one dataset:
mrgTrain <- cbind(y_train, subject_train, x_train)
mrgTest <- cbind(y_test, subject_test, x_test)
allDataMerge <- rbind(mrgTrain, mrgTest)

###4 Get The Mean & SD & Activity Id & Subject Id
colNames = colnames(allDataMerge)
#Need to get a subset of all the mean and standards and the correspondongin activityID and subjectID 
meanSTDCols = (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
#A subtset has to be created to get the required dataset
meanAndStdDataSet <- allDataMerge[ , meanSTDCols == TRUE]

###5 Use descriptive activity names to name the activities in the data set
meanAndStdDataSetWithActName <- merge(meanAndStdDataSet, activityLabels, by='activityId', all.x=TRUE)


###6 Create a tidy data set with the average of each variable for each activity and each subject
tidyDataSet <- aggregate(meanAndStdDataSet, by=list(meanAndStdDataSet$activityId,meanAndStdDataSet$subjectId), mean)

tidyDataSet2 <- tidyDataSet[,c(3:length(colnames(tidyDataSet)))]
tidyDataSetWithActivityLabel <- merge(activityLabels,tidyDataSet2,by='activityId', all.x=TRUE)
tidyDataSetWithActivityLabel <- tidyDataSetWithActivityLabel[order(tidyDataSetWithActivityLabel$activityId, tidyDataSetWithActivityLabel$subjectId),]

##Write the tidy data to a file
write.table(tidyDataSetWithActivityLabel, "TidySet.txt", row.name=FALSE)




