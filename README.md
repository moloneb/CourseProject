# CourseProject
###Course Project for Getting and Cleaning Data
Data for this exercise was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
More information about this data can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The R script "run_analysis.R" extracts data to the "UCI HAR Dataset" folder in the working directory for this project.

Both the test and train datasets are read into R, containing time, frequency and angle measurements for the motion detection devices used for 6 different activities on each of 30 subjects. The subject identifiers (integers 1 to 30) and 6 activity identifiers are read into separate files. These identifiers are added with cbind to the test and train measurement datasets.
The complete test and train datasets are then joind with rbind.

The header information is read from the "features.txt" file, and characters "- , ( and )" are removed. A numeric label is appended to each name in the header vector to avoid the problem of duplicate variable names in later code activities. The header is then added as names to the full dataset. A full description of the variable labels can be found in 

