t=read.csv("D:/book/Recommender systems/movie_rating.csv")
library(reshape2)
library(recommenderlab)
# user based filering
t2=acast(t,critic~title)
t2
#Convert it to a matrix
R<-as.matrix(t2)

# Convert R into realRatingMatrix structure
# realRatingMatrix is a recommenderlab sparse-matrix like data structure

r<-as(R,"realRatingMatrix")

# Implement the UBCF method
rec=Recommender(r[1:nrow(r)],method="UBCF")

# Predict the missing rating
recom<-predict(rec,r[1:nrow(r)],type="ratings")
str(recom)
