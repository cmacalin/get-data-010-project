run_analysis <- function () {
  # Load needed packages, if any
  library(plyr)

  ## Extract and store needed test and train data, as well as feature variables, from directory
  features <- read.table("features.txt", col.names=c("Index", "Feature"))
  subject_train <- read.table("train/subject_train.txt", col.names=c("Subject"))
  y_train <- read.table("train/y_train.txt", col.names=c("Activity.Label"))
  x_train <- read.table("train/x_train.txt", col.names=features$Feature) #extract only necessary columns below
  subject_test <- read.table("test/subject_test.txt", col.names=c("Subject"))
  y_test <- read.table("test/y_test.txt", col.names=c("Activity.Label"))
  x_test <- read.table("test/x_test.txt", col.names=features$Feature) #extract only necessary columns below
  
  ## Format train and test data so that subject and activity_levels are the 2 leftmost 
  ## columns, and the remaining columns are the actual dataset
  train_data <- cbind(subject_train, y_train, x_train)
  test_data <- cbind(subject_test, y_test, x_test)
  
  # Merge the training and the test sets to create one data set.
  combined_data <- rbind(train_data, test_data)
  
  ## Extract only the measurements on the mean and standard deviation for each 
  ## measurement - they have either mean() or std() in their name
  features_sub <- features[grepl("mean\\(\\)|std\\(\\)", features$Feature), ]
  ## Get the indices of the filtered features to extract the correct columns from combined data
  features_index <- features_sub$Index
  ## Get only the desired features from the combined data
  combined_data <- combined_data[,features_sub$Index]
  
  ## Use descriptive activity names to name the activities in the data set
  activity_labels <- read.table("activity_labels.txt", col.names=c("Activity.Label","Activity"))
  ## Merge the data and activity labels to show the actual activity performed by subject
  combined_data <- merge(activity_labels, combined_data, by="Activity.Label")
  
  ## Appropriately label the data set with descriptive variable names.
  ## Replace 'Acc' with 'Accelerometer' and 'Gyro' with 'Gyroscope'
  ## Remove all parentheses from column names to avoid any potential errors in the future
  colnames(combined_data) <- gsub("Acc", "Accelerometer", colnames(combined_data))
  colnames(combined_data) <- gsub("Gyro", "Gyroscope", colnames(combined_data))
  colnames(combined_data) <- gsub("\\(\\)", "", colnames(combined_data))
  
  ## From the combined data set, create a second, independent tidy data set with the average 
  ## of each variable for each activity and each subject. Create a narrow dataset that sorts
  ## the data first by Subject, then Activity.Label, then Activity
  tidy_data <- ddply(combined_data,c("Subject","Activity.Label","Activity"), numcolwise(mean))
  
  ## Output the tidy dataset into a text file table
  write.table(tidy_data, file="HAR_tidy_dataset.txt", row.names=FALSE)
  
  ## To view table from the file in R: read.table("HAR_tidy_dataset.txt", header=TRUE)
}