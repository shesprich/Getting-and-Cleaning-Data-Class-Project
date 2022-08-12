# This script is designed to merge the test and train data in the 
# UCI_HAR_Dataset directory into a single "tidy dataset."

# Load dplyr
library(dplyr)

# Source the load_data.R script which contains the loadData function for loading
# and doing the initial processing of the data.
source("load_data.R")

# Source the get_subject_averages.R script which contains the getSubjectAverages
# function for calculating the activity wise and subject wise averages
source("get_subject_averages.R")


#------------------------------------------------------------------------------
# Updated code. The project instructions did not specify that the script
# needed to load data from the current working directory, but the submission
# instructions do. I commented out then updated this section of the code
# to comply with the updated instructions.
#------------------------------------------------------------------------------
## Define paths to both test and train data
#base_path <- "UCI_HAR_Dataset"
#test_path <- paste(base_path, "test", sep = "/")
#train_path <- paste(base_path, "train", sep = "/")

test_path <- "test"
train_path <- "train"

# Load the data using the loadData function from load_data.R
testData <- loadData(test_path)
trainData <- loadData(train_path)

# Merge the two datasets
tidyData <- rbind(testData,trainData)

# Now that we have our merged dataset we can free up memory by deleting the
# the two intermediate datasets.
rm(list = c("testData", "trainData"))

# Now let's make the variables more descriptive.
features <- names(tidyData)

# Explicitly state whether this variable is in the time or frequency domain
features <- gsub("^t(.*)", "TimeDomain-\\1", features)
features <- gsub("^f(.*)", "FrequencyDomain-\\1", features)

# Explicitly state instrument used gather variable
features <- gsub("Acc", "Accelerometer-", features)
features <- gsub("Gyro", "Gyroscope-", features)

# There are four variables for each measurement X, Y, Z, and Magnitude.
# Let's rename Mag to Magnitude, and put it at the end of the name to match
# with where the X, Y, and Z descriptors are.
features <- gsub("(.*)Mag(.*)", "\\1\\2-Magnitude", features)

# Rename std() to StandardDeviation, and get rid of () for std and mean
features <- gsub("mean\\(\\)", "Mean", features)
features <- gsub("std\\(\\)", "StandardDeviation", features)

# Add - to Body and Gravity labels for readability
features <- gsub("(Body|Gravity)", "\\1-", features)

# Remove duplicate - which gets added to some variables in above substitution.
# Also there are a few variables which are labeled fBodyBody* when they should 
# be fBody*, so we will remove duplicate Body.
features <- gsub("--", "-", features)
features <- gsub("Body-Body", "Body", features)

# Rename tidyData with updated feature names
names(tidyData) <- features

# Now let's update the activity variable to a factor variable with descriptive 
# level names
tidyData <- mutate(tidyData, Activity = factor(Activity, labels = c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying")) )

# Finally, we need to calculate the averages for each subject for each activity.
# Let's start by subsetting data by subject

subjectAverages <- data.frame()

for (subjects in 1:30) {
  x <- getSubjectAverages(tidyData, subjects)
  subjectAverages <- rbind(subjectAverages, x)
}

# get rid of our intermediate variable x
rm(x)

save(tidyData, file = "tidyData.Rda")
save(subjectAverages, file = "subjectAverage.Rda")

# ------------------------------------------------------------------------------
# Updtaed code. The project instructions also did not specify what format the
# data needed to be in, but the submission instructions did. So I have updated
# the code to save the data in the format requested by the submission
# instructions.
# ------------------------------------------------------------------------------

write.table(subjectAverages, file = "subjectAverages.txt", row.name=FALSE)