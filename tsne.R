library(IMIFA)

data("USPSdigits")
usps <- list()
usps$data <- (as.matrix(rbind(USPSdigits$train[, -1], USPSdigits$test[, -1])) - -1) * 255 / 2
usps$label <- c(USPSdigits$train[, 1], USPSdigits$test[, 1])
usps$test <- c(rep(0, nrow(USPSdigits$train)), rep(1, nrow(USPSdigits$test)))

# split into test and training
train_ind <- usps$test == 0
usps_train <- usps$data[train_ind,]
usps_train_label <- usps$label[train_ind]
usps_test <- usps$data[!train_ind,]
usps_test_label <- usps$label[!train_ind]

usps_i <- usps$data[usps$label == 1, ]

library(dimRed)
Isomap(usps_i)
library(plot3D)