# Codebook
===
### UCI HAR Dataset Variables
(Taken from *insert file name here*)

### Original Data
All features listed in `/UCI HAR Dataset/features.txt`

### run_analysis.R
#### Assumptions:
* Working directory is the unzipped `UCI HAR Dataset` directory
* `run_analysis.R` script is located in the working directory, where both the train and test directories are located.

#### Generating the Tidy Dataset:
1. Ran `read.table` function for the subject_train, y_train, x_train, subject_test, y_test, and x_test files in the `test` and `train` directories and store the data in variables of the corresponding file names
2. Combine the test data, with subject_test as the first column
3. Combine the train data using `cbind`
4. Combine the test and train data using `rbind` and label the columns correctly
5. Extract only the features that include "mean()" and "std()" in the feature name in `combined_data`
6. Give the columns in `activity_labels.txt` the names `c("Activity.Label", "Activity")` and use `read.table` to store the activity labels and activity into the `activity_labels` variable
7. Merge the combined data and `activity_labels` data by "Activity.Label"
8. Edit the given features names in the combined data to generate more descriptive column names
9. Organize the columns by "Subject", then by  "Activity.Label", and then by "Activity" and apply the mean for each variable in this sort??
10. Use `write.table` to create a text file, `HAR_tidy_dataset.txt`, a long form of the data

### HAR_tidy_dataset.txt Variables

Variables used in run_analysis.R, subsetted from the variables listed in features.txt:
(Note: Acc=accelerometer, Gyro=gyroscope)

	tBodyAcc-mean()-X  
	tBodyAcc-mean()-Y  
	tBodyAcc-mean()-Z  
	tBodyAcc-std()-X  
	tBodyAcc-std()-Y  
	tBodyAcc-std()-Z  
	tGravityAcc-mean()-X  
	tGravityAcc-mean()-Y  
	tGravityAcc-mean()-Z  
	tGravityAcc-std()-X  
	tGravityAcc-std()-Y  
	tGravityAcc-std()-Z  
	tBodyAccJerk-mean()-X  
	tBodyAccJerk-mean()-Y  
	tBodyAccJerk-mean()-Z  
	tBodyAccJerk-std()-X  
	tBodyAccJerk-std()-Y  
	tBodyAccJerk-std()-Z  
	tBodyGyro-mean()-X  
	tBodyGyro-mean()-Y  
	tBodyGyro-mean()-Z  
	tBodyGyro-std()-X  
	tBodyGyro-std()-Y  
	tBodyGyro-std()-Z  
	tBodyGyroJerk-mean()-X  
	tBodyGyroJerk-mean()-Y  
	tBodyGyroJerk-mean()-Z  
	tBodyGyroJerk-std()-X  
	tBodyGyroJerk-std()-Y  
	tBodyGyroJerk-std()-Z  
	tBodyAccMag-mean()  
	tBodyAccMag-std()  
	tGravityAccMag-mean()  
	tGravityAccMag-std()  
	tBodyAccJerkMag-mean()  
	tBodyAccJerkMag-std()  
	tBodyGyroMag-mean()  
	tBodyGyroMag-std()  
	tBodyGyroJerkMag-mean()  
	tBodyGyroJerkMag-std()  
	fBodyAcc-mean()-X  
	fBodyAcc-mean()-Y  
	fBodyAcc-mean()-Z  
	fBodyAcc-std()-X  
	fBodyAcc-std()-Y  
	fBodyAcc-std()-Z  
	fBodyAccJerk-mean()-X  
	fBodyAccJerk-mean()-Y  
	fBodyAccJerk-mean()-Z  
	fBodyAccJerk-std()-X  
	fBodyAccJerk-std()-Y  
	fBodyAccJerk-std()-Z  
	fBodyGyro-mean()-X  
	fBodyGyro-mean()-Y  
	fBodyGyro-mean()-Z  
	fBodyGyro-std()-X  
	fBodyGyro-std()-Y  
	fBodyGyro-std()-Z  
	fBodyAccMag-mean()  
	fBodyAccMag-std()  
	fBodyBodyAccJerkMag-mean()  
	fBodyBodyAccJerkMag-std()  
	fBodyBodyGyroMag-mean()  
	fBodyBodyGyroMag-std()  
	fBodyBodyGyroJerkMag-mean()  
	fBodyBodyGyroJerkMag-std()  

