
## Part.0) Download file from the web

## Part.0-1) Before download a file I'll created a new directory to put every related file into it.
if(!file.exists("CleanDataProject")){dir.create("./CleanDataProject")} 

## Part.0-2) Download a zip file from the web in the directory name 'CleanDataProject'.
## As a window user, I skipped the argument 'method="curl"' when downloading a file.
## Please add 'method="curl"' argument if you face any problem doing this.
## Unzip the file under the same directory 'CleanDataProject' by using "exdir" argument. 
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "./CleanDataProject/Dataset.zip")
unzip("./CleanDataProject/Dataset.zip", exdir = "CleanDataProject")

## Part.0-3) Assign a new directory path as a "fileDir" to make further steps easier.
fileDir <- "./CleanDataProject/UCI HAR Dataset"




## Part.1) Merges the training and the test sets to create one data set.

## Part.1-1) Get the metadata : "activityLabels","features"
## Load the data using the fileDir just assigned above.
## change the column names of activityLabels to make it clear to read, and also
## for the later step(merging with another dataset)
activityLabels <-read.table(paste(fileDir, "activity_labels.txt", sep="/"), header=F, sep="")
features <-read.table(paste(fileDir, "features.txt", sep="/"), header=F, sep="")
names(activityLabels) <- c("ActivityLabels", "Activity")


## Part.1-2) Get the 3 "train" data : "subjecttrain", "xtrain", "ytrain"
subjecttrain <- read.table(paste(fileDir, "train", "subject_train.txt", sep="/"), header=F, sep="")
xtrain <- read.table(paste(fileDir, "train", "X_train.txt", sep="/"), header=F, sep="") 
ytrain <- read.table(paste(fileDir, "train", "y_train.txt", sep="/"), header=F, sep="") 


## Part.1-3) Get the 3 "test" data : "subjecttest", "xtest", "ytest"
subjecttest <- read.table(paste(fileDir, "test", "subject_test.txt", sep="/"), header=F, sep="")
xtest <- read.table(paste(fileDir, "test", "X_test.txt", sep="/"), header=F, sep="") 
ytest <- read.table(paste(fileDir, "test", "y_test.txt", sep="/"), header=F, sep="") 


## Part.1-4) Combine the data to get all variables in a single data frame(dataSet). 
## Use cbind to combine each data set ("trainSet","testSet") with a same binding order as below.
## Use rbind to combine "trainSet" and "testSet" together into one single data set(named "dataSet").
trainSet <- cbind(subjecttrain, ytrain, xtrain)
testSet <- cbind(subjecttest, ytest, xtest)
dataSet <- rbind(trainSet, testSet)

## Change the column names of "dataSet" using "features"(see Part.1-1) variable.
## Use a tranposed data frame of "features" and extract only second row to use as column names.
names(dataSet) <- c("Subject", "ActivityLabels", t(features)[2,])

## Change the class of "Subjet" and "AvtivityLabels" columns as factor from integer.
dataSet$Subject <- as.factor(dataSet$Subject) 
dataSet$ActivityLabels <- as.factor(dataSet$ActivityLabels)




## Part.2) Extracts only the measurements on the mean and standard deviation for each measurement.

## Some of the variables which include the term either "mean" or "std" sounds very complicated.
## As it was not so clear for me to distinguish among them what to drop and what to keep, 
## I decided to keep all of them in the data set. So, literally I extract all measurements which 
## include the term "mean" and "std" except the term meanFreq(). Because this is clearly not about mean. 
## As a result, and I got 73 columns including angle variables.
meanstd <- dataSet[,c(1,2,grep("[mM]ean[^[:alpha:]]()|std[^[:alpha:]]()", names(dataSet)))]

## fix the typo error : angle(tBodyAccJerkMean),gravityMean) - error : ')' in the middle
names(meanstd)[70] <- "angle(tBodyAccJerkMean,gravityMean)"




## Part.3) Use descriptive activity names to name the activities in the data set

