Getting and Cleaning Data Course Project

The purpose of this project/assignment is to demonstrate our ability to collect, work with, and clean a data set. The goal is to prepare tidy data set that can be used for later analysis.

Below is the step in order to carry out this project:

1. Download the data from the given assignment in a proper working directory
2. Load/install appropriate libraries to run the analysis (e.g., dplyr, data.table, tidyr)
3. Read the files (as defined in Codebook) and create data tables.
4. Merges the training and the test sets to create one data set.
5. Extracts only the measurements on the mean and standard deviation for each measurement.
6. Uses descriptive activity names to name the activities in the data set.
7. Appropriately labels the data set with descriptive variable names (as defined in Codebook).
8. From the data set in step 7, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Notes:
The tidy data set a set of variables for each activity and each subject. 10299 instances are split into 180 groups (30 subjects and 6 activities) and 66 mean and standard deviation features are averaged for each group. The resulting data table has 180 rows and 69 columns – 33 Mean variables + 33 Standard deviation variables + 1 Subject( 1 of of the 30 test subjects) + ActivityName + ActivityNum . The tidy data set’s first row is the header containing the names for each column.