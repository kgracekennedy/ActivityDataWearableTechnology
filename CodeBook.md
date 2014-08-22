#Code Book for Activity Data Taken from Wearable Technology
==============================

This is a codebook for the data in CleanActivity.txt.  Much of this is a repeat from README.md.  In the first paragraph of instructions, it says "3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md."  Then later it says "You should include a README.md in the repo describing how the script works."  To be careful, I repeated information.  

##Variables in final output CleanActivity.txt
* Activity : This notes the type of activity the participant that produced the data.

The data collected for the original UC Irvine database came from the accelerometer and gyroscope embedded in a Samsung Galaxy S II smartphone worn on the waist.  Jerk signals and the magnatude of the various signals were also recorded in the original dataset.  Much of the data was measured in 3-axial signals, and the axes were denoted by XYZ, representing the X, Y and Z directions.  You can read more about the collection of the raw data in the frequency_info.txt file in the UCIHAR_Dataset folder.


The UCIHAR_Dataset folder contains the original data readings and original calculations.  The following signals were measured for the original dataset (cut and pasted from features_info.txt):

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


These signals allowed UC Irvine to estimate the following set of variables (cut and pasted from features_info.txt): 

mean(): Mean value
std(): Standard deviation
meanFreq(): Weighted average of the frequency components to obtain a mean frequency

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The resulting estimates are the quantities used to create the variabes in CleanActivity.txt.  In the process of cleaning the UC Ivine data, the average and standard deviation of each variable were calculated.  A complete list of the variables whos mean and standard deviation were calculated are below.


##Data: Raw Data from UC Irvine

The raw data can be found in the UCIHAR_Dataset folder.  More description about the data and the assignment are in the BackgroundInfo folder.

In the first level, there are four files and two folders.
* The README.txt file in the UCIHAR_Dataset folder outlines the data collection.
* activity_levels.txt records the integers used in the data files to describe the type of activity.  For instance, if the volunteers were walking, this activity was coded as a 1, if they were walking upstairs, this activity was recorded as a 2, and so on.  The file is small (only six recorded activities), so go ahead and open up to take a peek.
* features_info.txt is an overview of the types of data that are recorded about the movement.  
* features.txt clearly names all of the data collected.

Data was taken from 30 volunteers.  Volunteers were randomly assigned to be in "test" and "training"  groups.

###Train and Test Folders
The train folder holds data for 70% of the participants.  
* subject_train.txt gives the participant id number for each moment data was collected.  
* y_train.txt give the activity they were doing at that moment.

A peek at these first two sets gives you a feel for how the data was collected.  Participant 1 did various kinds of daily activity, and for each activity, several data points were collected.  The first activity was labeled 5, which we know is standing from the activity_labels.txt file.

* x_train.txt holds the data collected using an accelerometer and gyroscope in the smartphone (Samsung Galaxy S II) worn on the waist. 

The test folder contains the same kind of information about the rest of the volunteers.

##Transformations to Data in run_analysis.R

##run_Analysis.R
There are a lot of comments directly in the code, so you may be able to follow directly from the R file.  

####Column Names and Selecting Desired Data
The first thing we do is read the features.txt file in, because these are goign to be the column names in our final data set.  Since we only want the measurements for mean and standard deviation, we extract the column numbers that have information about mean and standard deviation (noted std in the names of features) usign the grep command.

####Reading in Data
Next the code reads in subject ids, the integer codes for the activities he or she is doing, and the data collected from the Samsung Galaxy S II Smartphone.  We do this for the test then train groups.  We subset the Samsung data by the columns involving mean and standard deviation (this is the line test=testdata[,extract]).  We subset immediately after reading to work only with the necessary data.  Along the way, there are some commands that are commented out because they were used to evaluate progress as the code was written by providing "reasonabilty checks."

####Merging Data and Output
To create the final data file, the test and train data were combined into files data1 and data2 before merging.  Finally, the test and train data were merged and arranged by volunteer id.  At this point I calculated aggregate data by activity.  The activity level codes came in as a factor, so they were converted into a character vector before replacing integer activity codes with word descriptions.  A short for loop replaces the activity level codes (integers) with a word description.

