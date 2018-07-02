path="D:/book/GBM"
setwd(path)
t=read.csv("train_sample.csv")
t=t[,-c(146:151,1:4)]
train=t[1:8000,]
test=t[8001:9999,]

library(rpart)
test$prediction=0
for(i in 1:1000){ # we are running 1000 times - i.e., 1000 decision trees
  y=0.5
  x=sample(1:nrow(t),round(nrow(t)*y))  # Sample 50% of total rows, as y is 0.5
  t2=t[x, c(1,sample(139,5)+1)]     # Sample 5 columns randomly, leaving the first column which is the dependent variable
  dt=rpart(response~.,data=t2)   # Build a decision tree on the above subset of data (sample rows & columns)
  pred1=(predict(dt,test))  # Predict based on the tree just built
  test$prediction=(test$prediction+pred1)  # Add predictions of all the iterations of previously built decision trees
}
test$prediction = (test$prediction)/1000  
