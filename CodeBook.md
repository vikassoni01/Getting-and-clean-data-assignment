Getting-and-clean-data-assignment
I created one R script called run_analysis.R that does the following.
###a) Merges the training and the test sets to create one data set.

###b) Extracts only the measurements on the mean and standard deviation for each measurement. 

###c) Uses descriptive activity names to name the activities in the data set 


###d) Appropriately labels the data set with descriptive variable names. 


###e) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Variables - 
subj - Subject 
acc - activity performed by the subject

Activities Cat (categorical variable) - 
WALKING : walking during the test, WALKING_UPSTAIRS: walking up a staircase, WALKING_DOWNSTAIRS : walking down a staircase SITTING: sitting during the test, STANDING : subject was standing, LAYING : laying down 

All the measurements - 
tBodyAccMeanX, tBodyAccMeanY,tBodyAccMeanZ,tBodyAccStdX,tBodyAccStdY,tBodyAccStdZ etc all of the measurement variales mentioned in the results.df.txt

