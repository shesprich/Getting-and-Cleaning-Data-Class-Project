# This script is designed to merge the test and train data in the 
# UCI_HAR_Dataset directory into a single "tidy dataset."

# Source the load_data.R script which conatins the loadData function for loading
# and doing the initial processing of the data.
source("load_data.R")

# Define paths to both test and train data
base_path <- "UCI_HAR_Dataset"
test_path <- paste(base_path, "test", sep = "/")
train_path <- paste(base_path, "train", sep = "/")

# Load the data using the loadData function from load_data.R
testData <- loadData(test_path)
trainData <- loadData(train_path)

# Merge the two datasets
tidyData <- rbind(testData,trainData)