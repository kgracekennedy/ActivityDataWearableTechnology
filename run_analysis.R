#features are the variable names for test and train
features=read.table("UCIHAR_Dataset/features.txt")
f=features[,2]

#TrueFalse Vector finding all labels with mean 
#and SD (why do they use std?)
extract=grep("mean|std",f)
#length(extract)#=79


#30 possible test sujects
#subject associated with each datapoint
subjecttest=read.table("UCIHAR_Dataset/test/subject_test.txt")
colnames(subjecttest)="id"
#activity
activitytest=read.table("UCIHAR_Dataset/test/Y_test.txt")
colnames(activitytest)="Activity_Labels"
#each motion data vector taken
testdata=read.table("UCIHAR_Dataset/test/X_test.txt")
colnames(testdata)=f
test=testdata[,extract]
#dim(test)#=79

#30 possible training subjects
#subject associated with each datapoint
subjecttrain=read.table("UCIHAR_Dataset/train/subject_train.txt")
colnames(subjecttrain)="id"
#activity
activitytrain=read.table("UCIHAR_Dataset/train/Y_train.txt")
colnames(activitytrain)="Activity_Labels"
#each motion data vector taken
traindata=read.table("UCIHAR_Dataset/train/X_train.txt")
colnames(traindata)=f
train=traindata[,extract]
#dim(train)#=79

#Merge data
data1=subjecttest
#dim(test) #=2947x561, used to figure out howm any variables
data1[,2]=activitytest
data1[,3:81]=test
data2=subjecttrain
#dim(train) #=7352x561, used to figure out howm any variables
data2[,2]=activitytrain
data2[,3:81]=train
#When we merge, we don't want NA's all willy nilly
#The test and train data are from distinct subjects
#so essentially we want them concatonated
library(plyr)
data=arrange(merge(data1,data2,all=T),id)
#dim(data)#=81
#data[1:3,1:2]#Still need to replace activity labels

aggregatedata=aggregate(data,by=list(Activity=data$Activity_Labels),mean)
#dim(aggregatedata)#=6x82
#aggregatedata[1:3,1:3]
Activity=aggregatedata[,1]
finaldata=as.data.frame(Activity)
#head(finaldata)
#dim(finaldata)#=6x1
finaldata[,2:80]=aggregatedata[,4:82]
#dim(finaldata)

#Activity Labels key
actlab=read.table("UCIHAR_Dataset/activity_labels.txt")
al=as.character(actlab[,2])


for (i in 1:6) {
    finaldata$Activity[finaldata$Activity==i]=al[i]
}

#finaldata[1:3,1:2]
#finaldata$Activity
#finaldata$id#shouldn't and isnt here
#dim(finaldata)

write.table(finaldata,file="CleanActivity.txt",row.name=F)
