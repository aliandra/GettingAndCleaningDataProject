## Getting and Cleaning Data - Project
library(dplyr)
library(reshape2)


## 1. Merge the training and the test sets to create one data set

## Read data into dataframe - first column is Subject, second is Activity, 
## columns 3 to 563 is the feature data. Rows are observations of the test and train 
## datasets
phone_data <- rbind(
        cbind(read.table("./test/subject_test.txt"), 
              read.table("./test/y_test.txt"), 
              read.table("./test/X_test.txt")
              ),
        cbind(read.table("./train/subject_train.txt"), 
              read.table("./train/y_train.txt"), 
              read.table("./train/X_train.txt")
              )
        )

## label columns
features <- read.table("./features.txt")
c_names <- make.names(as.vector(features[ , 2]), unique = TRUE)
colnames(phone_data) <- c("Subject", "Activity", c_names)






## 2.Extract only the measurements on the mean and standard deviation for each 
##   measurement

## new data frame with columns for Subject, Activity, mean and standard dev
selection <- intersect(grep("mean|std", names(phone_data)), 
                       grep("meanFreq",names(phone_data), invert = TRUE))
clean_phone_data <- phone_data[ , c(1, 2, selection)]




## 3. Use descriptive activity names to name the activities in the data set

## assign activity labels to levels of Activity factor
activity_labels <- read.table("./activity_labels.txt")
clean_phone_data$Activity <- factor(clean_phone_data$Activity)
levels(clean_phone_data$Activity) <- as.vector(activity_labels[ ,2])




## 4. Appropriately label the data set with descriptive variable names

names(clean_phone_data) <- sub("^t", "Time", names(clean_phone_data))
names(clean_phone_data) <- sub("mean", "Mean", names(clean_phone_data))
names(clean_phone_data) <- sub("std", "StandardDeviation", names(clean_phone_data))
names(clean_phone_data) <- sub("^f", "Frequency", names(clean_phone_data))
names(clean_phone_data) <- sub("Acc", "Accelerometer", names(clean_phone_data))
names(clean_phone_data) <- sub("Gyro", "Gyroscope", names(clean_phone_data))
names(clean_phone_data) <- gsub("\\.", "", names(clean_phone_data))




## 5. From the data set in step 4, creates a second, independent tidy data set with the 
##    average of each variable for each activity and each subject

## melt Data 
meltData <- melt(clean_phone_data, id = names(clean_phone_data)[1:2], 
                 measure.vars = names(clean_phone_data)[3:68])

## new dataset with average of each variable for activity and subject
ProjData <- dcast(meltData, Subject + Activity ~ variable, mean)

## melt data for better formatting
tidyData <- melt(ProjData, id = names(ProjData)[1:2], 
                     measure.vars = names(ProjData)[3:68])

## arrange data in assending order by first two columns - Subject then Activity
tidyData <- arrange(tidyData, Subject, Activity)

## write tidyData to txt file
write.table(tidyData, file = "tidydata.txt", row.names = FALSE)