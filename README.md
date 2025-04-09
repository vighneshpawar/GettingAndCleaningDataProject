# Getting and Cleaning Data - Course Project


## Overview
This project is part of the Coursera course **Getting and Cleaning Data**. The objective is to demonstrate the ability to collect, clean, and prepare data for analysis. The dataset used in this project is derived from experiments carried out using smartphones to capture human activity data.

## Dataset Source
- [UCI Human Activity Recognition Using Smartphones Dataset](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## What the Script Does

The R script `run_analysis.R` performs the following tasks:

1. **Merges** the training and test datasets to form one unified dataset.
2. **Extracts** measurements of the **mean** and **standard deviation**.
3. **Replaces activity IDs** with descriptive activity names.
4. **Renames** variables to more descriptive and readable labels.
5. **Creates a tidy dataset**, summarizing the average of each variable for each activity and each subject.

## Files in the Repository

| File Name | Description |
|-----------|-------------|
| `run_analysis.R` | The R script used to process and clean the dataset |
| `tidy.txt` | The output tidy dataset |
| `CodeBook.md` | Describes the variables and transformations applied |
| `README.md` | Provides context and instructions for the project |

## Running the Script

### Requirements:
- Base R (no additional packages required)

### Steps:
1. Download and unzip the UCI HAR Dataset into your working directory.
2. Ensure the folder is named exactly `"UCI HAR Dataset"` and is in your working directory.
3. Open and run `run_analysis.R`. This script will:
   - Read in and merge the training and test datasets
   - Extract relevant features (mean and standard deviation)
   - Apply descriptive labels
   - Output a final tidy dataset

### Output:
- `tidy.txt`: A file containing the average of each variable for each activity and each subject.

## Tidy Data Principles Followed
- Each variable is in one column
- Each observation is in one row
- Each type of observational unit forms a table

## License and Citation
Please refer to the original [UCI HAR Dataset page](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for licensing and citation details.

## Note
This project and all related work are submitted solely by the student as a demonstration of their own understanding and work.
