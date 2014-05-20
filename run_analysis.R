#get the column names from features
features <- read.table("UCI HAR Dataset/features.txt")
columnNames <- as.character(features[,2])

#read in the xTest with the correct column names
xTest<-read.table("UCI HAR Dataset/test/X_test.txt", col.names=columnNames)

#read in the yTest
yTest<-read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("Activity"))

#read in the subjectTest
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names=c("Subjects"))

#bind the test columns together
testData <- cbind(subjectTest, yTest, xTest)

#read in the xTrain with the correct column names
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names=columnNames)

#read in the yTest
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt", col.names=c("Activity"))

#read in the subjectTrain
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names=c("Subjects"))

#bind the train columns together
trainData <- cbind(subjectTrain, yTrain, xTrain)

#bind the rows of the data sets together
alldata <- rbind(testData, trainData)

#only include subject, activity the means and the stand deviations in the tidy data set
tidydata <- alldata[, grep("mean|std|Activity|Subject", colnames(alldata))]

#write the tidy data set to disk
write.table(tidydata, "tidydata.txt", sep="\t")
