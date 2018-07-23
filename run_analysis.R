# Project of getting and cleaning data.

# Download and unziping data
zurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zurl,destfile = "c3projectsks")
unzip("c3projectsks")
setwd("./UCI HAR Dataset")


# loading activity labels and features.
activity<-read.delim("activity_labels.txt", sep="",header=FALSE)
activity$V1<-as.factor(activity$V1)
activity$V2<-as.character(activity$V2)
features<-read.delim("features.txt", sep="",header = FALSE)
features$V2<-as.character(features$V2)

# Loading and extracting training datasets.
xtrain<-read.delim("./train/X_train.txt", sep="",header=FALSE)
names(xtrain)<-features$V2
ytrain<-read.delim("./train/y_train.txt", sep="",header=FALSE)
ytrain$V1<-as.character(ytrain$V1)
ytrain$V1<-factor(ytrain$V1,levels = activity$V1, labels = activity$V2)
strain<-read.delim("./train/subject_train.txt", sep="",header=FALSE)
xtrain1<-grep(".*mean.*|.*std.*",names(xtrain))
xtrain<-xtrain[,xtrain1]
train<-cbind(strain,ytrain,xtrain)
colnames(train)[c(1,2)]<-c("subjects","activity")

# Loading and extracting test datasets
xtest<-read.delim("./test/X_test.txt", sep="",header=FALSE)
names(xtest)<-features$V2
ytest<-read.delim("./test/y_test.txt", sep="",header=FALSE)
ytest$V1<-as.character(ytest$V1)
ytest$V1<-factor(ytest$V1,levels = activity$V1, labels = activity$V2)
stest<-read.delim("./test/subject_test.txt", sep="",header=FALSE)
xtest1<-grep(".*mean.*|.*std.*",names(xtest))
xtest<-xtest[,xtest1]
test<-cbind(stest,ytest,xtest)
colnames(test)[c(1,2)]<-c("subjects","activity")

# Merging and arranging training and test datasets

data<-rbind(train,test)
library(dplyr)
data<-arrange(data,subjects)

# Grouping data for finging Mean

library(reshape2)
groups<- melt(data, id = c("subjects", "activity"))
groupmean<-dcast(groups, subjects+activity~variable, mean)

# Exporting data as .txt file

write.table(groupmean, file="tidy.txt",row.names = FALSE, quote = FALSE)


