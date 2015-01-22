# Codebook
===
### Overview: The Original Data
##### Summary
(From original `README.txt`)  

	The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

	The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.
	
##### Feature Variables  
(From original `features_info.txt`):
 	
 	The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

	Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

	Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

	These signals were used to estimate variables of the feature vector for each pattern:
	('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.)  
	
		tBodyAcc-XYZ
		tGravityAcc-XYZ
		tBodyAccJerk-XYZ
		tBodyGyro-XYZ
		tBodyGyroJerk-XYZ
		tBodyAccMag
		tGravityAccMag
		tBodyAccJerkMag
		tBodyGyroMag
		tBodyGyroJerkMag
		fBodyAcc-XYZ
		fBodyAccJerk-XYZ
		fBodyGyro-XYZ
		fBodyAccMag
		fBodyAccJerkMag
		fBodyGyroMag
		fBodyGyroJerkMag
	The set of variables that were estimated from these signals are: 
		mean(): Mean value
		std(): Standard deviation
	
	For each record it is provided:
	- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
	- Triaxial Angular velocity from the gyroscope. 
	- A 561-feature vector with time and frequency domain variables. 
	- Its activity label. 
	- An identifier of the subject who carried out the experiment.


### Overview: HAR_tidy_dataset.txt
The `HAR_tidy_dataset.txt` file consists of a table of the averages of each feature variable that measures either the mean or the standard deviation of each experimental measurement. These averages are shown in the long form of data and are organized first by subject, then by activity.
  
#### Transforming the Original Dataset:
1. Ran `read.table` function for the subject_train, y_train, x_train, subject_test, y_test, and x_test files in the `test` and `train` directories and store the data in variables of the corresponding file names
2. Combine the test data, with subject_test as the first column
3. Combine the train data using `cbind`
4. Combine the test and train data using `rbind` and label the columns correctly
5. Extract only the features that include "mean()" and "std()" in the feature name in `combined_data`
6. Give the columns in `activity_labels.txt` the names `c("Activity.Label", "Activity")` and use `read.table` to store the activity labels and activity into the `activity_labels` variable
7. Merge the combined data and `activity_labels` data by `Activity.Label`
8. Edit the given features names in the combined data to generate more descriptive column names, by:  (1) replacing "Acc" with "Accelerator", (2) replacing "Gyro" with "Gyroscope", and (3) Removing paretheses from the column names.
9. Organize the columns by "Subject", then by  "Activity.Label", and then by "Activity" and calculate the mean for each extracted variable.
10. Use `write.table` to create a text file, `HAR_tidy_dataset.txt`, a long form of the data

#### Variables Used in Tidy Dataset
##### Activity Variables  
Variables that describe the numeric activity keys performed by the subject and their corresponding qualitative value for those keys. The key is found in `HAR_tidy_dataset.txt` in the column `Activity.Label` and the value is in the column `Activity`.  

* 1: WALKING
* 2: WALKING_UPSTAIRS
* 3: WALKING_DOWNSTAIRS
* 4: SITTING
* 5: STANDING
* 6: LAYING

##### Feature Variables
The 64 feature variables extracted in run_analysis.R, subsetted from the variables listed in features.txt. Next to them, separated by a `=>`, is the corresponding descriptive name used in `HAR_tidy_dataset.txt` (name in original features.txt => name in tidy dataset). 

	tBodyAcc-mean()-X  		=> tBodyAccelerator.mean.X
	tBodyAcc-mean()-Y  		=> tBodyAccelerator.mean.Y
	tBodyAcc-mean()-Z  		=> tBodyAccelerator.mean.Z
	tBodyAcc-std()-X  		=> tBodyAccelerator.std.X
	tBodyAcc-std()-Y  		=> tBodyAccelerator.std.Y
	tBodyAcc-std()-Z  		=> tBodyAccelerator.std.Z
	tGravityAcc-mean()-X  	=> tGravityAccelerator.mean.X
	tGravityAcc-mean()-Y  	=> tGravityAccelerator.mean.Y
	tGravityAcc-mean()-Z  	=> tGravityAccelerator.mean.Z
	tGravityAcc-std()-X  	=> tGravityAccelerator.std.X
	tGravityAcc-std()-Y  	=> tGravityAccelerator.std.Y
	tGravityAcc-std()-Z  	=> tGravityAccelerator.std.Z
	tBodyAccJerk-mean()-X  	=> tGravityAccelerator.mean.X
	tBodyAccJerk-mean()-Y  	=> tBodyAcceleratorJerk.mean.Y
	tBodyAccJerk-mean()-Z  	=> tBodyAcceleratorJerk.mean.Z
	tBodyAccJerk-std()-X  	=> tBodyAcceleratorJerk.std.X
	tBodyAccJerk-std()-Y  	=> tBodyAcceleratorJerk.std.Y
	tBodyAccJerk-std()-Z  	=> tBodyAcceleratorJerk.std.Z
	tBodyGyro-mean()-X  	=> tBodyGyroscope.mean.X
	tBodyGyro-mean()-Y  	=> tBodyGyroscope.mean.Y
	tBodyGyro-mean()-Z  	=> tBodyGyroscope.mean.Z
	tBodyGyro-std()-X  		=> tBodyGyroscope.std.X
	tBodyGyro-std()-Y  		=> tBodyGyroscope.std.Y
	tBodyGyro-std()-Z  		=> tBodyGyroscope.std.Z
	tBodyGyroJerk-mean()-X	=> tBodyGyroscopeJerk.mean.X  
	tBodyGyroJerk-mean()-Y 	=> tBodyGyroscopeJerk.mean.Y   
	tBodyGyroJerk-mean()-Z 	=> tBodyGyroscopeJerk.mean.Z  
	tBodyGyroJerk-std()-X	=> tBodyGyroscopeJerk.std.X    
	tBodyGyroJerk-std()-Y	=> tBodyGyroscopeJerk.std.Y    
	tBodyGyroJerk-std()-Z	=> tBodyGyroscopeJerk.std.Z    
	tBodyAccMag-mean()		=> tBodyAcceleratorMag.mean  
	tBodyAccMag-std()  		=> tBodyAcceleratorMag.std
	tGravityAccMag-mean()	=> tGravityAcceleratorMag.mean  
	tGravityAccMag-std()  	=> tGravityAcceleratorMag.std  
	tBodyAccJerkMag-mean()	=> tBodyAcceleratorJerkMag.mean  
	tBodyAccJerkMag-std() 	=> tBodyAcceleratorJerkMag.std   
	tBodyGyroMag-mean()  	=> tBodyGyroscopeMag.mean  
	tBodyGyroMag-std()  	=> tBodyGyroscopeMag.std  
	tBodyGyroJerkMag-mean()	=> tBodyGyroscopeJerkMag.mean    
	tBodyGyroJerkMag-std() 	=> tBodyGyroscopeJerkMag.std     
	fBodyAcc-mean()-X		=> fBodyAccelerator.mean.X  
	fBodyAcc-mean()-Y  		=> fBodyAccelerator.mean.Y  
	fBodyAcc-mean()-Z  		=> fBodyAccelerator.mean.Z  
	fBodyAcc-std()-X  		=> fBodyAccelerator.std.X  
	fBodyAcc-std()-Y  		=> fBodyAccelerator.std.Y  
	fBodyAcc-std()-Z  		=> fBodyAccelerator.std.Z  
	fBodyAccJerk-mean()-X  	=> fBodyAcceleratorJerk.mean.X  
	fBodyAccJerk-mean()-Y  	=> fBodyAcceleratorJerk.mean.Y  
	fBodyAccJerk-mean()-Z  	=> fBodyAcceleratorJerk.mean.Z  
	fBodyAccJerk-std()-X  	=> fBodyAcceleratorJerk.std.X  
	fBodyAccJerk-std()-Y	=> fBodyAcceleratorJerk.std.Y  
	fBodyAccJerk-std()-Z  	=> fBodyAcceleratorJerk.std.Z  
	fBodyGyro-mean()-X		=> fBodyGyroscope.mean.X  
	fBodyGyro-mean()-Y  	=> fBodyGyroscope.mean.Y  
	fBodyGyro-mean()-Z  	=> fBodyGyroscope.mean.Z  
	fBodyGyro-std()-X  		=> fBodyGyroscope.std.X  
	fBodyGyro-std()-Y  		=> fBodyGyroscope.std.Y  
	fBodyGyro-std()-Z  		=> fBodyGyroscope.std.Z  
	fBodyAccMag-mean()		=> fBodyAcceleratorMag.mean  
	fBodyAccMag-std()  		=> fBodyAcceleratorMag.std
	fBodyBodyAccJerkMag-mean()	=> fBodyBodyAcceleratorJerkMag.mean
	fBodyBodyAccJerkMag-std() 	=> fBodyBodyAcceleratorJerkMag.std
	fBodyBodyGyroMag-mean()  	=> fBodyBodyGyroscopeMag.mean
	fBodyBodyGyroMag-std()  	=> fBodyBodyGyroscopeMag.std
	fBodyBodyGyroJerkMag-mean()	=> fBodyBodyGyroscopeJerkMag.mean  
	fBodyBodyGyroJerkMag-std()	=> fBodyBodyGyroscopeJerkMag.std  

