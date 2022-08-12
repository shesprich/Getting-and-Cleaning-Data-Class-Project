# Getting-and-Cleaning-Data-Class-Project
Class project for the Coursera course Getting and Cleaning Data

# Author's note:

The original insturctions do not state two things. First, that all data loaded in run_analysis.R need to be contained in the working directory. Second, that your tidy dataset needs to be written using write.table() to a .txt file. I wrote all my scripts, README.md, and CodeBook.md under the assumptions that data would be found in the UCI_HAR_Dataset subdirectory. I have updated the scripts so they will work with data found in the working directory. However, I spent a few hours writing detailed and thourough *.md files, and I have run out of time/energy to update those. So, if you will please excuse the outdated references to UCI_HAR_Dataset in those files, I would be much appreciated. Additionally, you can ignore the tidyData.Rda and subjectAverage.Rda files.

# Description of Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

# List of Files

README.md - This file.

tidyData.Rda - An R data frame containing the tidy dataset which results from completing steps 1-4 in the above project description .

subjectAverage.Rda - An R data frame containing the tidy dataset described in step 5 in the above project description.

CodeBook.md - Contains a detailed description of all analyses performed to transform the raw data to the tidy data, as well as a description of all the variables and data contained within the repo. 
=======
subjectAverages.txt - A .txt file written to comply with additional instructions found on the submission page.

CodeBook.md - Contains a detailed description of all analyses performed to transform the raw data to the tidy data.

run_analysis.R - The primary script which (using the functions contained in load_data.R and get_subject_averages.R) converts the raw data in the UCI_HAR_Dataset directory into the data frames found in tidyData.Rda and subjectAverage.Rda.

load_data.R - A function designed to simplify loading and pre-processing the raw data found in the UCI_HAR_Dataset directory. This script is sourced by run_analysis.R.

get_subject_averages.R - A function designed to simplify taking the average of all variables by subject and activity. This script is sourced by run_analysis.R.

UCI_HAR_Dataset - Contains all the raw data used in the R script run_analysis.R. Note that the Intertial Signals subdirectories have been removed for the sake a space, as they are not needed for this analysis.