## By merging the new data frame "meanstd" with "activityLabels" data(see Part.1-1) 
## by common column name "ActivityLabels" we get activity names from ¡°activityLabels¡± data.
## After merging them together drop "ActivityLabels" column as we don't need it anymore. 
## Now we have activity column replacing the former ActivityLabels column.
meanstd <- merge(activityLabels, meanstd, by="ActivityLabels")
meanstd$ActivityLabels <- NULL




## Part.4) Appropriately labels the data set with descriptive variable names.

## Here we have quasi 7 different categories in each column names(Get an idea from the Discussion Forum)
## 1) domain: Time, Frequency
## 2) source: Body, Gravity
## 3) sensor: Acceleration, Gyroscopic
## 4) jerk: Yes, No
## 5) magnitude: Yes, No
## 6) statistics: Mean, StandardDeviation
## 7) axis: X, Y, Z

## I will go through above 7 steps one by one in order replacing the name,
## and reassign the result into the original data frame column names,"names(meanstd)".


## Part.4-1) domain : "t -> Time", "f -> Frequency"
## Considering Angle variables which doesn't start with "t/f", I couldn't use '^' sign.
## Rather I combine "t/f" with the following category(2 options, "Body/Gravity").
## In case of "t", subtract only the column names that include either "tBody" or "tGravity",
## and replace "t" with "Time", and then put them back to the original column names.
## Same rule applies for replacing "f" with "Frequency"
tdomain <- subset(names(meanstd), grepl("tBody|tGravity", names(meanstd)))
names(meanstd)[grep("tBody|tGravity", names(meanstd))] <- sub("t", "Time", tdomain)

fdomain <- subset(names(meanstd), grepl("fBody|fGravity", names(meanstd)))
names(meanstd)[grep("fBody|fGravity", names(meanstd))] <- sub("f", "Frequency", fdomain)


## Part.4-2) source : Body, Gravity --- "gravity -> Gravity"
## As the terms "gravity" in the angle variables start with small case, 
## Capitalize them to make all column names consistent.
names(meanstd) <- sub("gravity", "Gravity", names(meanstd))


## Part.4-3) sensor : "ACC -> Acceleration", "Gyro -> Gyroscopic"
names(meanstd) <- sub("Acc", "Acceleration", names(meanstd))
names(meanstd) <- sub("Gyro", "Gyroscopic", names(meanstd))


## Part.4-4) Jerk --- "JerK(Capital K) -> Jerk(to lower k)"
names(meanstd) <- sub("JerK", "Jerk", names(meanstd))


## Part.4-5) Magnitude: "Mag -> Magnitude"
names(meanstd) <- sub("Mag", "Magnitude", names(meanstd))


## Part.4-6) statistics: "-mean() -> Mean", "-std() -> StandardDeviation"
names(meanstd) <- sub("-mean\\(\\)", "Mean", names(meanstd))
names(meanstd) <- sub("-std\\(\\)", "StandardDeviation", names(meanstd))


## Part.4-7) axis: "-X -> X", "-Y -> Y", "-Z -> Z"(subtract "-"sign) 
names(meanstd) <- sub("\\-","", names(meanstd))


## Part.4-extra) eraise extra marks such as : "(", ")", ","
names(meanstd) <- gsub("[\\(\\)\\,]","", names(meanstd))




## Part.5) Creates a second, independent tidy data set with the average 
##         of each variable for each activity and each subject.

## Part.5-1) Use ddply(under "plyr" package) function to get a group wise average value.
library(plyr)
groupAverage <- ddply(meanstd, .(Activity, Subject), numcolwise(mean))

## Change the column names by putting "Average" at the front to better describe the variables.
names(groupAverage)[-c(1,2)] <- sapply(names(groupAverage)[-c(1,2)], 
                                       function(x) paste("Average", x, sep=""))


## Part. 5-2) Write the tidy dataset to the file.
write.table(groupAverage, "./CleanDataProject/tidy-group-average-data.txt", 
            sep=",", row.names=FALSE, quote=FALSE)
