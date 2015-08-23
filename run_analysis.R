library(dplyr)
library(tidyr)
library(stringr)
unzip("C://Users/Barbara/Downloads/getdata-projectfiles-UCI HAR Dataset.zip")

# read training and test datasets with subjects and activities
dat_test <-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE, stringsAsFactors = FALSE)
dat_train <-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE, stringsAsFactors = FALSE)
test_sub <-read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
train_sub <-read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)

#read in header and clean up variable names
header <- read.table("./UCI HAR Dataset/features.txt", header=FALSE,stringsAsFactors = FALSE, sep="")
header$v2_1 <- gsub("-","",header$V2)
header$v2_1 <- gsub(",","_",header$v2_1)
header$v2_1 <- gsub("\\(","",header$v2_1)
header$v2_1 <- gsub("\\)","",header$v2_1)
header$v2_1 <-str_c(header$v2_1,rep("_",561),header$V1)
header$v2_1 <- str_to_lower(header$v2_1)

#merge test and train data and add header
dat_test1<- cbind(test_sub,test_y,dat_test)
dat_train1<- cbind(train_sub,train_y,dat_train)
datall <- rbind(dat_test1,dat_train1)
names(datall) <- c("subject","activity",header$v2_1)

#remove interim datasets and unwanted columns
rm(dat_test,dat_test1,dat_train,dat_train1)
dat_sub <- select(datall, c(subject,activity, contains("mean"), contains("std")))

#label activities
labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE,stringsAsFactors = FALSE, sep="")
levels <-c(labels$V2)
dat_sub$activity <- factor(dat_sub$activity, labels=c(levels))

#convert to table and group by activity and subject
dat_sub_tb <- tbl_df(dat_sub)
by_act_subj <- group_by(dat_sub, activity, subject)

#calculate means of each column and export as text file
final_means <-by_act_subj %>% summarise_each(funs(mean))
write.table(final_means,file="final_means.txt")
