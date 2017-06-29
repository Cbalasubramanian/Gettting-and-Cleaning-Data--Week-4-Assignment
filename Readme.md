
Project Goal : 

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.

Code Execution Steps :

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Getting and Running the Script : 

    1. Clone to the GitHub Repository submitted. 
    2. The Repository contains the following file,
          1. Run_analysis.R - main code
          2. CodeBook.md    - contains detailed information about the data and the variables in that along with a brief description as to how this code works to produce a tidy data from the data given.
          3. Readme.md      - Discusses the goal abd steps of the project as well as gives a short information on the contents of this repository.
    3. Steps to run the script.
          1. Place the Run_analysis.R script and the folder containing the data in the same folder.
          2. In R commandline set the working directory as the folder containing the script and the data folder.
          3. Type source(Run_analysis.R) in teh R console. The program asks the user to enter the name of the folder containing the data (Ex.UCI HAR Dataset). Type that in the console.
          4. If the Directories are correct, the program should run without any errors and it creates and saves a file named "summarized_data.txt" with the tidy data in the same working folder.
                
