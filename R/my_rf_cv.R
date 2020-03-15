#' Random Forest Cross Validation Function
#'
#' This function predicts the class value cl by k-fold Cross-validation
#'          and random forest algorithms
#' @param k integer of the number of folds
#' @keywords prediction
#'
#' @return a double of mean of MSE for all folds output error
#'
#' @examples
#' my_rf_cv(5)
#'
#' @import class randomForest stringr tidyverse
#'
#' @export
my_rf_cv <- function(k) {
  ## Split data in k parts, randomly
  l <- length(iris$Species)
  fold <- sample(rep(1:k, length = l))
  data <- data.frame(iris, "split" = fold)
  mse <- c()
  ##Iterate through i = 1 to k
  for (i in 1:k) {
    ##Define the training data as all the data not in the ith fold
    data_train <- data %>% filter(split != i)
    data_test <- data %>% filter(split == i)
    ##Train a random forest model with 100trees to predict Sepal.Length using covariates Sepal.Width, Petal.Length, and Petal.Width
    my_model <- randomForest(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = data_train, ntree = 100)
    ##Predict the Sepal.Length of the ith fold which was not used as training data
    my_pred <- predict(my_model, data_test[, 2:4])
    ##Evaluate the MSE, the average squared difference between predicted Sepal.Length and true Sepal.Length
    mse <- c(mse, mean((my_pred - iris$Sepal.Length)^2))
  }
  output <- mean(mse)
  return(output)
}
