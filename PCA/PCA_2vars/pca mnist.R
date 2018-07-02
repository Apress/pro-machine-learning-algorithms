# Load dataset
t=read.csv("D:/Pro ML book/PCA/train.csv")
# Keep the independent variables only, as PCA is on indep. vars
t$Label = NULL
# scale dataset by 255, as it is the mximum possible value in pixels
t=t/255
# Apply PCA
pca=prcomp(t)
str(pca)
# Check the variance explained
cumsum((pca$sdev)^2)/sum(pca$sdev^2)
