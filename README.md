#Tidied Dataset from accelerometers from Samsung smartphone
This project is a new collection of merged data (test and training) with common identifiers and activity labels to provide one clean single dataset. The data transformation provided human-readable names for activity identifiers and only the mean and standard deviation variables were kept. Additional mean summarization was included for each subject/activity pair. 

The data is in "wide" format as described by Wickham; there is a single row for each subject/activity pair, and a single column for each measurement.

The final data set can be found in the tidydata.txt file, which can be read into R.  

i.e. read.table("tidydata.txt", header = TRUE) 

A detailed description of the variables can be found in **CodeBook.md**. 

To reproduce the tidydata.txt use the script **run_analysis.R**

####Script performs the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

####Required R Packages

The R package data.table is required to run this script.


####More information on original data:  
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

####Citation:  
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
