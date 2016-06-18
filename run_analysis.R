library(tidyr)

working_zip <- "project_data.zip"

#download and unzip file if not already present
if (!file.exists(working_zip)){
    file_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(file_URL, working_zip)
}  
if (!file.exists("UCI HAR Dataset")) { 
    unzip(working_zip) 
}

#get features we want
activity_labels <- as.character(read.table("UCI HAR Dataset/activity_labels.txt")[,2])
features <- as.character(read.table("UCI HAR Dataset/features.txt")[,2])
features_list <- grep("mean|std", features)
features_names <- features[features_list]

#pretty up the naming
features_names <- gsub('[-()]', '', features_names)
features_names <- gsub('mean', 'Mean', features_names)
features_names <- gsub('std', 'Std', features_names)

#make initial data sets
train <- cbind(read.table("UCI HAR Dataset/train/subject_train.txt"),
              read.table("UCI HAR Dataset/train/Y_train.txt"), 
              read.table("UCI HAR Dataset/train/X_train.txt")[features_list])

test <- cbind(read.table("UCI HAR Dataset/test/subject_test.txt"),
              read.table("UCI HAR Dataset/test/Y_test.txt"), 
              read.table("UCI HAR Dataset/test/X_test.txt")[features_list])

#merge test and train
combined_data <- rbind(train, test)
colnames(combined_data) <- c("subject", "activity", features_names)

combined_data$activity <- factor(combined_data$activity, levels = activityLabels[,1], labels = activityLabels[,2])
combined_data$subject <- as.factor(combined_data$subject)

#convert wide data to long,  group, summarize on mean, and return to wide format
combined_mean <- gather(combined_data, variable, value, 3:length(combined_data))  %>%
    group_by(subject, activity, variable) %>%
    summarize(value=mean(value)) %>%
    spread(variable, value)

#output tidy data to file
write.table(combined_mean, "tidy.txt", row.names = FALSE, quote = FALSE)