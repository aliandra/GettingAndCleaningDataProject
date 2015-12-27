# Getting And Cleaning Data Project
## Synopsis
This project produces a tidy data set using data collected from the accelerometers of the Samsung Galaxy S II smartphone on a group of 30 volunteers who performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing the smartphone on their waist. The run.analysis.R file can be run as long as the following Samsung data is in your working directory: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


## Code Example
The run_analysis.R file does the following:
1. Merges the relavant data into one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names 
5. Creates a tidy data set called tidyData with the average of each variable for each activity and each subject

## Motivation
This is the course project for the Coursera class "Getting and Cleaning Data". The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. Submittied with this assignment are the following:
1. this README.md file to explain how the script works
2. a code book called CodeBook.md that describes the variables, the data, and the transformations performed to clean up the data
3. an R script called run_analysis.R which produces a tidy data set