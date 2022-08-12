getSubjectAverages <- function(fullData, subject_id) {
  # Simplify getting averages for each subject by turning it into a function
  # we can call from run_analysis.R
  
  # Just to be on the safe side, ensure dplyr is loaded
  library(dplyr)
  
  x <- fullData %>% 
    # filter out data for subject
    filter(SubjectID == subject_id) %>% 
    # group by activity
    group_by(Activity) %>% 
    # summarize by group across all variables using the mean function
    summarize(across(1:66, mean)) %>% 
    # Re-add SubjectID column as it get excluded in summarize
    mutate(SubjectID = subject_id)

}