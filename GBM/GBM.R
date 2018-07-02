path="F:/course/Logistic regression"
setwd(path)
t=read.csv("credit_training.csv")
colnames(t)
t$X=NULL
t$MonthlyIncome=ifelse(is.na(t$MonthlyIncome),mean(t$MonthlyIncome,na.rm=TRUE),t$MonthlyIncome)
t$NumberOfDependents=ifelse(is.na(t$NumberOfDependents),mean(t$NumberOfDependents,na.rm=TRUE),t$NumberOfDependents)
train=t[1:100000,]
test=t[100001:150000,]
library(gbm)
gb=gbm(SeriousDlqin2yrs~.,data=train,n.trees=10,interaction.depth=5,shrinkage=0.05)
pred=predict(gb,test,n.trees=10,type="response")

auc <- function(outcome, proba){
  N = length(proba)
  N_pos = sum(outcome)
  df = data.frame(out = outcome, prob = proba)
  df = df[order(-df$prob),]
  df$above = (1:N) - cumsum(df$out)
  return( 1- sum( df$above * df$out ) / (N_pos * (N-N_pos) ) )
}

auc(test$SeriousDlqin2yrs,pred)
