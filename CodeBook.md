

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset.

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [Web Link]

An updated version of this dataset can be found at [Web Link]. It includes labels of postural transitions between activities and also the full raw inertial signals instead of the ones pre-processed into windows.

Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 


Creating a Tidy Data set :

From the initial data set, the goal is to create a tidy data set where the variabes are averaged for each subject and activity.


Merge training and test sets

For each test and training data (X_train.txt, X_test.txt) variables are labelled based on features.txt. Each test and training data set are merged with their subject and activity ids respectively. A combined data is obtained from these merged data ( containing both test and training data sets along with their subject and activity ids) 


Extract mean and standard deviation variables

From the merged data an intermediate data set with only the values of estimated mean (variables with labels that contain "mean") and standard deviation (variables with labels that contain "std") is obtained using the grep function. 


Use descriptive activity names

A new column is added to intermediate data set with the activity description. Activity id column is used to look up descriptions in activity_labels.txt. 

Label variables appropriately

Labels given from the original collectors were changed: to obtain valid R names without parentheses, dashes and commas to obtain more descriptive labels ( using make function). Based on the README.txt available descriptions are added to the corresponding variable names.

Create a tidy data set

From the intermediate data set is created a final tidy data set where numeric variables are averaged for each activity and each subject. The data is written to a file and saved in the same directory as that of the running script. 



