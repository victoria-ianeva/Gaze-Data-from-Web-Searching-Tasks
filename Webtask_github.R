webtaskfilename="Web_browse_all.csv" # "Web_search_all.csv"

attentions_original=read.csv(webtaskfilename)
#filter out all the zero time to first view
attentions_original=attentions_original[attentions_original["Time.to.1st.View..sec."]>0,]
attentions_original$User.Name=as.character(attentions_original$User.Name)
#attentions_original$Group=ifelse(grepl("_ASD",attentions_original$User.Name,fixed = TRUE),"ASD","Control")
attentions_original$Group_bin=ifelse(attentions_original$Group=="ASD",0,1)
#attentions_original$Group_bin=ifelse(grepl("_ASD",attentions_original$User.Name,fixed = TRUE),0,1)

#attentions_original$AOI=as.factor(substring(attentions_original$AOI.Name,3))
attentions_original$AOI=as.factor(attentions_original$AOI.Name)
#get the correct areas
attentions_original$Media.ID=as.factor(attentions_original$Media.ID)
#ensuring the unique user names
attentions_original[attentions_original["Group"]=='ASD',]$User.Name=paste(attentions_original[attentions_original["Group"]=='ASD',]$User.Name,"ASD")
attentions_original[attentions_original["Group"]=='Control',]$User.Name=paste(attentions_original[attentions_original["Group"]=='Control',]$User.Name,"Control")

#get users belonging to ASD group
user_asd_original=unique(attentions_original[attentions_original["Group"]=='ASD',]$User.Name)
#get users belonging to Control group
user_control_original=unique(attentions_original[attentions_original["Group"]=='Control',]$User.Name)
user_original=unique(attentions_original$User.Name)

#if selecting the media, use something like attentions=attentions_original[ attentions_original$Media.ID==0| attentions_original$Media.ID==2,]


c_r=0
c_glm=0
control_control=0
control_asd=0
asd_control=0
asd_asd=0
for (i in c(1:100)){
  #shuffle the users
  user_control=sample(user_control_original)
  user_asd=sample(user_asd_original)
  #get 10 users from each group to form the training data
  user_asd_train=user_asd[1:10]
  user_control_train=user_control[1:10]
  #get the rest of the users to form the testing data
  user_asd_test=user_asd[11:length(user_asd_original)]
  user_control_test=user_control[11:length(user_control_original)]
  #get data for training
  attentions_train=attentions[attentions$User.Name %in% user_asd_train | attentions$User.Name %in% user_control_train,]
  #get data for testing
  attentions_test=attentions[attentions$User.Name %in% user_asd_test | attentions$User.Name %in% user_control_test,]
  
  model_glm <- glm(Group_bin ~#AOI+  #ï..Media.ID+#AOI_correct+ #ï..Media.ID+#+AOI_correct+ AOI+
                     Time.to.1st.View..sec.+Revisits....+Fixations....+Time.Viewed..sec.
                   ,family=binomial(),
                   data=attentions_train)
  #type = "nu-svc", C = 10, kernel ="rbfdot")
  #model_glm$xlevels[["AOI"]] <- union(model_glm$xlevels[["model_glm"]], levels(attentions_test$AOI))
  
  #model_glm$xlevels[["AOI"]] <- union(model_glm$xlevels[["model_glm"]], levels(attentions_test$AOI))
  
  
  
  
  #users in test group correctly classified as belonging to the control group 
  s3=sapply(user_control_test,function (x)
      sum(predict(model_glm,attentions_test,type="response")>=0.5 
          & as.character(attentions_test$User.Name)==x)*2 > sum(attentions_test$User.Name==x))
  #users in test group correctly classified as belonging to the asd group
  s4=sapply(user_asd_test,function (x)
      sum(predict(model_glm,attentions_test,type="response")<0.5 & as.character(attentions_test$User.Name)==x)*2> sum(attentions_test$User.Name==x))
  
  #total number of users in the test group correctly classified
  correct[i]=sum(s3)+sum(s4)
  control_control = control_control+ sum(s3)
  asd_asd=asd_asd+sum(s4)
  asd_control=asd_control+5- sum(s3)
  control_asd=control_asd+5-sum(s4)
  c_glm <-c_glm+sum(s3)+sum(s4)
  #c_r=c_r+sum(s1[4,])+sum(s2[4,])
}
#performing the t test on accuracies
t.test(correct/10,mu=0.5)

