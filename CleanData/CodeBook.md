#Code Book
This code book describes the various data files used in this project and the processing required to create the resulting tidy data set. The overview and 
##Overview
30 subjects between the ages of 19-48 performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying) while wearing a Samsung Galaxy S II smartphone. 3-axial linear acceleration and 3-axial angular velocity were captured using the smartphones’ embedded accelerometer and gyroscope.
##Data Files Used
As Anguita et al. (2013) describe, their data include:
* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

In addition, the following file is produced using the run_analysis.R script:
* ‘UCI HAR-Tidy.txt’: A tidy data set of the means and standard deviations for the six activities found in Anguita et al.’s (2013) original data.

##Data Files Excluded
Anguita et al.’s (2013) data also include the following files which were not used to create the tidy data set. These files are:
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

##Processing Steps
1. The relevant data files are loaded and column headers added.
2. The data files are merged into a single data file.
3. Columns that do not match the exact string "mean()" or "std()" are removed from the merged data file, leaving 66 columns and the subject_id of the activity columns.
4. The activity column is converted from an integer to a factor using labels to describe the activities.
5. A tidy data set is created consisting of the mean and standard deviation of each feature for each subject and activity.
6. The tidy data set is output to a .txt file.
