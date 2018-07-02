data=read.csv("D:/Pro ML book/Logistic regression/iris_sample.csv")
lm=glm(Setosa~.,data=data,family=binomial(logit))
summary(lm)
