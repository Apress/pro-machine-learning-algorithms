t=read.csv("D:/Pro ML book/Random forest/titanic_train.csv")
head(t)
t2=na.omit(t)
t2$Survived=as.factor(t2$Survived)
library(randomForest)
rf=randomForest(Survived~Pclass+Sex+Age+SibSp+Parch+Fare+Embarked
                ,data=t2,ntree=10)

importance(rf)

library(rpart)
samp=sample(nrow(t2),600)
train=t2[samp,]
test=t2[-samp,]
dt=rpart(Survived~Sex,data=train)
pred=predict(dt,test)
table(pred[,1],test$Survived)

library(ROCR)
pred_ROCR <- prediction(pred[,2], test$Survived)
auc_ROCR <- performance(pred_ROCR, measure = "auc")
auc_ROCR@y.values[[1]]

auc=c()
no_of_trees=c()
for (i in 1:20){
  rf=randomForest(Survived~Pclass+Sex+Age+SibSp+Parch+Fare+Embarked
                  ,data=train,ntree=(10*i))
  pred=predict(rf,test,type="prob")
  pred_ROCR <- prediction(pred[,2], test$Survived)
  auc_ROCR <- performance(pred_ROCR, measure = "auc")
  auc=c(auc,auc_ROCR@y.values[[1]])
  no_of_trees=c(no_of_trees,(10*i))
}
plot(no_of_trees,auc)




auc=c()
node_size=c()
for (i in 1:100){
  rf=randomForest(Survived~Pclass+Sex+Age+SibSp+Parch+Fare+Embarked
                  ,data=train,nodesize=(5*i),ntree=200)
  pred=predict(rf,test,type="prob")
  pred_ROCR <- prediction(pred[,2], test$Survived)
  auc_ROCR <- performance(pred_ROCR, measure = "auc")
  auc=c(auc,auc_ROCR@y.values[[1]])
  node_size=c(node_size,(5*i))
}
plot(node_size,auc)
