## Course 3: Project on Getting and Cleaning data ##

# In this project, we had performed the following step to make data tidy #

Step1: Download and unzip the data files in the working directory and the again         setting "UCI HAR Dataset" as the working directory.

Step2: Reading the following data files
        1. activity_labels.txt in activity
        1. features.txt in features
        1. X_train.txt in xtrain
        1. y_train.txt in ytrain
        1. X_test.txt in xtest
        1. y_test.txt in ytest
        1. subject_train in strain
        1. subject_test in stest
        
Step3: Assigning the column names for the data sets xtrain and xtest from               features.
        
Step4: Extracting the required data i.e. those variables from xtrain and xtest          data sets which contains mean and std.

Step4: Merging the xtrain and xtest data with strain and stest respectively,            along with the activity labels in the files train and test,                      respectively.  

Step5: Row bind train and test, and saving it in data set with file name data.

Step6. Grouping data according to each subject and activity and calculating mean

Step7: Exporting file as "tidy.txt"
        

