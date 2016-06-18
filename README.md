Getting and Cleaning Data - Course Project
==========================================

This Repository contains the week 4 project assignment for the Coursera Getting and Cleaning Data course. 

All data used in this project comes from Human Activity Recognition Using Smartphones
found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## Files

This code will download the data from the URL https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It will then unzip the compressed files and perform a series of actions to combine the data sets, group, tidy, and find the mean.

The actions specified in the project prompt are as follows:

1.) Merges the training and the test sets to create one data set.

2.) Extracts only the measurements on the mean and standard deviation for each measurement.

3.) Uses descriptive activity names to name the activities in the data set

4.) Appropriately labels the data set with descriptive variable names.

5.) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run_analysis.R will contain the source code of the project
CodeBook.md will describe data and transformations performed
tidy.txt contains the final tidy data output


