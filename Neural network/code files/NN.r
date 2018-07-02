library(kerasR)
mnist <- load_mnist()
X_train <- mnist$X_train
Y_train <- mnist$Y_train
X_test <- mnist$X_test
Y_test <- mnist$Y_test

X_train <- array(X_train, dim = c(dim(X_train)[1], 784))
X_test <- array(X_test, dim = c(dim(X_test)[1], 784))

X_train <- X_train/255
X_test <- X_test/255

Y_train <- to_categorical(mnist$Y_train, 10)
Y_test <- to_categorical(mnist$Y_test, 10)



model <- Sequential()
model$add(Dense(units = 1000, input_shape = dim(X_train)[2], activation = "relu"))
model$add(Dense(10,activation = "softmax"))

model$summary()

keras_compile(model,  loss = 'categorical_crossentropy', optimizer = Adam(),metrics='categorical_accuracy')

keras_fit(model, X_train, Y_train,batch_size = 1024, epochs = 5,verbose = 1, validation_data = list(X_test,Y_test))
