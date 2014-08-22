#Activity Data Taken from Wearable Technology
==============================

This is a repo for cleaning and organizing motion data collected by the Samsung Galaxy S Smartphone to prepare it for analysis.

##Included in the Repo
* BackgroundInfo folder with extra files about the project and dataset.  
  * An article about the interest of data collected from wearable sensors.
  * Description of the data from UC Irvine
  * ProjectDescription describing of the assignment
A zipped file with all of the raw data files provided by UC Irvine
* UCIHAR_Dataset folder with all of the data files.
* README.md file to outline the analysis done by me (Grace)
* run_analysis.R that does the data cleaning
* CleanActivity.txt, which is the clean, structured data that is produced by run_analysis.R
* A codebook, which has yet to be written!


##The Raw Data
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
