# Lets generate dataset randomly
x=runif(1000)
y=runif(1000)

data=cbind(x,y)
# One would have to specify the dataset along with # of clusters in input
km=kmeans(data,2)

str(km)




value_k=c()
value_metric=c()

x=runif(10000)
y=runif(10000)

data=cbind(x,y)

for(i in 1:100){
  km=kmeans(data,i)
  value_k=c(value_k,i)
  metric=km$tot.withinss/km$totss
  value_metric=c(value_metric,metric)
}

plot(value_k,value_metric)