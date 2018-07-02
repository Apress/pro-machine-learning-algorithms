data=read.csv("D:/Pro ML book/linear_reg_example.csv")
# Creating a correlated variable
data$correlated_age = data$Age*0.5 + rnorm(nrow(data))*0.1
cor(data$Age,data$correlated_age)
# Building a linear regression
lm=glm(Weight~Age+correlated_age,data=data)
summary(lm)