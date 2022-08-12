# Variables

The raw data within the UCI_HAR_Dataset directory contains accelerometer and gyoscopic data obtained from a Samsung Galaxy S Smartphone, from 30 subjects doing multiple trials of 6 activities. The six activities are walking, walking upstairs, walking downstairs, sitting, standing, and laying. The gyroscopic and accelerometer data were then split into their gravitational and body motion components. Each of these signals has an X, Y, Z, and magnitude competent.Jerk (4th derivative of position) was calculated for each of the body motion components, and finally an FFT (Fast Fourier Transform) was applied to all recorded and computed variables. 

Both tidyData.Rda and subjectAverage.Rda contain the means and standard deviations of all the variables described above. Variables naming conventions are as follows:

domain-type-sensor-statistic-(jerk)-component

In this conventions domain is either TimeDomain or FrequencyDomain, type is either Body or Gravity, sensor is either Accelerometer or StandardDeviation, jerk will be present if the variable represents the calculated jerk, and component is either X, Y, Z, or Magnitude. So for example the variable: TimeDomain-Gravity-Accelerometer-Mean-X would be the mean of the gravitational component of the time domain signal recorded in the x direction by the accelerometer, whereas the variable: FrequencyDomain-Body-Gyroscope-Jerk-StandardDeviation-Magnitude is the standard deviation of the FFT of magnitude of the calculated Jerk of the motion body recorded by the gyroscope.

There are two additional variable Activity and SubjectID which denote the activity and subject ID respectively.

# Data

tidyData.Rda is a tidy data set which contains the merged training and test sets of the UCI_HAR_Dataset. This data set also removes all data which is not a mean or standard deviation. Variable names have been updated to follow the above conventions so as to be more descriptive

subjectAverage.Rda is a tidy data set which contains the subject wise and activity wise averages of tideData.Rda.

# Transformations

The R script run_analysis.R will transform the raw data in the UCI_HAR_Dataset directory into the R data frame objects tidyData.Rda and subjectAverage.Rda. It does this by first using the function loadData (sourced from load_data.R) to read the data from UCI_HAR_Dataset/test/X_test.txt into a data frame. lodaData then pulls variable names from UCI_HAR_Dataset/freatures.txt and uses those to rename the columns of the data frame. Next it subsets the data frame using grepl to retain only variables which contain the strings means() or std(). Finally it cbinds that data frame with the activities from UCI_HAR_Dataset/test/X_test.txt and subject IDs from UCI_HAR_Dataset/test/subject_test.txt. run_analysis then call loadData again the train directory and then merges the two resulting datasets into a single data frame. Next it uses a series of gsub calls to rename the variables to follow the naming convention described above. It then converts the Activity column to a factor variable with more descriptive factor names instead of numbers representing factors. The resulting data frame is saved to tidyData.Rda.

Next it uses the tidyData data frame to create the subjectAverage data frame. It does this by using the getSubjectAverages function sourced from get_subject_averages.R. getSubjectAverages takes a dataset and a subject ID as arguments. The function used filter to select only data from a single subject from tidyData. It then groups the data by Activity, and summarizes the data by mean. The resulting data frame is passed back to run_analysis.R. This analysis is performed 30 times in a for loop, once for each subject, with each data frame appended to the subjectAverage data frame the rbind function. The resulting data frame is saved as subjectAverage.Rda.


