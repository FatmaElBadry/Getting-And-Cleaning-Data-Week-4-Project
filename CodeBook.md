## Project Overview & Purpose:

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Variables Used in The R Script file(run_analysis.R):   

* 'x_train', 'y_train', 'x_test', 'y_test', 'subject_train' and 'subject_test' --> contain the data from the downloaded files.
* 'features' --> contains the correct names for the 'x_train' & 'x_test'  dataset.
* 'mrgTrain' --> Merge x_train , y_train, subject_train
* 'mrgTest' --> Merge x_test , y_test, subject_test
* 'allDataMerge' --> Merge the 2 data sets 'mrgTrain' & 'mrgTest'
* 'meanSTDCols' --> A logical vector to contain the mean and std col positions
* 'meanAndStdDataSet' --> A sub set data set with only mean and std cols
* 'meanAndStdDataSetWithActName' --> A data set 'meanAndStdDataSet' adding to it a descriptive activity
* 'tidyDataSet' --> a tidy data set with the average of each variable for each activity and each subject
* 'tidyDataSetWithActivityLabel'  --> Adding descriptive activity name to the 'tidyDataSet' 

## Steps performed in the R Code:

1. Download the dataset
2. Unzip dataSet to data directory
3. Reading trainings tables.
4. Reading testing tables
5. Reading feature vector
6. Reading activity labels
7. Set column names for the datasets (As the data frames didn't have a colnames names).
8. Merging all to one dataset.
9. Get The Mean & SD & Activity Id & Subject Id.
10. Add descriptive activity names to name the activities in the data set
11. Create a tidy data set with the average of each variable for each activity and each subject.
12. Write the tidy data to a file