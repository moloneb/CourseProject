# CourseProject
###Course Project for Getting and Cleaning Data
Data for this exercise was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 
More information about this data can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

The R script "run_analysis.R" extracts data to the "UCI HAR Dataset" folder in the working directory for this project.

Both the test and train datasets are read into R, containing time, frequency and angle measurements for the motion detection devices used for 6 different activities on each of 30 subjects. The subject identifiers (integers 1 to 30) and 6 activity identifiers are read into separate files. These identifiers are added with cbind to the test and train measurement datasets.
The complete test and train datasets are then joind with rbind to give a total of 10,299 observations with 563 variables (including activity and subject).

The header information is read from the "features.txt" file, and characters "- , ( and )" are removed. A numeric label is appended to each name in the header vector to avoid the problem of duplicate variable names in later code activities. The header is then added as names to the full dataset. The select function is then used to extract variables if their names include "mean" or "std". This results in a dataset of 10,299 observations and 88 variables (including activity and subject).

A full description of the variable labels can be found in Codebook.rmd file in this repo.

The activity labels are read from the "activity_labels.txt" file, and added as factor labels to the main dataset.

The main dataset is then grouped by activity and subject using the dplyer "group_by" function. The "summarise-each" function is then used to calculate the means of each of the 86 data variables, resulting in a final tidy dataset with 180 observations and 88 variables (including activity and subject). This data is then output to a text file which has been submitted separately as final_means.txt.
