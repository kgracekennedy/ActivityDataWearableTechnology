#Code Book for Activity Data Taken from Wearable Technology
==============================

This is a codebook for the data in CleanActivity.txt.  Much of this is a repeat from README.md.  In the first paragraph of instructions, it says "3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md."  Then later it says "You should include a README.md in the repo describing how the script works."  To be careful, I repeated information.  

##Variables in final output CleanActivity.txt
* Activity : This notes the type of activity the participant that produced the data.

->Much of this comes directly from the UC Irvine frequency_info.txt file in the UCIHAR_Dataset folder<-

*The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.*

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


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
To create the final data file, the test and train data were combined into files data1 and data2 before merging.  Finally, the test and train data were merged and arranged by volunteer id.  The activity level codes came in as a factor, so they were converted into a character vector before replacing integer activity codes with word descriptions.  A short for loop replaces the activity level codes (integers) with a word description.

In the last step, the data is saved in the local current directory as CleanActivity.txt.
