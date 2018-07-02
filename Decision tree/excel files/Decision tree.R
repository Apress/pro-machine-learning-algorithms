t=read.csv("D:/Pro ML book/Decision tree/dt_continuous_dep_discrete_indep.csv")
library(rpart)
fit=rpart(response~var,method="anova",data=t
          ,control=rpart.control(minsplit=1,minbucket=2,
                                 maxdepth=2))
plot(fit, margin=0.2)
text(fit, cex=.8)
