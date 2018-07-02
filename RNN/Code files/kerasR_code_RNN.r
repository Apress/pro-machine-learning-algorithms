library(kerasR)
imdb <- load_imdb(num_words = 500, maxlen = 100)

X_train <- pad_sequences(imdb$X_train[1:4000], maxlen = 100)
Y_train <- imdb$Y_train[1:4000]
X_test <- pad_sequences(imdb$X_train[4001:5736], maxlen = 100)
Y_test <- imdb$Y_train[4001:5736]

model <- Sequential()

model$add(Embedding(500, 32, input_length = 100, input_shape = c(100)))

model$add(LSTM(32))

model$add(Dense(256))
model$add(Activation('relu'))
model$add(Dense(1))
model$add(Activation('sigmoid'))
model$summary()

keras_compile(model,  loss = 'binary_crossentropy', optimizer = Adam(),metrics='binary_accuracy')
keras_fit(model, X_train, Y_train, batch_size = 1024, epochs = 50, verbose = 1,validation_data = list(X_test,Y_test))
		  