

mnist <- load_mnist()

X_train <- array(mnist$X_train, dim = c(dim(mnist$X_train), 1)) / 255
Y_train <- to_categorical(mnist$Y_train, 10)
X_test <- array(mnist$X_test, dim = c(dim(mnist$X_test), 1)) / 255
Y_test <- to_categorical(mnist$Y_test, 10)

model <- Sequential()

model$add(Conv2D(filters = 32, kernel_size = c(3, 3),input_shape = c(28, 28, 1)))
model$add(Activation("relu"))
model$add(MaxPooling2D(pool_size=c(2, 2)))
model$add(Flatten())
model$add(Dense(128))
model$add(Activation("relu"))
model$add(Dense(10))
model$add(Activation("softmax"))
model$summary()

keras_compile(model,  loss = 'categorical_crossentropy', optimizer = Adam(),metrics='categorical_accuracy')
keras_fit(model, X_train, Y_train, batch_size = 1024, epochs = 5, verbose = 1,validation_data = list(X_test,Y_test))
