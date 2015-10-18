JRA_record <- read.csv("~/JRA_record.csv", header=F)

record=list()

record[paste(JRA_record$V1,JRA_record$V3,JRA_record$V2,sep="")]<-floor(JRA_record$V4/1000)*60+(JRA_record$V4-floor(JRA_record$V4/1000)*1000)/10
