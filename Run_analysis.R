#### program Run_analysis.R ####	

require(plyr)

### * Merges the training and the test sets to create one data set.
### * Extracts only the measurements on the mean and standard deviation for each measurement.
### * Uses descriptive activity names to name the activities in the data set.
### * Appropriately labels the data set with descriptive variable names.
### * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



#### Directories and File names
print("Before proceeding please make sure the Run_analysis.R script and the Samsung data folder are together in a same folder")
main_directory <- readline(prompt="Enter the name of the folder containg the data to be processed: ")
main_directory=as.character(main_directory)
feature_file <- paste(main_directory, "/features.txt", sep = "")
activity_labels_file <- paste(main_directory, "/activity_labels.txt", sep = "")
x_train_file <- paste(main_directory, "/train/X_train.txt", sep = "")
y_train_file <- paste(main_directory, "/train/y_train.txt", sep = "")
subject_train_file <- paste(main_directory, "/train/subject_train.txt", sep = "")
x_test_file  <- paste(main_directory, "/test/X_test.txt", sep = "")
y_test_file  <- paste(main_directory, "/test/y_test.txt", sep = "")
subject_test_file <- paste(main_directory, "/test/subject_test.txt", sep = "")

###   reading the data as table

print (" Reading the files...... ")
x_train <- read.table(x_train_file)
y_train <- read.table(y_train_file)
subject_train <- read.table(subject_train_file) 
subject_test <- read.table(subject_test_file)
y_test <- read.table(y_test_file )
x_test <- read.table(x_test_file)
features <- read.table(feature_file)
activity_labels <- read.table(activity_labels_file)



###   assigning column names 

colnames(x_train)<-features[,2]
colnames(x_test)<-features[,2]
colnames(y_train)<-"activity_ID"
colnames(y_test)<-"activity_ID"
colnames(subject_test)<-"subject_ID"
colnames(subject_train)<-"subject_ID"
colnames(activity_labels)<-c("activity_ID","activity_type")


###   merging subject and activity data for each training and test seperately 

merged_train <-cbind(y_train,subject_train,x_train) # activity_ID,subject_ID,x_train_labels
merged_test <-cbind(y_test,subject_test,x_test) # activity_ID,subject_ID,x_test_labels



###  merging training and test data sets to create one data set


combined_data <- rbind(merged_train,merged_test)




###  Extracts only the measurements on the mean and standard deviation for each measurement.


column_names_to_search <-colnames(combined_data)  

### use the column names of the combined data to look for names with "mean " or "std" patterns.. 


mean_std_index <- (grepl("mean..",column_names_to_search)|grepl("std...",column_names_to_search)|grepl("activity_ID",column_names_to_search)|grepl("subject_ID",column_names_to_search))
mean_std_data <-combined_data[,mean_std_index==TRUE]


####  Appropriately labels the data set with descriptive variable names.
print (" Processing Data...... ")

data_with_activity_description <- merge(mean_std_data, activity_labels,by="activity_ID",all.x=TRUE)  

#### merge the appropriate activity_labels for each activity_id for all values by merging tables activity_labels and intermediate data table. No a new column is added called activity_labels at the end. 

names(data_with_activity_description) <- make.names(names(data_with_activity_description))   #### make syntatically valid names , removing anything that starts for example with a ".", Precautionary step, could be avoided. 

### Make clearer names
### took reference for the names from "README.txt" avilable with the data set. 

names(data_with_activity_description) <- gsub('Acc',"Acceleration",names(data_with_activity_description))
names(data_with_activity_description) <- gsub('GyroJerk',"AngularAcceleration",names(data_with_activity_description))
names(data_with_activity_description) <- gsub('Gyro',"AngularSpeed",names(data_with_activity_description))
names(data_with_activity_description) <- gsub('Mag',"Magnitude",names(data_with_activity_description))
names(data_with_activity_description) <- gsub('^t',"Time.",names(data_with_activity_description))
names(data_with_activity_description) <- gsub('^f',"Fourier.",names(data_with_activity_description))
names(data_with_activity_description) <- gsub('\\.mean',".Mean",names(data_with_activity_description))
names(data_with_activity_description) <- gsub('\\.std',".StandardDeviation",names(data_with_activity_description))
names(data_with_activity_description) <- gsub('Freq\\.',"Frequency.",names(data_with_activity_description))
names(data_with_activity_description) <- gsub('Freq$',"Frequency",names(data_with_activity_description))


### * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# summarized_data = ddply(data_with_activity_description, c("subject_ID","activity_ID"), numcolwise(mean)) 
summarized_data<-aggregate(. ~subject_ID + activity_ID, data_with_activity_description, mean)
summarized_data<-summarized_data[order(summarized_data$subject_ID,summarized_data$activity_ID),]
### ddply takes a data frame and returns a data frame summarized based on the function. numcolwise applies a function in the brackets to each column in the data frame

write.table(summarized_data, file = "summarized_data.txt",row.name=FALSE)

print ("Tidy Data File Created.")
