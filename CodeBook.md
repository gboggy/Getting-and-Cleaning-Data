##Dataset produced by run_analysis.R

The run_analysis.R script performs a series of operations on the "Human Activity Recognition Using Smartphones Data Set" (heretofore referred to as the original data set) to produce a tidy data set that contains data averaged over subjects and activities.  The data in the original data set were collected from 30 subjects performing each of six activities multiple times.  The data of interest are the mean and standard deviation values reported in the original data set, and which were obtained on the features described in the next section.  The labels for the mean and standard deviation in the final data set contain -mean() and -std() appended to the relevant feature (but before the -XYZ modifier) described in the next section.

The data in the original data set have been normalized and are bounded within [-1, 1].  The data are thus unitless.  Averaging the mean and standard deviation values over subjects and activities also results in unitless values.

##Description of the features

####(Note that this description is excerpted from the features_info.txt file of the "Human Activity Recognition Using Smartphones Data Set".) 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 
(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

