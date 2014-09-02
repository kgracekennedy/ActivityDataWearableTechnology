#Activity Data Taken from Wearable Technology
==============================

This is a repo for cleaning and organizing motion data collected by the Samsung Galaxy S II Smartphone to prepare it for analysis.

##Included in the Repo
* BackgroundInfo folder with extra files about the project and dataset.  
  * An article about the interest of data collected from wearable sensors.
  * Description of the data from UC Irvine
  * ProjectDescription describing of the assignment
A zipped file with all of the raw data files provided by UC Irvine
* UCIHAR_Dataset folder with all of the data files.  This is more carefully described in the raw data section.
* README.md file to outline the analysis done by me (Grace)
* run_analysis.R that does the data cleaning
* CleanActivity.txt, which is the clean, structured data that is produced by run_analysis.R
* A codebook, describing the variables and process

Thank you to my peers who reviewed the code.  I made adjustments based on your suggestions.

##The Raw Data
The raw data can be found in the UCIHAR_Dataset folder.  More description about the data and the assignment are in the BackgroundInfo folder.

In the first level, there are four files and two folders.
* The README.txt file in the UCIHAR_Dataset folder outlines the data collection.
* activity_levels.txt records the integers used in the data files to describe the type of activity.  For instance, if the volunteers were walking, this activity was coded as a 1, if they were walking upstairs, this activity was recorded as a 2, and so on.  The file is small (only six recorded activities), so go ahead and open up to take a peek.
* features_info.txt is an overview of the types of data that are recorded about the movement.  
* features.txt clearly names all of the data collected.

Data was taken from 30 volunteers.  In the original experiment, volunteers were randomly assigned to be in "test" and "training"  groups.

###Train and Test Folders
The train folder holds data for 70% of the participants.  
* subject_train.txt gives the participant id number for each moment data was collected.  
* y_train.txt give the activity they were doing at that moment.

A peek at these first two sets gives you a feel for how the data was collected.  Participant 1 did various kinds of daily activity, and for each activity, several data points were collected.  The first activity was labeled 5, which we know is standing from the activity_labels.txt file.

* x_train.txt holds the data collected using an accelerometer and gyroscope in the smartphone (Samsung Galaxy S II) worn on the waist. 

The test folder contains the same kind of information about the rest of the volunteers.

##run_Analysis.R
There are a lot of comments directly in the code, so you may be able to follow directly from the R file.  

####Column Names and Selecting Desired Data
The first thing we do is read the features.txt file in, because these are goign to be the column names in our final data set.  Since we only want the measurements for mean and standard deviation, we extract the column numbers that have information about mean and standard deviation (noted std in the names of features) usign the grep command.

####Reading in Data
Next the code reads in subject ids, the integer codes for the activities he or she is doing, and the data collected from the Samsung Galaxy S II Smartphone.  We do this for the test then train groups.  We subset the Samsung data by the columns involving mean and standard deviation (this is the line test=testdata[,extract]).  We subset immediately after reading to work only with the necessary data.  Along the way, there are some commands that are commented out because they were used to evaluate progress as the code was written by providing "reasonabilty checks."

####Merging Data and Output
To create the final data file, the test and train data were combined into files data1 and data2 before merging. Finally, the test and train data were merged and arranged by volunteer id. At this point I calculated aggregate data by activity. The activity level codes came in as a factor, so they were converted into a character vector before replacing integer activity codes with word descriptions. A short for loop replaces the activity level codes (integers) with a word description.

In the last step, the data is saved in the local current directory as CleanActivity.txt.
