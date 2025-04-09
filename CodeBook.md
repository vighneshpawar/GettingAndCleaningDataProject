# CodeBook

## Overview
This codebook describes the variables, transformations, and data cleaning steps used in the `run_analysis.R` script for the Getting and Cleaning Data Course Project.

The script processes the UCI Human Activity Recognition (HAR) dataset collected from the accelerometers and gyroscopes of Samsung Galaxy S smartphones, worn by participants performing various activities.

## Source Dataset
- URL: https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
- Raw data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- License and citation information available at the above link.

## Data Processing Steps

The script `run_analysis.R` performs the following steps:

1. **Merge the training and test sets** to create one data set.
2. **Extract only measurements on the mean and standard deviation** for each measurement.
3. **Use descriptive activity names** to name the activities in the dataset.
4. **Label the data set with descriptive variable names** using consistent, readable naming conventions.
5. **Create a second, independent tidy data set** with the average of each variable for each activity and each subject.

## Data Structure

### Raw Data Used
- `X_train.txt`, `X_test.txt`: Feature measurements
- `y_train.txt`, `y_test.txt`: Activity labels
- `subject_train.txt`, `subject_test.txt`: Subject IDs
- `features.txt`: Names of measurement variables
- `activity_labels.txt`: Mapping between activity IDs and descriptive names

### Final Dataset: `tidy.txt`

Each row in `tidy.txt` is a unique pair of subject and activity, and each column contains the **average** of a particular measurement across all observations for that subject and activity.

### Variables
- **Subject**: Identifier for each participant (integer: 1 to 30)
- **Activity**: Descriptive activity name (e.g., WALKING, STANDING)
- **Other columns**: Average of each selected measurement (mean or standard deviation)

### Measurement Variable Naming Conventions
Original variable names were cleaned and transformed using the following mappings:

| Original | Modified |
|----------|----------|
| Acc | Accelerometer |
| Gyro | Gyroscope |
| Mag | Magnitude |
| BodyBody | Body |
| ^t | Time |
| ^f | Frequency |
| mean() | Mean |
| std() | STD |
| freq() | Frequency |
| angle | Angle |
| gravity | Gravity |

CamelCase was used for readability.

### Units
All variables are normalized and unitless (as per original dataset preprocessing). However, they represent sensor signals, commonly measured in:
- Accelerometer: g (gravity units)
- Gyroscope: radians/sec

## Summary
The final dataset is tidy:
- Each variable is in one column.
- Each observation is in one row.
- Each type of observational unit (subject-activity) forms a table.
