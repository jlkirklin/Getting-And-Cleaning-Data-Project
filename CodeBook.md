# Introduction

run_analysis.R performs the following actions:
Download the zip file if not alreayd present.
Unzip the zip file if not already unzipped.
Get names of features that are a direct measurement of mean, or standard deviation using the files: features.txt, and activity_labels.txt
Clean up the names to be more readable.
Bind train files together: X_train.txt, Y_train.txt, subject_train.txt
Bind test files together: X_test.txt, Y_test.txt, subject_test.txt
Combine test and train data sets.
Switch the combined data set into a long format and group by subject, activity, and measurement variable.
Calculate the mean by grouping.
Convert data to wide format.
Write data to tidy.txt

# Variables
activity_labels contains data from the activity_labels.txt file in character format
features contains data from the activity_labels.txt file in character format
features_list contains only indices of features with mean or std in them, omiting the Angles which comprise calculations of multiple features
features_names contains the names of the features that match the indices found in features_list

train contains the data bound from X_train.txt, Y_train.txt, subject_train.txt
test contains the data bound from X_test.txt, Y_test.txt, subject_test.txt

combined_data contains the collected train and test data in a table with columns for subject, activity, and each measurement.

combined_mean contains means of the data from test and train grouped on subject and activity with columns for subject, activity, and means of the measurements.
