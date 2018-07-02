data=read.csv("D:/Pro ML book/Linear regression/linear_multi_reg_example.csv")
lm=glm(Weight~Age+New,data=data)
summary(lm)