loadData <- function(data_path) {
  # Since the train and test data need basically the same processing a single 
  # function can apply to both sets.
  
  # The test files are [xy]_test.txt and train files are [xy]_train.txt so we
  # first need to determine the filename for the path we were give.
  files <- list.files(data_path)
  
  # The x file will meet the pattern "X_[az]+" and grepl will return a Boolean
  # vector of files that meet that pattern, so if we subset the list of files
  # by the above regex we will get the X_file name
  x_file <- files[grepl("X_[a-z]+", files)]
  x_file <- paste(data_path, x_file, sep = "/")
  
  # Same goes for y
  y_file <- files[grepl("y_[a-z]+",files)]
  y_file <- paste(data_path, y_file, sep = "/")
  
  # Read in data
  x <- read.table(x_file, header = FALSE)
  y <- read.table(y_file, header = FALSE)
  
  # Load in features so we can rename x
  features <- read.table("UCI_HAR_Dataset/features.txt")
  features <- features[,2]
  names(x) <- features
  
  # Rename y manually
  names(y) <- "Activity"
  
  # Subset using grepl to reatain only mean and std variables
  x <- x[,grepl("mean|std",features)]
  
  # cbind x and y data to return a single data set
  xy <- cbind(x,y)
}