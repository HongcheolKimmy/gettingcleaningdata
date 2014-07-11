



## Getting and Cleaning Data Course Project CodeBook


##About Data 
**Human Activity Recognition Using Smartphones Data Set**

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone, more specifically, The 
experiments have been carried out with a group of 30 volunteers performing six activities (WALKING, WALKING-UPSTAIRS, WALKING-DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

##Data Source
* **Original raw data source (website)** - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* **Data Source for the project (zip file)** - 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


## Data Structure transformation

![Data Structure](https://raw.githubusercontent.com/HongcheolKimmy/gettingcleaningdata/master/dataSetimage.png)

![Data Structure](https://raw.githubusercontent.com/HongcheolKimmy/gettingcleaningdata/master/dataSetimage2.png)

![Data Structure](https://raw.githubusercontent.com/HongcheolKimmy/gettingcleaningdata/master/dataSetimage3.png)



## Data Structure(groupAverage dataset)


### ActivityLabels

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING


### Subject

Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


### Features
The original 561 features selected for this database come from the accelerometer and gyroscope 3-axial raw signals.(**features.txt**), among them only the measurements on the mean and standard deviation for each measurement were extracted to construct the subset dataset(meanstd), and final dataset(groupAverage) was constructed with the average of each variable for each activity and each subject from meanstd dataset.

* **Note** : Features are normalized and bounded within [-1,1]


## Variables and values(75 variables)

|   Variables   | Values    |
|----------|---------|
|   Activity   | 6 values(see above)    |
|   Subject   | 1  to 30    |
|   AverageTimeBodyAccelerationMeanX   | -1  to 1    |
|   AverageTimeBodyAccelerationMeanY   | -1  to 1    |
|   AverageTimeBodyAccelerationMeanZ   | -1  to 1    |
|   AverageTimeBodyAccelerationStandardDeviationX   | -1  to 1    |
|   AverageTimeBodyAccelerationStandardDeviationY   | -1  to 1    |
|   AverageTimeBodyAccelerationStandardDeviationZ   | -1  to 1    |
|   AverageTimeGravityAccelerationMeanX   | -1  to 1    |
|   AverageTimeGravityAccelerationMeanY   | -1  to 1    |
|   AverageTimeGravityAccelerationMeanZ   | -1  to 1    |
|   AverageTimeGravityAccelerationStandardDeviationX   | -1  to 1    |
|   AverageTimeGravityAccelerationStandardDeviationY   | -1  to 1    |
|   AverageTimeGravityAccelerationStandardDeviationZ   | -1  to 1    |
|   AverageTimeBodyAccelerationJerkMeanX   | -1  to 1    |
|   AverageTimeBodyAccelerationJerkMeanY   | -1  to 1    |
|   AverageTimeBodyAccelerationJerkMeanZ   | -1  to 1    |
|   AverageTimeBodyAccelerationJerkStandardDeviationX   | -1  to 1    |
|   AverageTimeBodyAccelerationJerkStandardDeviationY   | -1  to 1    |
|   AverageTimeBodyAccelerationJerkStandardDeviationZ   | -1  to 1    |
|   AverageTimeBodyGyroscopicMeanX   | -1  to 1    |
|   AverageTimeBodyGyroscopicMeanY   | -1  to 1    |
|   AverageTimeBodyGyroscopicMeanZ   | -1  to 1    |
|   AverageTimeBodyGyroscopicStandardDeviationX   | -1  to 1    |
|   AverageTimeBodyGyroscopicStandardDeviationY   | -1  to 1    |
|   AverageTimeBodyGyroscopicStandardDeviationZ   | -1  to 1    |
|   AverageTimeBodyGyroscopicJerkMeanX   | -1  to 1    |
|   AverageTimeBodyGyroscopicJerkMeanY   | -1  to 1    |
|   AverageTimeBodyGyroscopicJerkMeanZ   | -1  to 1    |
|   AverageTimeBodyGyroscopicJerkStandardDeviationX   | -1  to 1    |
|   AverageTimeBodyGyroscopicJerkStandardDeviationY   | -1  to 1    |
|   AverageTimeBodyGyroscopicJerkStandardDeviationZ   | -1  to 1    |
|   AverageTimeBodyAccelerationMagnitudeMean   | -1  to 1    |
|   AverageTimeBodyAccelerationMagnitudeStandardDeviation   | -1  to 1    |
|   AverageTimeGravityAccelerationMagnitudeMean   | -1  to 1    |
|   AverageTimeGravityAccelerationMagnitudeStandardDeviation   | -1  to 1    |
|   AverageTimeBodyAccelerationJerkMagnitudeMean   | -1  to 1    |
|   AverageTimeBodyAccelerationJerkMagnitudeStandardDeviation   | -1  to 1    |
|   AverageTimeBodyGyroscopicMagnitudeMean   | -1  to 1    |
|   AverageTimeBodyGyroscopicMagnitudeStandardDeviation   | -1  to 1    |
|   AverageTimeBodyGyroscopicJerkMagnitudeMean   | -1  to 1    |
|   AverageTimeBodyGyroscopicJerkMagnitudeStandardDeviation   | -1  to 1    |
|   AverageFrequencyBodyAccelerationMeanX   | -1  to 1    |
|   AverageFrequencyBodyAccelerationMeanY   | -1  to 1    |
|   AverageFrequencyBodyAccelerationMeanZ   | -1  to 1    |
|   AverageFrequencyBodyAccelerationStandardDeviationX   | -1  to 1    |
|   AverageFrequencyBodyAccelerationStandardDeviationY   | -1  to 1    |
|   AverageFrequencyBodyAccelerationStandardDeviationZ   | -1  to 1    |
|   AverageFrequencyBodyAccelerationJerkMeanX   | -1  to 1    |
|   AverageFrequencyBodyAccelerationJerkMeanY   | -1  to 1    |
|   AverageFrequencyBodyAccelerationJerkMeanZ   | -1  to 1    |
|   AverageFrequencyBodyAccelerationJerkStandardDeviationX   | -1  to 1    |
|   AverageFrequencyBodyAccelerationJerkStandardDeviationY   | -1  to 1    |
|   AverageFrequencyBodyAccelerationJerkStandardDeviationZ   | -1  to 1    |
|   AverageFrequencyBodyGyroscopicMeanX   | -1  to 1    |
|   AverageFrequencyBodyGyroscopicMeanY   | -1  to 1    |
|   AverageFrequencyBodyGyroscopicMeanZ   | -1  to 1    |
|   AverageFrequencyBodyGyroscopicStandardDeviationX   | -1  to 1    |
|   AverageFrequencyBodyGyroscopicStandardDeviationY   | -1  to 1    |
|   AverageFrequencyBodyGyroscopicStandardDeviationZ   | -1  to 1    |
|   AverageFrequencyBodyAccelerationMagnitudeMean   | -1  to 1    |
|   AverageFrequencyBodyAccelerationMagnitudeStandardDeviation   | -1  to 1    |
|   AverageFrequencyBodyBodyAccelerationJerkMagnitudeMean   | -1  to 1    |
|   AverageFrequencyBodyBodyAccelerationJerkMagnitudeStandardDeviation   | -1  to 1    |
|   AverageFrequencyBodyBodyGyroscopicMagnitudeMean   | -1  to 1    |
|   AverageFrequencyBodyBodyGyroscopicMagnitudeStandardDeviation   | -1  to 1    |
|   AverageFrequencyBodyBodyGyroscopicJerkMagnitudeMean   | -1  to 1    |
|   AverageFrequencyBodyBodyGyroscopicJerkMagnitudeStandardDeviation   | -1  to 1    |
|   AverageangleTimeBodyAccelerationMeanGravity   | -1  to 1    |
|   AverageangleTimeBodyAccelerationJerkMeanGravityMean   | -1  to 1    |
|   AverageangleTimeBodyGyroscopicMeanGravityMean   | -1  to 1    |
|   AverageangleTimeBodyGyroscopicJerkMeanGravityMean   | -1  to 1    |
|   AverageangleXGravityMean   | -1  to 1    |
|   AverageangleYGravityMean   | -1  to 1    |
|   AverageangleZGravityMean   | -1  to 1    |

