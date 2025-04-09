# Load training data
s.train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
y.train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
x.train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

# Load test data
s.test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
y.test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
x.test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

# Load features and activity labels
temp <- read.table("UCI HAR Dataset/features.txt")
temp2 <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

# Merge datasets
A <- rbind(s.train, s.test)   # Subjects
B <- rbind(y.train, y.test)   # Activities
C <- rbind(x.train, x.test)   # Measurements

# Apply column names
colnames(A) <- "Subject"
colnames(B) <- "Activity"
colnames(C) <- t(temp[2])

# Combine all data
D <- cbind(C, B, A)

# Extract only mean and std measurements
MeanSTD <- grep(".*Mean.*|.*Std.*", names(D), ignore.case = TRUE)
temp3 <- D[, c(MeanSTD, 562, 563)]  # Assuming 562 and 563 are Activity and Subject

# Convert activity numbers to names
temp3$Activity <- as.character(temp3$Activity)
for (i in 1:6){
  temp3$Activity[temp3$Activity == i] <- as.character(temp2[i, 2])
}
temp3$Activity <- as.factor(temp3$Activity)

# Clean variable names
names(temp3) <- gsub("Acc", "Accelerometer", names(temp3))
names(temp3) <- gsub("Gyro", "Gyroscope", names(temp3))
names(temp3) <- gsub("BodyBody", "Body", names(temp3))
names(temp3) <- gsub("Mag", "Magnitude", names(temp3))
names(temp3) <- gsub("^t", "Time", names(temp3))
names(temp3) <- gsub("^f", "Frequency", names(temp3))
names(temp3) <- gsub("tBody", "TimeBody", names(temp3))
names(temp3) <- gsub("-mean\\(\\)", "Mean", names(temp3), ignore.case = TRUE)
names(temp3) <- gsub("-std\\(\\)", "STD", names(temp3), ignore.case = TRUE)
names(temp3) <- gsub("-freq\\(\\)", "Frequency", names(temp3), ignore.case = TRUE)
names(temp3) <- gsub("angle", "Angle", names(temp3))
names(temp3) <- gsub("gravity", "Gravity", names(temp3))

# Aggregate and create final tidy dataset
temp3$Subject <- as.factor(temp3$Subject)
tidy <- aggregate(. ~Subject + Activity, temp3, mean)
tidy <- tidy[order(tidy$Subject, tidy$Activity),]

# Write output
write.table(tidy, "tidy.txt", row.name = FALSE)
