# An R script to convert the UCI HAR data set into a tidy data set.
#
# To use this script, download the data and extract the .zip file to your working directory.
# Data are available from:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# The script does the following:
#     0. Downloads the data set and imports the different data files, and installs needed libraries.
#     1. Merges the training and the test sets to create one data set.
#     2. Extracts the measurements on the mean and standard deviation for each measurement.
#     3. Uses descriptive activity names to name activities in the data set.
#     4. Labels the data set with descriptive vairable names.
#     5. Creates an independent tidy set with the average of each variable for each activity and each subject.

## STEP 0: DOWNLOAD AND IMPORT DATA
   # Load (and install if necessary) needed libraries.
   if(!require("data.table")){
           install.packages("data.table")
   }

   if(!require("reshape2")){
           install.packages("reshape2")
   }
 
   # Load the activity descriptions.
   activities <- read.table("UCI HAR Dataset/activity_labels.txt")
   colnames(activities) <- c("activity_id", "activity")
   
   # Load the feature descriptions.
   features <- read.table("UCI HAR Dataset/features.txt")
   
   # Load the training data.
   subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
   X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
   y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

   # Add column names to training data.
   names(subject_train) <- "subject_id"
   names(X_train) <- features$V2
   names(y_train) <- "activity"
   
   # Load the testing data.
   subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
   X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
   y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

   # Add column names to testing data.
   names(subject_test) <- "subject_id"
   names(X_test) <- features$V2
   names(y_test) <- "activity"
   
# STEP 1: MERGE DATA
   # Merge the training data.
   train <- cbind(subject_train, y_train, X_train)
   
   # Merge the testing data.
   test <- cbind(subject_test, y_test, X_test)
   
   # Merge training and testing data.
   combined_set <- rbind(train, test)
   
# STEP 2: EXTRACT MEANS AND STANDARD DEVIATIONS
   # Identify columns with 'mean()' and 'std()'.
   mean_std_cols <- grepl("mean\\(\\)",names(combined_set)) | grepl("std\\(\\)", names(combined_set)) 
   mean_std_cols[1:2] <- TRUE
   
   # Keep columns with means and stds.
   combined_set <- combined_set[, mean_std_cols]
   
# STEPs 3 & 4: USE DESCRIPTIVE NAMES AND LABELS FOR ACTIVITIES   
   combined_set$activity <- factor(combined_set$activity, labels = activities$activity)

# STEP 5: CREATE TIDY DATA SET
   melt_data <- melt(combined_set, id=c("subject_id", "activity"))
   tidy_data <- dcast(melt_data, subject_id + activity ~ variable, mean)
   
   # Write the tidy data set to a file.
   write.table(tidy_data, "UCI HAR-Tidy.txt", row.names = FALSE)