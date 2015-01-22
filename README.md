# Summary
===
This repository contains the UCI HAR Dataset, which describes the results the "Human Activity Recognition Using Smartphones" experiment conducted in Genora, Italy. For more information on this experiment, please refer to the  `README.txt` file in the `UCI HAR Dataset` directory.  

The  `run_analysis.R` script takes the data from the `test` and `train` directories, combines them and creates an independent, tidy dataset that displays the mean values of selected accelerometer and gyroscope 3-axial raw signals, organized by each subject, then by each activity. 

# Software
===
The following software should be installed on your computer:  

* R: Version 3.1.2 ([Site](http://www.r-project.org/ "R Site"))  
* R Studio: Version 0.98.932 ([Site](http://www.rstudio.com/ "R Studio Site"))  
	
# R Packages Used
===
In addition to the base R library, The following third-party R packages are used:

* `plyr`: Used to reshape the data into narrow data format

# Setup
===
This section describes how to set your R environment to be able to run the `run_analysis.R` script and produce the tidy data.

1. Open R Studio and download .zip file of dataset:  

		download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "HARdataset.zip", method="curl")
2. Install the `plyr` package:  

		install.packages("plyr")
3. Unzip file:  
		
		unzip("HARdataset.zip")`
4. Set working directory to "UCI HAR Dataset" folder:  

		setwd("UCI HAR Dataset")
5. The `run_analysis.R` script goes in the UCI directory that contains the `test` and `train` folders
6. Load the `run_analysis.R` script to call the function:  

		source("run_analysis.R")
7. Call the `run_analysis` function to create the text file with the tidy data set:  

		run_analyis()

# View Tidy Dataset in R
===
Given that your working directory is `UCI Har Dataset`, which includes the `HAR_tidy_dataset.txt` file and the `test` and `train` folders, run the following R command:  

	dataset <- read.table("HAR_tidy_dataset.txt", header=TRUE)  
	View(dataset)
	
# Files and Folders
===
This repository includes the following files:

* **README.md**
* **Codebook.md**: Describes the variables used in the dataset and in the run_analysis.R script
* **`UCI HAR Dataset` directory:** The unzipped folder extracted from the UCI HAR Dataset set download link below. This directory contains `run_analysis.R` and the UCI-compiled dataset
* **UCI HAR Dataset/features_info.txt**: Shows information about the variables used on the feature vector
* **UCI HAR Dataset/features.txt**: List of all the features - the feature vector
* **UCI HAR Dataset/activity_labels.txt**: Links the class labels with their activity name
* **test/ **: 
	* *subject_test.txt*: Each row identifies the subject who performed the activity for each window sample in the testing trials. This data ranges from the values 1 to 30.
	* *y_test.txt*: Test labels for the activities the subjects were asked to do. The first column is the key for the activity and the second column is the activity itself. There are 6 activities.
	* *x_test.txt*: Test set that shows 
* **train/**: 
	* *subject_train.txt*: Each row identifies the subject who performed the activity for each window sample in the training trials. This data ranges from the values 1 to 30.
	* *y_train.txt*: Train labels for the activities the subjects were asked to do. The first column is the key for the activity and the second column is the activity itself. There are 6 activities.
	* *x_train.txt*: Train set
* **run_analysis.R**: Script that combines the data in the `test` and `train` directories and calculates the means for each feature that contains `mean()` and `std()`.
* **HAR_tidy_dataset.txt**: The independent, tidy dataset that has the calculated means for each features in terms of activity and subject created in run_analysis.R. The data in this file is structured in the **narrow** format.

# Sources
===
UCI HAR Dataset Download Link:  
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "UCI HAR Data Download Link")