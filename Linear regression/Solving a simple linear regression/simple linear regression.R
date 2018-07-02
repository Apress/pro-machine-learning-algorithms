data=read.csv("D:/Pro ML book/linear_reg_example.csv")
lm=glm(Weight~Age,data=data)
summary(lm)

#Extracting residuals
data$prediction=predict(lm,data)
data$residual = data$Weight - data$prediction
summary(data$residual)

# Extracting the standard deviation of coefficients
samp_coef=c()
for(i in 1:100){
  samp=sample(nrow(data),0.5*nrow(data))
  data2=data[samp,]
  lm=lm(Weight~Age,data=data2)
  samp_coef=c(samp_coef,lm$coefficients['Age'])
}
sd(samp_coef)

# SSE of residuals
sum((data$prediction-data$Weight)^2)

#Null deviance
data$prediction = mean(data$Weight)
sum((data$prediction-data$Weight)^2)
