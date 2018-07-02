# Matrix factorization
t=read.csv("D:/book/Recommender systems/movie_rating.csv")
library(reshape2)
library(recommenderlab)

t2=acast(t,critic~title)
t2

# Convert it as a matrix
R<-as.matrix(t2)
# Convert R into realRatingMatrix data structure
# RealRatingMatrix is a recommenderlab sparse-matrix like data-structure
r <- as(R, "realRatingMatrix")


fsvd<- funkSVD(r, k=2,verbose = TRUE)

p <- predict(fsvd, r, verbose = TRUE)
p

str(fsvd)
