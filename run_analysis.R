##1.Merges the training and the test sets to create one data set.
## data is the merged dataset with label whether the data is from training or test set
x.test = read.table("test/X_test.txt")
y.test = read.table("test/y_test.txt")
sub.test = read.table("test/subject_test.txt")

x.train = read.table("train/X_train.txt")
y.train = read.table("train/y_train.txt")
sub.train = read.table("train/subject_train.txt")

x = rbind(x.train,x.test)
y = rbind(y.train,y.test)

isTrain = c(rep(1,7352),rep(0,2947))
data = x
data$y = y
data$isTrain = isTrain

###############################################
##2.Extracts only the measurements on the mean and standard deviation for each measurement. 
## extrac.data store the measurement we want
features = read.table("features.txt")
names(features) <- c("Col","Measure")
extrac.col = grep("mean|std",features$Measure)
extrac.data = data[extrac.col]
extrac.data$y = as.matrix(y)

##3 Uses descriptive activity names to name the activities in the data set
##4 Appropriately labels the data set with descriptive activity names.
cnames = as.character(features$M[extrac.col])
cnames = c(cnames,"y")
names(extrac.data) = cnames

subject.train = read.table("train/subject_train.txt")
subject.test = read.table("test/subject_train.txt")
extrac.data$subject = subject

activity[which(y==1)] = "walking"
activity[which(y==2)] = "walking.upstairs"
activity[which(y==3)] = "walking.downstairs"
activity[which(y==4)] = "sitting"
activity[which(y==5)] = "standing"
activity[which(y==6)] = "laying"
extrac.data$activity <- activity
act.mean = c()

new.set.act = matrix(nrow = 6,ncol = 79)
for (i in 1:79){
  k = tapply(extrac.data[[i]], extrac.data$activity,mean)
  new.set.act[,i] = k
}

new.set.subject = matrix(nrow = 30,ncol = 79)
for (i in 1:79){
  k = tapply(extrac.data[[i]], extrac.data$subject,mean)
  new.set.subject[,i] = k
}

new.set = rbind(new.set.act,new.set.subject)
colnames(new.set) <- (colnames(extrac.data)[1:79])

rownames(new.set) <- c("laying","sitting","standing","walking","walking.downstairs","walking.upstairs",1:30)
write.csv(new.set,"tidy.txt",sep = "\t")