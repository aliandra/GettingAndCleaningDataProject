# Getting And Cleaning Data Project Code Book

The run_analysis.R script produces a tidy data set of 11,880 observations of 4 variables

## Variable
1. Subject - this variable identifies which of the 30 subjects carried out the experiment
2. Activity - this variable identifies which of the 6 activities was carried out by the subject (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
3. variable - this variable identifies which of the 67 feature variables is measured (see Feature Variable below)
4. value - this value represents the mean of the feature variable for the indicated subject and activity

## Feature Variables
According to the authors of the experiment[1], the features measurements come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAccelerometer-XYZ and TimeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerometerJerk-XYZ and TimeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccelerometerMag, TimeGravityAccelerometerMag, TimeBodyAccelerometerJerkMag, TimeBodyGyroscopeMag,TimetBodyGyroscopeJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FrequencyBodyAccelerometer-XYZ, FrequencyBodyAccelerometerJerk-XYZ, FrequencyBodyGyroscope-XYZ, FrequencyBodyAccelerometerJerkMag, FrequencyBodyGyroscopeMag, FrequencyBodyGyroscopeJerkMag.  

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Feature Variables in the tidyData set include:
TimeBodyAccelerometerMeanX
TimeBodyAccelerometerMeanY
TimeBodyAccelerometerMeanZ
TimeBodyAccelerometerStandardDeviationX
TimeBodyAccelerometerStandardDeviationY
TimeBodyAccelerometerStandardDeviationZ
TimeGravityAccelerometerMeanX
TimeGravityAccelerometerMeanY
TimeGravityAccelerometerMeanZ
TimeGravityAccelerometerStandardDeviationX
TimeGravityAccelerometerStandardDeviationY
TimeGravityAccelerometerStandardDeviationZ
TimeBodyAccelerometerJerkMeanX
TimeBodyAccelerometerJerkMeanY
TimeBodyAccelerometerJerkMeanZ
TimeBodyAccelerometerJerkStandardDeviationX
TimeBodyAccelerometerJerkStandardDeviationY
TimeBodyAccelerometerJerkStandardDeviationZ
TimeBodyGyroscopeMeanX
TimeBodyGyroscopeMeanY
TimeBodyGyroscopeMeanZ
TimeBodyGyroscopeStandardDeviationX
TimeBodyGyroscopeStandardDeviationY
TimeBodyGyroscopeStandardDeviationZ
TimeBodyGyroscopeJerkMeanX
TimeBodyGyroscopeJerkMeanY
TimeBodyGyroscopeJerkMeanZ
TimeBodyGyroscopeJerkStandardDeviationX
TimeBodyGyroscopeJerkStandardDeviationY
TimeBodyGyroscopeJerkStandardDeviationZ
TimeBodyAccelerometerMagMean
TimeBodyAccelerometerMagStandardDeviation9
TimeGravityAccelerometerMagMean
TimeGravityAccelerometerMagStandardDeviation
TimeBodyAccelerometerJerkMagMean
TimeBodyAccelerometerJerkMagStandardDeviation
TimeBodyGyroscopeMagMean
TimeBodyGyroscopeMagStandardDeviation
TimeBodyGyroscopeJerkMagMean
TimeBodyGyroscopeJerkMagStandardDeviation
FrequencyBodyAccelerometerMeanX
FrequencyBodyAccelerometerMeanY
FrequencyBodyAccelerometerMeanZ
FrequencyBodyAccelerometerStandardDeviationX
FrequencyBodyAccelerometerStandardDeviationY
FrequencyBodyAccelerometerStandardDeviationZ
FrequencyBodyAccelerometerJerkMeanX
FrequencyBodyAccelerometerJerkMeanY
FrequencyBodyAccelerometerJerkMeanZ
FrequencyBodyAccelerometerJerkStandardDeviationX
FrequencyBodyAccelerometerJerkStandardDeviationY
FrequencyBodyAccelerometerJerkStandardDeviationZ
FrequencyBodyGyroscopeMeanX
FrequencyBodyGyroscopeMeanY
FrequencyBodyGyroscopeMeanZ
FrequencyBodyGyroscopeStandardDeviationX
FrequencyBodyGyroscopeStandardDeviationY
FrequencyBodyGyroscopeStandardDeviationZ
FrequencyBodyAccelerometerMagMean
FrequencyBodyAccelerometerMagStandardDeviation5
FrequencyBodyBodyAccelerometerJerkMagMean
FrequencyBodyBodyAccelerometerJerkMagStandardDeviation
FrequencyBodyBodyGyroscopeMagMean
FrequencyBodyBodyGyroscopeMagStandardDeviation
FrequencyBodyBodyGyroscopeJerkMagMean
FrequencyBodyBodyGyroscopeJerkMagStandardDeviation

##Transformation
1. Merge the relavant data into one data set - The data is read into a dataframe called phone_data where the first column consists of subject number from both the train and test groups, the second column is the activity performed when the measurement was taken, and columns 3 to 563 are the feature data variables. Subsequently the columns are labled using the names in features.txt

2. Extract only the measurements on the mean and standard deviation for each measurement - A new dataframe called clean_phone_data is created using only the measurements on the mean and standard deviation for each measurement. This is done by selecting the columns which have the string "mean" or "std" in them, and also removing columns which contain "meanFreq" since this is not a measurement we are looking to include.

3. Use descriptive activity names to name the activities in the data set - first we read in the activity_labels from the file activity_labels.txt. We then introduce the factor levels to the Activity column transforming the values from integer values to the related WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING factor levels. 

4. Appropriately label the data set with descriptive variable names - The variable names are then cleaned to be more descriptive and remove punctuation.

5. Creates a tidy data set called tidyData with the average of each variable for each activity and each subject - the clean_phone_data is then melted to 4 variables (Subject, Activity, Variable, and Value) where variable represents all of the feature variables listed above. The mean of each feature variable for each subject and each activity is then calulated and melted into the dataframe tidyData. The row are then subsequently arranged by subject and then activity, and the final dataframe written to the tidyData.txt file.

[1]Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012