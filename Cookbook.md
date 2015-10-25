

###Overview
The goal is to prepare tidy data that can be used for later analysis.
###Input Data
The script assumes the UCI dataset (directory structure) is extracted directly into working directory.

###Transformations
######The script, **run_analysis.R**, does the following,
1. Load the  files which make-up the UCI dataset
2. Merges the three test and three train files into a single data table, setting textual columns heading where possible
3. Creates a smaller second dataset, containing only mean and std variables
4. Computes the means of this secondary dataset, group by subject/activity.
5. Saves this last dataset to ./tidyData.txt

###Output DataThe column data naming convention is:

	subject - The id of the experimental participant.
	
	Activity_Label - The name of the activity measurement.
		1 WALKING
		2 WALKING_UPSTAIRS
		3 WALKING_DOWNSTAIRS
		4 SITTING
		5 STANDING
		6 LAYING
	
	Follow is the decoding of each of the experimental measurements.	
			{t|f}{measurement}{mean|std}()[-{X|Y|Z}]
  
	Where:
		{t|f} 
			t=time 
			f=frequency

	{measurement}
			BodyAcc
			GravityAcc
			BodyAccJerk
			BodyGyro
			BodyGyroJerk
			BodyAccMag
			BodyAccJerkMag
			BodyGyroMag
			BodyGyroJerkMag
			
	{mean|std}
			mean
			standard deviation
			
	[-{X|Y|Z}]
			optional directional suffix
			X direction
			Y direction
			Z direction

###More Information
More information on the bases data or experiments can be found in the readme.txt file included in the experiment.zip file or at
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>


