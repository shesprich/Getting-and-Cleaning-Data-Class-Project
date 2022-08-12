loadData <- function(data_path) {
  # Since the train and test data need basically the same processing a single 
  # function can apply to both sets.
  
  #-----------------------------------------------------------------------------
  # Updated code. The project instructions did not specify that the script
  # needed to load data from the current working directory, but the submission
  # instructions do. I commented out then updated this section of the code
  # to comply with the updated instructions.
  #-----------------------------------------------------------------------------
  ## The test files are [Xy]_test.txt and train files are [Xy]_train.txt so we
  ## first need to determine the filename for the path we were give.
  #files <- list.files(data_path)
  
  ## The x file will meet the pattern "X_[az]+" and grepl will return a Boolean
  ## vector of files that meet that pattern, so if we subset the list of files
  ## by the above regex we will get the X_file name
  #x_file <- files[grepl("X_[a-z]+", files)]
  #x_file <- paste(data_path, x_file, sep = "/")
  #
  ## Same goes for y
  #y_file <- files[grepl("y_[a-z]+",files)]
  #y_file <- paste(data_path, y_file, sep = "/")
  #
  ## We need subject IDs for the data as well
  #subject_file <- files[grepl("subject_[a-z]+",files)]
  #subject_file <- paste(data_path, subject_file, sep = "/")
  
  files <- list.files()
  
  x_pattern <- paste("X_", data_path, sep = "")
  x_file <- files[grepl(x_pattern, files)]
  
  y_pattern <- paste("y_", data_path, sep = "")
  y_file <- files[grepl(y_pattern, files)]
  
  subject_pattern <- paste("subject_", data_path, sep = "")
  subject_file <- files[grepl(subject_pattern, files)]
  
  # Read in data
  x <- read.table(x_file, header = FALSE)
  y <- read.table(y_file, header = FALSE)
  z <- read.table(subject_file, header = FALSE)
  
  #-----------------------------------------------------------------------------
  # Updated code. The project instructions did not specify that the script
  # needed to load data from the current working directory, but the submission
  # instructions do. I commented out then updated this section of the code
  # to comply with the updated instructions.
  #-----------------------------------------------------------------------------
  # Load in features so we can rename x
  #features <- read.table("UCI_HAR_Dataset/features.txt")
  features <- read.table("features.txt")
  features <- features[,2]
  names(x) <- features
  
  # Rename y and z manually
  names(y) <- "Activity"
  names(z) <- "SubjectID"
  
  # Subset using grepl to retain only mean and std variables
  x <- x[,grepl("mean\\(\\)|std\\(\\)",features)]
  
  # cbind x, y and z data to return a single data set
  xy <- cbind(x, y)
  xyz <- cbind(xy, z)
}