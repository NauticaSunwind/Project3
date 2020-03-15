#' Fitting a linear model
#'
#' This function performs a linear regression model
#'
#' @param formula a formula class object
#' @param data input dataset
#' @keywords inference
#'
#' @return a table with estimate, std error, tvalue and Pr>|t| of each coefficient
#'
#' @examples
#' my_lm(mpg ~ hp + wt, data = mtcars)
#'
#' @export
my_lm <- function(formula, data) {
  ##Extract the model matrix X
  X <- model.matrix(object = formula, data = data)
  ##Extract the model response Y
  Y <- model.response(model.frame(formula, data))
  ##Calculate estimate B
  B <- solve(t(X) %*% X) %*% t(X) %*% Y
  ##Calculate df and se, the std error
  df <- nrow(data) - nrow(B)
  sigma2 <- sum((Y - X %*% B)^2 / df)
  se <- sqrt(diag(sigma2 * solve(t(X) %*% X)))
  ##Calculate t value
  t_value <- B / se
  ##Calculate Pr>|t|
  p <- 2 * pt(abs(t_value), df, lower.tail = FALSE)
  ##Bind these four results together as a table, label column names
  A <- cbind(B, se, t_value, p)
  colnames(A) <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)")
  return(A)
}