In the last step, the data is saved in the local current directory as CleanActivity.txt.

##Complete List of Variable Names

"tBodyAcc-mean()-X" 
"tBodyAcc-mean()-Y" 
"tBodyAcc-mean()-Z" 
"tBodyAcc-std()-X" 
"tBodyAcc-std()-Y" 
"tBodyAcc-std()-Z" 
"tGravityAcc-mean()-X" 
"tGravityAcc-mean()-Y" 
"tGravityAcc-mean()-Z" 
"tGravityAcc-std()-X" 
"tGravityAcc-std()-Y" 
"tGravityAcc-std()-Z" 
"tBodyAccJerk-mean()-X" 
"tBodyAccJerk-mean()-Y" 
"tBodyAccJerk-mean()-Z" 
"tBodyAccJerk-std()-X" 
"tBodyAccJerk-std()-Y" 
"tBodyAccJerk-std()-Z" 
"tBodyGyro-mean()-X" 
"tBodyGyro-mean()-Y" 
"tBodyGyro-mean()-Z" 
"tBodyGyro-std()-X" 
"tBodyGyro-std()-Y" 
"tBodyGyro-std()-Z" 
"tBodyGyroJerk-mean()-X" 
"tBodyGyroJerk-mean()-Y" 
"tBodyGyroJerk-mean()-Z" 
"tBodyGyroJerk-std()-X" 
"tBodyGyroJerk-std()-Y" 
"tBodyGyroJerk-std()-Z" 
"tBodyAccMag-mean()" 
"tBodyAccMag-std()" 
"tGravityAccMag-mean()" 
"tGravityAccMag-std()" 
"tBodyAccJerkMag-mean()" 
"tBodyAccJerkMag-std()" 
"tBodyGyroMag-mean()" 
"tBodyGyroMag-std()" 
"tBodyGyroJerkMag-mean()" 
"tBodyGyroJerkMag-std()" 
"fBodyAcc-mean()-X" 
"fBodyAcc-mean()-Y" 
"fBodyAcc-mean()-Z" 
"fBodyAcc-std()-X" 
"fBodyAcc-std()-Y" 
"fBodyAcc-std()-Z" 
"fBodyAcc-meanFreq()-X" 
"fBodyAcc-meanFreq()-Y" 
"fBodyAcc-meanFreq()-Z" 
"fBodyAccJerk-mean()-X" 
"fBodyAccJerk-mean()-Y" 
"fBodyAccJerk-mean()-Z" 
"fBodyAccJerk-std()-X" 
"fBodyAccJerk-std()-Y" 
"fBodyAccJerk-std()-Z" 
"fBodyAccJerk-meanFreq()-X" 
"fBodyAccJerk-meanFreq()-Y" 
"fBodyAccJerk-meanFreq()-Z" 
"fBodyGyro-mean()-X" 
"fBodyGyro-mean()-Y" 
"fBodyGyro-mean()-Z" 
"fBodyGyro-std()-X" 
"fBodyGyro-std()-Y" 
"fBodyGyro-std()-Z" 
"fBodyGyro-meanFreq()-X" 
"fBodyGyro-meanFreq()-Y" 
"fBodyGyro-meanFreq()-Z" 
"fBodyAccMag-mean()" 
"fBodyAccMag-std()" 
"fBodyAccMag-meanFreq()" 
"fBodyBodyAccJerkMag-mean()" 
"fBodyBodyAccJerkMag-std()" 
"fBodyBodyAccJerkMag-meanFreq()" 
"fBodyBodyGyroMag-mean()" 
"fBodyBodyGyroMag-std()" 
"fBodyBodyGyroMag-meanFreq()" 
"fBodyBodyGyroJerkMag-mean()" 
"fBodyBodyGyroJerkMag-std()" 
"fBodyBodyGyroJerkMag-meanFreq()"
