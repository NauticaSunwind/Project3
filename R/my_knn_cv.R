#' k-Nearest Neighbors Cross-Validation
#'
#' This function predicts the class value cl by k-fold Cross-validation
#'          and k-nearest neighbors algorithms
#'
#' @param train a data frame
#' @param cl class value of training data
#' @param k_nn integer of the number of neighbors
#' @param k_cv integer of the number of folds
#' @keywords prediction
#'
#' @return A list object of result output
#'
#' @examples
#' my_knn_cv(iris[, 1:4], iris$Species, 1, 5)
#' my_knn_cv(iris[, 1:4], iris$Species, 5, 5)
#'
#' @import class randomForest stringr tidyverse
#'
#' @export
my_knn_cv <- function (train, cl, k_nn, k_cv) {
  ## Split data in k_cv parts, randomly
  fold <- sample(rep(1:k_cv, length = length(cl)) )
  data <- data.frame("x" = train, "y" = cl, "split" = fold)
  class <- c()
  cv_err <- rep(NA, k_cv)
  fold_1 <- length(cl) / k_cv
  ##Iterate through i = 1 to k_cv
  for (i in 1:k_cv) {
    ##Predict the class of the ith fold using all other folds as the training data.
    data_train <- data %>% filter(split != i)
    data_test <- data %>% filter(split == i)
    y_hat <- as.character(knn(data_train[, 1:4], data_test[, 1:4], data_train$y,                               k_nn))
    class <- c(class, y_hat)
    ##Record the prediction and the misclassification rate
    cv_err[i] = sum(as.numeric(y_hat != as.character(data_test$y))) / fold_1
  }
  y_hat <- as.character(knn(train = train, cl = cl, test = train, k = k_nn))
  train_err <- sum(as.numeric(y_hat != as.character(cl))) / length(cl)
  print(train_err)
  ## Store the vector class as the output of knn() with the full data as both the training and the test data, and the value cv_error as the average misclassification rate
  output <- list("Class" = class, "cv_err" = mean(cv_err), "te" = train_err)
  return(output)
}
