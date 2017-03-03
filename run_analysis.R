rm(list=ls())
setwd("~/Desktop/programming/GettingData/UCI HAR Dataset")

# load descriptors
activity_labels <- read.table("activity_labels.txt", sep = "", header=FALSE)
features <- read.table("features.txt", sep = "", header=FALSE)

# load data from test folder
subject_test <- read.table("test/subject_test.txt", sep = "", header=FALSE)
X_test <- read.table("test/X_test.txt", sep = "", header=FALSE)
y_test <- read.table("test/y_test.txt", sep = "", header=FALSE)

# load data from train folder
subject_train <- read.table("train/subject_train.txt", sep = "", header=FALSE) 
X_train <- read.table("train/X_train.txt", sep = "", header=FALSE)
y_train <- read.table("train/y_train.txt", sep = "", header=FALSE)

# combine training and test data sets
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

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

# bind all data together and label it to make a tidy dataset
composite <- cbind(subject, activities, X)
names(composite) <- c("subject", "activity", as.character(features$V2))

# create a more compact dataset that includes only mean() and sd() measurements
filtered <- cbind(composite["subject"], composite["activity"],
            composite[(grepl("[Mm]ean\\(\\)", names(composite)) | grepl("std\\(\\)", names(composite)))])

# create a summarized dataset by averaging over subject and activity
melted <- melt(filtered, id = c("subject", "activity"), measure.vars=names(filtered[3:length(names(filtered))]))
datasummary <- dcast(melted, subject + activity ~ variable, mean)

# print the summarized dataset to a file
write.table(datasummary, "../summarized_accel_data.txt", row.names = FALSE)
