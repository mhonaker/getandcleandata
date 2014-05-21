# download and unzip file, read in file to data frame
samData <- paste0(getwd(), "/samData.zip")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = samData)
# download date 5/12/2014
unzip("samData.zip")
setwd('UCI HAR Dataset')
library(plyr)
library(reshape2)

# read in variable and activity names, change cases and get rid of bad characters
varnames <- read.table("features.txt", colClasses = c("numeric", "character"), header = F)
char <- c("\\(", "\\)", ",", "-", "_", " ")
names < varnames$V2
for(i in char){
        names <- gsub(i, "", names)
}
varnames$V2 <- tolower(names)
varnames$V2 <- gsub("bodybody", "body", varnames$V2)
actlab <- read.table("activity_labels.txt", colClasses= "character",header = F)
actlab[,2] <- tolower(gsub("_", "", actlab[,2]))

# read in training set subject ids and activity type y values, replace activity number 
# identifiers with activity names, add variable names to columns
trainsub <- read.table(paste0(getwd(),"/train/subject_train.txt"), header = F, col.names = "subjectid")
trainy <- read.table(paste0(getwd(), "/train/y_train.txt"), header = F, colClasses = "character", col.names = "activity")
trainy$activity <- mapvalues(trainy$activity, from = actlab[,1], to = actlab[,2])

#read in training set data, and add columns for subject ids and activities
train <- read.table(paste0(getwd(), "/train/X_train.txt"), 
                     colClasses = "numeric", header = F, col.names = varnames$V2)
train <- data.frame(subjectid = trainsub, train)
train$activity <- trainy$activity

# do all the same with the test data
testsub <- read.table(paste0(getwd(),"/test/subject_test.txt"), header = F, col.names = "subjectid")
testy <- read.table(paste0(getwd(), "/test/y_test.txt"), header = F, colClasses = "character", col.names = "activity")
testy$activity <- mapvalues(testy$activity, from = actlab[,1], to = actlab[,2])
test <- read.table(paste0(getwd(), "/test/X_test.txt"), 
                    colClasses = "numeric", header = F, col.names = varnames$V2)
test <- data.frame(subjectid = testsub, test)
test$activity <- testy$activity

# merge the training and test data sets, reorder by subject id, turn subject id and activity into factors
data <- rbind(train, test)
data <- data[order(data$subjectid),]
data$activity <- as.factor(data$activity)
data$subjectid <- as.factor(data$subjectid)

# trim the data to only include means and standard deviations of variables
# (along with subject id and activity), but removing mean based vector angles and mean freqencies
data2 <- subset(data, select = grep(pattern = "mean|std|subject|activity", names(data)))
data3 <- melt(data2, id= c("subjectid", "activity"))
data4 <- dcast(data3, subjectid + activity ~ variable, mean)

# do a little renaming and write to file
names(data4) <- gsub("tbody", "timebody", names(data4))
names(data4) <- gsub("tgrav", "timegravity", names(data4))
names(data4) <- gsub("acc", "acceleration", names(data4))
names(data4) <- gsub("fbody", "freqencybody", names(data4))
names(data4) <- gsub("std", "stddeviation", names(data4))
names(data4) <- gsub("mag", "magnitude", names(data4))
write.table(data4, file = "tidyData.txt", quote = F, row.names = F)