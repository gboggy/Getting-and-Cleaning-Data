# Getting-and-Cleaning-Data-Final-Project
Repo for the final project of the Coursera Getting and Cleaning Data course

## Overview
The R script, run_analysis.R, reads in data from the UC Irvine "Human Activity Recognition Using Smartphones Data Set", assembles the data into a single tidy data set, and performs a series of operations on this data set to produce a condensed tidy summary data set.

To be considered a tidy data set, a data set must have one type of measurement per column and each row must contain observations from a unique sample.  Each column of tidy data must have a descriptive header.  Additionally, factor labels used to classify data must be descriptive for the data to be considered tidy.

The run_analysis.R script performs a series of operations on data from files in the "Human Activity Recognition Using Smartphones Data Set" in order to produce a data set that conforms to the tidy data set principles described above.

## Details
### Combining Data
The "Human Activity Recognition Using Smartphones Data Set" contains data obtained from 30 subjects and the data are split between a training set and a test set.  The run_analysis.R script combines the data sets using the rbind command as shown below.

    # combine training and test data sets
    X <- rbind(X_train, X_test)
    y <- rbind(y_train, y_test)
    subject <- rbind(subject_train, subject_test)

The X variable contains the observational data.  X_train and X_test are read from the X_train.txt and X_test.txt files, respectively.  The y variable is a numerical column vector that describes the activity performed while the data was collected (y_train and y_test are read from y_train.txt and y_test.txt, respectively).  The subject variable is a column vector that indicates which subject the data was collected on (subject_train and subject_test are read from subject_train.txt and subject_test.txt, respectively).  The subject and y variables, together identify the unique "sample" that data are obtained on.

### Converting y labels to descriptive labels
In order to create a tidy data set, the y labels (which are integer valued) must be converted to descriptive labels.  The information for performing this conversion between y value and a descriptive "activity" label is contained in the activity_labels.txt file.  The code below performs this conversion and yields a new column vector, "activities".

    # replace y numerical values with tidy activity labels
    activities <- data.frame()
    for (i in 1:length(y[[1]])){
      switch(y[i,1],
        "1" = val <- "WALKING",
        "2" = val <- "WALKING_UPSTAIRS",
        "3" = val <- "WALKING_DOWNSTAIRS",
        "4" = val <- "SITTING",
        "5" = val <- "STANDING",
        "6" = val <- "LAYING")
      activities[i,1] <- val
    }

### Creating a tidy data set
For the final step in creating a tidy data set, the data are combined with labels for the data as shown below.

    # bind all data together and label it to make a tidy dataset
    composite <- cbind(subject, activities, X)
    names(composite) <- c("subject", "activity", as.character(features$V2))

The "composite" data set is created by binding the subject, activities, and X variables using cbind.  The labels for the column variables are obtained from the second column in the data set from the features.txt file.

###Producing a more compact summary data set
After the tidy data set is created, the data set can be analyzed.  Because we are interested in the data that reports mean and standard deviation values, the data set is filtered to report only this data, as shown below.

    # create a more compact dataset that includes only mean() and sd() measurements
    filtered <- cbind(composite["subject"], composite["activity"],
        composite[(grepl("[Mm]ean\\(\\)", names(composite)) | grepl("std\\(\\)", names(composite)))])

Finally, because we are interested in a summary that contains the average over subjects and activities, we can "melt" and "recast" the data to produce a data set that provides this summary.

    # create a summarized dataset by averaging over subject and activity
    melted <- melt(filtered, id = c("subject", "activity"), measure.vars=names(filtered[3:length(names(filtered))]))
    datasummary <- dcast(melted, subject + activity ~ variable, mean)

The variable "datasummary" is the summarized tidy data set of interest.
