# run_analysis.r

# include libraries to do the analysis

if(!require(data.table)) {
  install.packages("data.table")
}
require("data.table")

# Load: activity labels and features
  activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
  features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Extract only the measurements on the mean and standard deviation for each measurement.
  extractFeaturesLogi <- grepl('(mean|std)[(]', features)

# Load and process training data.
  XTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
  yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
  subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Label and Extract only the measurements #2 and #3 above.
  names(XTrain) <- features
  XTrain <- XTrain[,extractFeaturesLogi]

# Load activity data and label #3 and #4 above.
  yTrain[,2] <- activityLabels[yTrain[,1]]
  names(yTrain) <- c("Activity_ID", "Activity_Label")
  names(subjectTrain) <- "subject"

# Bind a tidy subset for training data
  trainData <- cbind(as.data.table(subjectTrain), yTrain, XTrain)
  
#
# Same preconditioning for test data
#
# Load and process testing data.
  XTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
  yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
  subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  
# Label and Extract only the measurements #2 and #3 above.
  names(XTest) <- features
  XTest <- XTest[,extractFeaturesLogi]
  
# Load activity data and label #3 and #4 above.
  yTest[,2] <- activityLabels[yTest[,1]]
  names(yTest) <- c("Activity_ID", "Activity_Label")
  names(subjectTest) <- "subject"
  
# Bind a tidy subset for test data
  testData <- cbind(as.data.table(subjectTest), yTest, XTest)

# Complete the tidy dataset by binfing the test and training data
  dataSet <- rbind(trainData,testData)

  idLabels   <- c("subject", "Activity_ID", "Activity_Label")
  dataLabels <- setdiff(colnames(dataSet), idLabels)
  meltData   <- melt(dataSet, id = idLabels, measure.vars = dataLabels)
  
  # Apply mean function to dataset using dcast function
  tidyData   = dcast(meltData, subject + Activity_Label ~ variable, mean)
  
  write.table(tidyData, file = "./tidyData.txt",row.names = FALSE)

