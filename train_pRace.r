library("partykit")
library("rpart")

pr <- read.delim("~/JRA/data/pr.tsv", header=F)
tr <- read.delim("~/JRA/data/tr.tsv", header=F)

names(pr)<-c("k_bango","bamei","p0_pos","p0_waku","p0_umaban","p0_weight","p0_deltW",
             "p1_course","p1_grade","p1_dist","p1_track","p1_pos","p1_weight","p1_deltW","p1_time","p1_tDiff","p1_3f",
             "p2_course","p2_grade","p2_dist","p2_track","p2_pos","p2_weight","p2_deltW","p2_time","p2_tDiff","p2_3f",
             "p3_course","p3_grade","p3_dist","p3_track","p3_pos","p3_weight","p3_deltW","p3_time","p3_tDiff","p3_3f",
             "tD_bestTime","tD_Time_dev","tD_Time_ave","tD_best3f","tD_3f_dev","tD_3f_ave","tD_rentai",
             "tm1f_bestTime","tm1f_Time_dev","tm1f_Time_ave","tm1f_best3f","tm1f_3f_dev","tm1f_3f_ave","tm1f_rentai",
             "tp1f_bestTime","tp1f_Time_dev","tp1f_Time_ave","tp1f_best3f","tp1f_3f_dev","tp1f_3f_ave","tp1f_rentai",
             "konkan_rentai","konkan_avg_Pos","hikonkan_raitai","hikonkan_avg_Pos")

names(tr)<-c("k_bango","bamei","p0_pos","p0_waku","p0_umaban","p0_weight","p0_deltW",
             "p1_course","p1_grade","p1_dist","p1_track","p1_pos","p1_weight","p1_deltW","p1_time","p1_tDiff","p1_3f",
             "p2_course","p2_grade","p2_dist","p2_track","p2_pos","p2_weight","p2_deltW","p2_time","p2_tDiff","p2_3f",
             "p3_course","p3_grade","p3_dist","p3_track","p3_pos","p3_weight","p3_deltW","p3_time","p3_tDiff","p3_3f",
             "tD_bestTime","tD_Time_dev","tD_Time_ave","tD_best3f","tD_3f_dev","tD_3f_ave","tD_rentai",
             "tm1f_bestTime","tm1f_Time_dev","tm1f_Time_ave","tm1f_best3f","tm1f_3f_dev","tm1f_3f_ave","tm1f_rentai",
             "tp1f_bestTime","tp1f_Time_dev","tp1f_Time_ave","tp1f_best3f","tp1f_3f_dev","tp1f_3f_ave","tp1f_rentai",
             "konkan_rentai","konkan_avg_Pos","hikonkan_raitai","hikonkan_avg_Pos")


pr$p1_3f[pr$p1_3f == 0.0]<-50
pr$p2_3f[pr$p2_3f == 0.0]<-50
pr$p3_3f[pr$p3_3f == 0.0]<-50
tr$p1_3f[tr$p1_3f == 0.0]<-50
tr$p2_3f[tr$p2_3f == 0.0]<-50
tr$p3_3f[tr$p3_3f == 0.0]<-50

pr$p1_grade<-ordered(pr$p1_grade, levels = c("A","B","C","D","E","F","G","H"," "))
pr$p2_grade<-ordered(pr$p2_grade, levels = c("A","B","C","D","E","F","G","H"," "))
pr$p3_grade<-ordered(pr$p3_grade, levels = c("A","B","C","D","E","F","G","H"," "))
tr$p1_grade<-ordered(tr$p1_grade, levels = c("A","B","C","D","E","F","G","H"," "))
tr$p2_grade<-ordered(tr$p2_grade, levels = c("A","B","C","D","E","F","G","H"," "))
tr$p3_grade<-ordered(tr$p3_grade, levels = c("A","B","C","D","E","F","G","H"," "))

#nona_pr<-na.omit(pr)

#debug(rpart)
model<-rpart(p0_pos~., pr[,-c(1,2,8,11,18,21,28,31)])
plot(as.party(model))

pred<-predict(model, tr[,-c(1,2,8,11,18,21,28,31)])

#tuneRF(pr[,colnames(pr) !="p0_pos"],pr[,"p0_pos"], doBest=T, na.action="na.omit")
#model<-randomForest(p0_pos~., data=pr, na.action="na.omit")
#importance(model)
#print(model)
